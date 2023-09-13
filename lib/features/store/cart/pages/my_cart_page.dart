import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_text.dart';
import '../Cubit/my_cart_cubit.dart';

class MyCartPage extends StatefulWidget {
  final bool? dest;
  final bool isReview;

  const MyCartPage({
    Key? key,
    this.dest,
    required this.isReview,
  }) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  double total = 0;
  int idProduct = 0;

  @override
  void initState() {
    final cart = MyCartCubit.get(context).getCart();
    for (var item in cart) {
      total += item.counter! * item.price!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Column(
          children: [
            20.verticalSpace,
            CustomText(
              txt: AppStrings.cart,
              fontSize: 30.sp,
              fontWeight: FontWeight.w400,
            ),
            BlocBuilder<MyCartCubit, MyCartState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: REdgeInsetsDirectional.only(
                            top: 30, start: 20, end: 27),
                        width: MediaQuery.sizeOf(context).width,
                        height: 640,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(46.r),
                              topLeft: Radius.circular(46.r),
                            )),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.productsCart.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cartCubit =
                                BlocProvider.of<MyCartCubit>(context);
                            final cart = state.productsCart[index];
                            return Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: ColorManager.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: REdgeInsetsDirectional.only(
                                        top: 10, start: 10, end: 10),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      child: Image.network(
                                        fit: BoxFit.fill,
                                        alignment: Alignment.center,
                                        cart.image!,
                                        width: 80.w,
                                        height: 95.h,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: REdgeInsetsDirectional.only(
                                      top: 20,
                                      bottom: 5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(txt: '${cart.category}'),
                                        30.verticalSpace,
                                        CustomText(
                                          txt: '${cart.price}\$',
                                          txtColor: ColorManager.primary,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: REdgeInsetsDirectional.only(
                                        start: 5, end: 5),
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              final cart = cartCubit.getCart();
                                              final product = ProductCart(
                                                id: cart[index].id!,
                                                category: cart[index].category!,
                                                image: cart[index].image,
                                                price: cart[index].price!,
                                                counter: cart[index].counter,
                                                title: cart[index].title,
                                              );
                                              cartCubit.addToCart(
                                                  cart, product);
                                              idProduct = product.id!;
                                              // total = 0;
                                              for (var element in cart) {
                                                var mul = element.counter! *
                                                    element.price!;
                                                total += mul;
                                                print(mul);
                                              }
                                              print(total);
                                            },
                                            icon: Icon(
                                              Icons.add_circle,
                                              color: ColorManager.primary,
                                            )),
                                        CustomText(
                                            txt: cart.counter.toString()),
                                        IconButton(
                                            onPressed: () {
                                              final cart = cartCubit.getCart();
                                              final product = ProductCart(
                                                id: cart[index].id!,
                                                category: cart[index].category!,
                                                image: cart[index].image,
                                                price: cart[index].price!,
                                                counter: cart[index].counter,
                                                title: cart[index].title,
                                              );
                                              idProduct = product.id!;
                                              cartCubit.decreaseFromCart(
                                                  cart, product);
                                              total = 0;
                                              for (var element in cart) {
                                                var mul = element.counter! *
                                                    element.price!;
                                                total += mul;
                                              }
                                            },
                                            icon: Icon(
                                              Icons.remove_circle_outlined,
                                              color: ColorManager.primary,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    if (!widget.isReview)
                      Container(
                        margin: REdgeInsetsDirectional.only(
                            top: 643, end: 0, start: 0),
                        padding:
                            REdgeInsetsDirectional.only(start: 20, end: 20),
                        width: MediaQuery.sizeOf(context).width,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withOpacity(0.9),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  ColorManager.secondaryGrey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r),
                            // bottomRight: Radius.circular(15.r),
                            // bottomLeft: Radius.circular(15.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              textAlign: TextAlign.end,
                              txt: AppStrings.totalPrice,
                              txtColor: ColorManager.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  textAlign: TextAlign.end,
                                  txt: '$total',
                                  txtColor: ColorManager.white,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      MyCartCubit.get(context).clearCart();
                                    },
                                    child: Image.asset(
                                      ImageAssets.trash,
                                      height: 25,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
