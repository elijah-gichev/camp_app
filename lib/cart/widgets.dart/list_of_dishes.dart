import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dish_card.dart';

class ListOfDishes extends StatelessWidget {
  const ListOfDishes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryCard> _getCart() {
      List<CategoryCard> dishes = [];

      dishes.add(CategoryCard(
        name: 'Лечение заболеваний опорно-двигательного аппарата',
        reaction: '😍',
        isRecommended: true,
        imagePath: 'assets/images/image1.png',
        pressUp: () {},
        pressDown: () {},
      ));

      dishes.add(CategoryCard(
        name: 'Лечение заболеваний опорно-двигательного аппарата',
        reaction: '😇',
        isRecommended: true,
        imagePath: 'assets/images/image2.png',
        pressUp: () {},
        pressDown: () {},
      ));
      dishes.add(CategoryCard(
        name: 'Лечение заболеваний опорно-двигательного аппарата',
        reaction: '😎',
        isRecommended: true,
        imagePath: 'assets/images/image3.png',
        pressUp: () {},
        pressDown: () {},
      ));
      dishes.add(CategoryCard(
        name: 'Лечение заболеваний опорно-двигательного аппарата',
        reaction: '😆',
        isRecommended: true,
        imagePath: 'assets/images/image4.png',
        pressUp: () {},
        pressDown: () {},
      ));

      return dishes;
    }

    return Column(
      children: [
        ..._getCart().map((cart) {
          return Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: cart,
          );
        })
      ],
    );
  }
}
