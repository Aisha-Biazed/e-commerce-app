import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manger.dart';

class SearChBar extends StatefulWidget {
  const SearChBar({Key? key}) : super(key: key);

  @override
  State<SearChBar> createState() => _SearChBarState();
}

class _SearChBarState extends State<SearChBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (value) {
      //   print(value);
      //   // void _filterList(String searchQuery) {
      //   _searchResult.clear();
      //   if (value.isNotEmpty) {
      //     ListProduct?.forEach((item) {
      //       if (
      //           // item!.title!.contains(value)
      //           //     ||
      //           item.price.toString()!.contains(value)
      //           // ||item.post!.postsable!.roomNumber!.toString().contains(searchQuery)
      //           ) {
      //         setState(() {
      //           _searchResult.add(item);
      //         });
      //       } else {
      //         setState(() {
      //           // _searchResult.clear();
      //         });
      //         print("No Content");
      //       }
      //       // if (item.user!.name!.toLowerCase().contains(searchQuery.toLowerCase())) {
      //       //   _searchResult.add(item);
      //       // }
      //     });
      //   } else {
      //     setState(() {
      //       _searchResult.addAll(ListProduct as Iterable<AllProduct>);
      //     });
      //   }

      // }
      // },
      // AppCubit.get(context).functionSearch(value: value,context: context);
      autocorrect: true,
      textInputAction: TextInputAction.search,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        hintText: AppStrings.search,
        hintStyle: TextStyle(
            fontSize: 16,
            height: 2,
            color: ColorManager.dark,
            fontFamily: 'Poppins'),
        suffixIcon: Icon(
          Icons.search,
          size: 30,
          color: ColorManager.dark,
        ),
      ),
    );
  }
}
