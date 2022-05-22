import 'package:camp_app/cart/widgets.dart/children_payment_dialog.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChildrenCategoryCard extends StatelessWidget {
  final String name;
  final String reaction;
  final bool isRecommended;

  final String imagePath;

  final VoidCallback onTap;

  const ChildrenCategoryCard({
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
          color: KidTheme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: KidTheme.of(context).buttonTextColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              // offset: kidCardTransformer?.shadowOffset == null
              //     ? Offset.zero
              //     : Offset(
              //         sin(4 * pi * kidCardTransformer!.shadowOffset!) * 2,
              //         cos(6 * pi * kidCardTransformer!.shadowOffset!) * 2,
              //       ),
            ),
          ],
        ),
        width: 340.w,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.w),
              width: 320.w,
              decoration: BoxDecoration(
                //color: KidTheme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        //color: KidTheme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            width: 65.w,
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
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.h,
                                    color: KidTheme.of(context).cardTextColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  'Меняет цвет приложения',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.h,
                                    color: KidTheme.of(context).cardTextColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  '155 k',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 21,
                                    color: KidTheme.of(context).cardTextColor,
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
            Positioned(
              left: 0,
              child: CircleAvatar(
                backgroundColor: KidTheme.of(context).buttonColor,
                radius: 38.r,
                //backgroundImage: AssetImage(imagePath),
              ),
            ),
            if (KidTheme.of(context).isLight)
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  child: Container(
                    width: 65.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                      color: KidTheme.of(context).buttonTextColor,
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: const Center(
                          child: Text(
                        'Купить',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                      onTap: () async {
                        final bool? agree = await showDialog(
                          context: context,
                          builder: (_) => ChildrenPaymentDialog(),
                        );

                        if (agree == true) {
                          // купили
                          KidTheme.changeToBlackTheme(context);
                        }
                      },
                    ),
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
