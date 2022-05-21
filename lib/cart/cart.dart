import 'package:camp_app/cart/cart_bloc/cart_bloc.dart';
import 'package:camp_app/cart/controllers/selector_controller.dart';
import 'package:camp_app/cart/widgets.dart/dish_selector.dart';
import 'package:camp_app/cart/widgets.dart/list_of_dishes.dart';
import 'package:camp_app/cart/widgets.dart/navbar.dart';
import 'package:camp_app/cart/widgets.dart/search_input.dart';
import 'package:camp_app/cart/widgets.dart/title_block.dart';
import 'package:camp_app/core/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                Container(
                  width: 330.w,
                  child: SearchInput(
                    textEditingController: TextEditingController(),
                  ),
                ),
                ChangeNotifierProvider(
                  create: (context) => SelectorController(),
                  child: const DishSelector(),
                ),
                const Expanded(
                  child: SingleChildScrollView(
                    child: ListOfDishes(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
