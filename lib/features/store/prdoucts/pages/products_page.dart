import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/store/cart/pages/my_cart_page.dart';
import 'package:e_commerce_app/features/store/prdoucts/cubit/products_cubit.dart';
import 'package:e_commerce_app/features/store/prdoucts/pages/details_products.dart';
import 'package:e_commerce_app/features/store/prdoucts/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manger.dart';
import '../../cart/Cubit/my_cart_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsCubit.get(context).productsCubit();
    return Scaffold(
      appBar: CustomAppBar(),
      body:
          BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        if (state is ProductsSuccessState) {
          final item = state.result;
          return Container(
            color: Colors.white,
            child: StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 2,
              itemCount: item.length,
              itemBuilder: (context, index) => buildImageCard(
                  item[index].image!,
                  item[index].category!,
                  item[index].description!,
                  item[index].title!,
                  item[index].price!,
                  item[index].id!,
                  context),
            ),
          );
        } else {
          return Center(
            child: SpinKitFadingCircle(
              color: ColorManager.grey,
            ),
          );
        }
      }),
    );
  }

  Widget buildImageCard(String image, String category, String description,
          String title, double price, int id, BuildContext context) =>
      Card(
        color: ColorManager.mainGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          child: ClipRRect(
              // clip the image to a circle
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductsDetails(
                                    image: image,
                                    title: title,
                                    description: description,
                                    category: category,
                                    price: price,
                                    id: id,
                                  )));
                    },
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomText(
                    txt: category,
                    fontSize: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        final cartCubit = BlocProvider.of<MyCartCubit>(context);
                        final cart = cartCubit.getCart();
                        print(cart);
                        final product = ProductCart(
                          category: category,
                          image: image,
                          price: price,
                          counter: 1,
                          id: id,
                          title: title,
                        );
                        cartCubit.addToCart(cart, product);
                        print("${product.price} ");
                        if (RegExp(r'^[a-z]').hasMatch(category)) {
                          BotToast.showText(
                              text: ' للسلة $category تمت إضافة ');
                        } else {
                          BotToast.showText(
                              text: ' تمت إضافة $category للسلة ');
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyCartPage(
                                isReview: false,
                              ),
                            ));
                      },
                      icon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            txt: AppStrings.addToCart,
                            fontSize: 16,
                          ),
                          5.horizontalSpace,
                          Icon(
                            Icons.add_circle_outline_sharp,
                            color: ColorManager.primary,
                            size: 25.w,
                          ),
                        ],
                      ))
                ],
              )),
        ),
      );
}
