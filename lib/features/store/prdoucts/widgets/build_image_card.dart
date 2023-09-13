import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../common/models/products_model.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../cart/Cubit/my_cart_cubit.dart';

Widget buildImageCard(ProductsModel item, BuildContext context) => Card(
      color: ColorManager.mainGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: const EdgeInsets.all(6),
        child: ClipRRect(
            // clip the image to a circle
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go(
                        "${GRouter.config.productRoutes.productScreen}/${GRouter.config.productRoutes.productDetails}",
                        extra: item);
                  },
                  child: Image.network(
                    item.image!,
                    fit: BoxFit.cover,
                  ),
                ),
                5.horizontalSpace,
                CustomText(
                  txt: item.category!,
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    5.horizontalSpace,
                    CustomText(
                      txt: '\$${item.price.toString()}',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        final cartCubit = BlocProvider.of<MyCartCubit>(context);
                        final cart = cartCubit.getCart();
                        print(cart);
                        final product = ProductCart(
                          category: item.category,
                          image: item.image,
                          price: item.price,
                          counter: 1,
                          id: item.id,
                          title: item.title,
                        );
                        cartCubit.addToCart(cart, product);
                        print("${product.price} ");
                        if (RegExp(r'^[a-z]').hasMatch(item.category!)) {
                          BotToast.showText(
                            text:
                                ' ${AppStrings.added} ${item.category} ${AppStrings.toCart} ',
                          );
                        } else {
                          BotToast.showText(
                            text:
                                '${AppStrings.added}${item.category}${AppStrings.toCart} ',
                          );
                        }
                      },
                      icon: Icon(
                        // LineIcons.addToShoppingCart,
                        Icons.shopping_cart_checkout_outlined,
                        color: ColorManager.dark,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
