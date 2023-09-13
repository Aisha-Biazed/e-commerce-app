import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../common/models/products_model.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manger.dart';
import '../../cart/Cubit/my_cart_cubit.dart';
import '../../cart/pages/my_cart_page.dart';
import '../widgets/custom_button.dart';

class ProductsDetailsPage extends StatelessWidget {
  const ProductsDetailsPage({Key? key, required this.pro}) : super(key: key);
  final ProductsModel pro;
  Widget buildSliverAppBar() {
    return SliverAppBar(
        expandedHeight: 600.0,
        pinned: true,
        stretch: true,
        backgroundColor: ColorManager.white,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Hero(
            tag: pro.category!,
            child: Image.network(
              pro.image!,
              fit: BoxFit.contain,
            ),
          ),
        ));
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
                      CustomText(
                        txt: pro.title!,
                        height: 2,
                        fontWeight: FontWeight.w800,
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          CustomText(
                            txt: pro.category!,
                            txtColor: ColorManager.secondaryGrey,
                            fontSize: 18,
                          ),
                          const Spacer(),
                          Icon(
                            LineIcons.starAlt,
                            color: ColorManager.amber,
                          ),
                          CustomText(
                            txt: pro.rating!.rate.toString(),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          5.horizontalSpace,
                          CustomText(
                            txt:
                                '(${pro.rating!.count.toString()} ${AppStrings.reviews})',
                            txtColor: ColorManager.secondaryGrey,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      const CustomText(
                        txt: AppStrings.information,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                      CustomText(
                        txt: pro.description!,
                        txtColor: ColorManager.secondaryGrey,
                        fontSize: 17,
                        height: 2,
                      ),
                      10.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            txt: '\$${pro.price.toString()}',
                            txtColor: ColorManager.dark,
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                          ),
                          // 10.horizontalSpace,
                          Expanded(
                            child: Padding(
                              padding: REdgeInsetsDirectional.only(
                                  start: 90, end: 15, top: 0),
                              child: CustomOutlinedButton(
                                height: 52.h,
                                text: AppStrings.addToCart,
                                icon: Icons.add,
                                fontSize: 16,
                                color: ColorManager.btnColor,
                                onTap: () {
                                  final cartCubit =
                                      BlocProvider.of<MyCartCubit>(context);
                                  final cart = cartCubit.getCart();
                                  final product = ProductCart(
                                    category: pro.category,
                                    image: pro.image,
                                    price: pro.price,
                                    counter: 1,
                                    id: pro.id,
                                    title: pro.title,
                                  );
                                  cartCubit.addToCart(cart, product);
                                  print("${product.price} ");
                                  if (RegExp(r'^[a-z]')
                                      .hasMatch(pro.category!)) {
                                    BotToast.showText(
                                        text:
                                            '${AppStrings.added}${pro.category}${AppStrings.toCart} ');
                                  } else {
                                    BotToast.showText(
                                        text:
                                            '${AppStrings.added}${pro.category}${AppStrings.toCart} ');
                                  }
                                  // context.go(
                                  //     "${GRouter.config.productRoutes.productScreen}/${GRouter.config.productRoutes.productDetails}/${GRouter.config.productRoutes.cart}",
                                  //     extra: false);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MyCartPage(isReview: false),
                                      ));
                                },
                              ).animate().flipV(
                                  delay: const Duration(milliseconds: 700)),
                            ),
                          ),
                        ],
                      ),
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
