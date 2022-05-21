import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String reaction;
  final bool isRecommended;

  final String imagePath;

  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.reaction,
    required this.isRecommended,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 340.w,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.w),
              width: 320.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            width: 220.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 16.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  'Реакция ребенка: ' + reaction,
                                  style: TextStyle(
                                    fontSize: 14.h,
                                    color: const Color(0xffA3AEB2),
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                if (isRecommended)
                                  Text(
                                    '! Рекомендовано врачом',
                                    style: TextStyle(
                                      fontSize: 14.h,
                                      color: const Color(0xffF96145),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   left: 0,
            //   child: CircleAvatar(
            //     backgroundColor: Theme.of(context).primaryColor,
            //     radius: 38.r,
            //     backgroundImage: AssetImage(imagePath),
            //   ),
            // ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                child: Container(
                  width: 65.w,
                  height: 45.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                    color: Color(0xffFFEE94),
                  ),
                  child: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
