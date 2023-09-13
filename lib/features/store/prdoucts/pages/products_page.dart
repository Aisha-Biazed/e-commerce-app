import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/store/cart/pages/my_cart_page.dart';
import 'package:e_commerce_app/features/store/prdoucts/cubit/products_cubit.dart';
import 'package:e_commerce_app/features/store/prdoucts/pages/details_products_page.dart';
import 'package:e_commerce_app/features/store/prdoucts/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/store/prdoucts/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../common/models/products_model.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manger.dart';
import '../../cart/Cubit/my_cart_cubit.dart';
import '../widgets/build_image_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductsModel> _searchProducts = [];

  @override
  void initState() {
    super.initState();
    ProductsCubit.get(context).productsCubit();
    _searchProducts = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child:
          BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        if (state is ProductsSuccessState) {
          final item = state.result;
          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: CustomAppBar(
              textFiled: TextField(
                onChanged: (value) {
                  _searchProducts.clear();
                  if (value.isNotEmpty) {
                    for (var item in item) {
                      if (item.price.toString().contains(value) ||
                          item.category.toString().contains(value)) {
                        setState(() {
                          _searchProducts.add(item);
                        });
                      } else {
                        setState(() {});
                      }
                    }
                  } else {
                    setState(() {
                      _searchProducts.addAll(item);
                    });
                  }
                },
                autocorrect: true,
                textInputAction: TextInputAction.search,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: AppStrings.search,
                  hintStyle: TextStyle(
                      fontSize: 16,
                      color: ColorManager.dark,
                      fontFamily: 'Poppins'),
                  icon: Padding(
                    padding: REdgeInsetsDirectional.only(start: 20, end: 50),
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: ColorManager.dark,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                // context.goNamed(GRouter.config.productRoutes.cart,
                //     extra: false);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyCartPage(isReview: false),
                    ));
              },
            ),
            body: Container(
              color: Colors.white,
              child: StaggeredGridView.countBuilder(
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                itemCount: _searchProducts.isEmpty
                    ? item.length
                    : _searchProducts.length,
                itemBuilder: (context, index) => buildImageCard(
                    _searchProducts.isEmpty
                        ? item[index]
                        : _searchProducts[index],
                    context),
              ),
            ),
          );
        } else {
          return Center(
            child: SpinKitFadingFour(
              color: ColorManager.primary,
            ),
          );
        }
      }),
    );
  }
}
