import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/splash/cubit/splash_cubit.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final pages = [
  const PageData(
    icon: Icons.hdr_weak,
    title: "Drag and\ndrop to move",
    bgColor: Color(0xFFFFFFFF),
  ),
  const PageData(
    icon: Icons.bubble_chart,
    title: "Local news\nstories",
    bgColor: Color(0xFF0043D0),
    textColor: Colors.white,
  ),
  const PageData(
    icon: Icons.format_size,
    title: "Choose your\ninterests",
    description: " Long description Long description Long description Long description",
    textColor: Colors.white,
    bgColor: Color(0xFFFDBFDD),
  ),
];

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();

  @override
  void didChangeDependencies() {
    // не трогать, почему не перерисовывается
    Future.delayed(const Duration(milliseconds: 200)).then((_) => setState(
          () {},
        ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        pageController: pageController,
        colors: pages.map((p) => p.bgColor).toList(),
        radius: 0.12.sw,
        curve: Curves.ease,
        nextButtonBuilder: (context) => Icon(
          Icons.navigate_next,
          size: 0.1.sw,
        ),
        itemCount: pages.length,
        onFinish: context.read<SplashCubit>().fisrtLaunchHappend,
        duration: const Duration(milliseconds: 1500),
        // opacityFactor: 2.0,
        // scaleFactor: 0.2,
        // verticalPosition: 0.7,
        // direction: Axis.vertical,
        // itemCount: pages.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (index) {
          print(index);
          //inal page = pages[index];
          return OnboardingPageView(page: pages[index]);
        },
      ),
    );
  }
}

class OnboardingPageView extends StatefulWidget {
  final PageData page;

  const OnboardingPageView({Key? key, required this.page}) : super(key: key);

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 0.1.sh),
        _Image(
          page: widget.page,
          size: 190,
          iconSize: 170,
        ),
        SizedBox(height: 0.08.sh),
        // _Text(
        //   page: widget.page,
        //   text: widget.page.title,
        //   style: TextStyle(
        //     fontSize: 0.046.sh,
        //   ),
        // ),
        Text(
          widget.page.title ?? '',
          style: TextStyle(
            color: widget.page.textColor,
            fontWeight: FontWeight.w600,
            fontFamily: 'Helvetica',
            letterSpacing: 0.0,
            fontSize: 18,
            height: 1.2,
          ).merge(
            TextStyle(
              fontSize: 0.046.sh,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 0.02.sh),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: _Text(
            page: widget.page,
            text: widget.page.description,
            style: TextStyle(
              fontSize: 0.02.sh,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  final String? text;

  const _Text({
    Key? key,
    required this.page,
    required this.text,
    this.style,
  }) : super(key: key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        color: page.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Helvetica',
        letterSpacing: 0.0,
        fontSize: 18,
        height: 1.2,
      ).merge(style),
      textAlign: TextAlign.center,
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.size,
    required this.iconSize,
  }) : super(key: key);

  final PageData page;
  final double size;
  final double iconSize;

  Color get bgColor {
    return page.bgColor.withGreen(page.bgColor.green + 20).withRed(page.bgColor.red - 100).withAlpha(90);
  }

  Color get icon1Color {
    return page.bgColor.withBlue(page.bgColor.blue - 10).withGreen(220);
  }

  Color get icon2Color {
    return page.bgColor.withGreen(66).withRed(77);
  }

  Color get icon3Color {
    return page.bgColor.withRed(111).withGreen(220);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
        color: bgColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                page.icon,
                size: iconSize + 20,
                color: icon1Color,
              ),
            ),
            right: -5,
            bottom: -5,
          ),
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 5,
              child: Icon(
                page.icon,
                size: iconSize + 20,
                color: icon2Color,
              ),
            ),
          ),
          Icon(
            page.icon,
            size: iconSize,
            color: icon3Color,
          ),
        ],
      ),
    );
  }
}

class PageData {
  final String? title;
  final String? description;
  final IconData? icon;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.description,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}
