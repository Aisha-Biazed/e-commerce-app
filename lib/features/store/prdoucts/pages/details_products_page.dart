import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manger.dart';
import '../../cart/Cubit/my_cart_cubit.dart';
import '../../cart/pages/my_cart_page.dart';
import '../widgets/custom_button.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.id})
      : super(key: key);
  final String image;
  final String title;
  final String description;
  final String category;
  final double price;
  final int id;
  Widget buildSliverAppBar() {
    return SliverAppBar(
        elevation: 0.0,
        expandedHeight: 600.0,
        pinned: true,
        stretch: true,
        backgroundColor: ColorManager.white,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: CustomText(
            txt: category,
            txtColor: ColorManager.dark,
            fontSize: 25,
            // textAlign: TextAlign.start,
          ),
          background: Hero(
            tag: category,
            child: Image.network(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ));
  }

  Widget productsInfo(String title, String value) {
    return RichText(
      maxLines: 10,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: ColorManager.dark,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: ColorManager.secondaryGrey,
              fontFamily: 'Poppins',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30.0,
      endIndent: endIndent, // Yellow line
      color: ColorManager.primary,
      thickness: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 0.0),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      productsInfo(
                        AppStrings.description,
                        description,
                      ),
                      buildDivider(80.0),
                      productsInfo(
                        AppStrings.category,
                        category,
                      ),
                      buildDivider(270.0),
                      productsInfo(
                        AppStrings.title,
                        title,
                      ),
                      buildDivider(100.0),
                      productsInfo(AppStrings.price, price.toString()),
                      buildDivider(300.0),
                      20.verticalSpace,
                      CustomOutlinedButton(
                        text: AppStrings.addToCart,
                        icon: LineIcons.addToShoppingCart,
                        onTap: () {
                          final cartCubit =
                              BlocProvider.of<MyCartCubit>(context);
                          final cart = cartCubit.getCart();
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
                                builder: (context) => const MyCartPage(
                                  isReview: false,
                                ),
                              ));
                        },
                      )
                    ],
                  ),
                ),
                const RSizedBox(
                  height: 500.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
