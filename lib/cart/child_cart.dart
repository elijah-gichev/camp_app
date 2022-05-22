import 'package:camp_app/cart/controllers/selector_controller.dart';
import 'package:camp_app/cart/widgets.dart/children_category_selector.dart';
import 'package:camp_app/cart/widgets.dart/children_list_of_subcategories.dart';

import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChildCartPage extends StatelessWidget {
  final SelectorController selectorController = SelectorController();

  ChildCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: KidTheme.of(context).backgorundColor,
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    //padding: EdgeInsets.only(top: 20, left: 20.w),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              ChangeNotifierProvider.value(
                value: selectorController,
                child: const ChildrenCategorySelector(),
              ),
              ChangeNotifierProvider.value(
                value: selectorController,
                child: const Expanded(
                  child: SingleChildScrollView(
                    child: ChildrenListOfSubCategories(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
