import 'package:camp_app/cart/controllers/selector_controller.dart';
import 'package:camp_app/cart/widgets.dart/category_selector.dart';
import 'package:camp_app/cart/widgets.dart/list_of_subcategories.dart';

import 'package:camp_app/core/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final SelectorController selectorController = SelectorController();

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF5F5F5),
        child: Column(
          children: <Widget>[
            CampAppBar(
              text: 'Магазин услуг',
              trailing: Container(
                width: 55.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xff98D2F5),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Center(
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            // Container(
            //   width: 330.w,
            //   child: SearchInput(
            //     textEditingController: TextEditingController(),
            //   ),
            // ),
            ChangeNotifierProvider.value(
              value: selectorController,
              child: const CategorySelector(),
            ),
            ChangeNotifierProvider.value(
              value: selectorController,
              child: const Expanded(
                child: SingleChildScrollView(
                  child: ListOfSubCategories(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
