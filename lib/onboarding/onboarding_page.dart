import 'package:camp_app/auth/bloc/auth_bloc.dart';
import 'package:camp_app/auth/service/auth_service.dart';
import 'package:camp_app/auth/widgets/login_button.dart';
import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/core/enums/role.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/core/services/local_user_service.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/core/widgets/show_snackbar.dart';
import 'package:camp_app/main.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final pages = [
  const PageData(
    title: "ДЕТСКИЙ ОЗДОРОВИТЕЛЬНЫЙ САНАТОРИЙ \"ВИТА\"",
    titleColor: AppColors.blue,
    description:
        "Добро пожаловать в место, где мир принадлежит детям! Вита подарит вашему ребенку яркий и развивающий отдых!",
    imageRes: "assets/images/vita_logo.png",
    imageBgColor: Color.fromRGBO(206, 236, 253, 1),
    bgColor: Colors.white,
  ),
  const PageData(
    title: "Лучший пляж на побережье",
    titleColor: AppColors.white,
    description:
        "Огороженная территория с теневыми навесами, биотуалетами, медпунктами и безопасной зоной для купания",
    descriptionColor: Colors.white,
    imageRes: "assets/images/beach.webp",
    imageBgColor: Colors.white,
    bgColor: Color.fromRGBO(255, 196, 115, 1),
  ),
  const PageData(
    title: "Видео наблюдение",
    titleColor: AppColors.blue,
    description:
        "Сеть камер охватывает внутреннюю и прилегающую территорию.",
    imageRes: "assets/images/camera.webp",
    imageBgColor: Colors.white,
    bgColor: Color.fromRGBO(206, 236, 253, 1),
  ),
  const PageData(
    title: "Медицинский контроль",
    titleColor: AppColors.white,
    description:
    "Мы знаем, как подобрать индивидуальный курс лечения каждому ребенку",
    descriptionColor: Colors.white,
    imageRes: "assets/images/medical_control.webp",
    imageBgColor: Colors.white,
    bgColor: Color.fromRGBO(255, 196, 115, 1),
  ),
  const PageData(
    title: "Праздник каждый день",
    titleColor: AppColors.blue,
    description:
    "Впечатления и эмоции - вот что запоминается больше всего. Воспоминаний хватит на целый год.",
    imageRes: "assets/images/holiday.webp",
    imageBgColor: Color.fromRGBO(206, 236, 253, 1),
    bgColor: Colors.white,
  ),
  const PageData(
    imageRes: "assets/images/vita_logo_white.png",
    imageBgColor: Colors.transparent,
    title: "Вы можете войти в следующие аккаунты",
    titleColor: Colors.white,
    bgColor: Color.fromRGBO(77, 93, 250, 1),
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
        //onFinish: context.read<SplashCubit>().fisrtLaunchHappend,
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
          return OnboardingPageView(
            isLast: index == (pages.length - 1),
            page: pages[index],
          );
        },
      ),
    );
  }
}

class OnboardingPageView extends StatefulWidget {
  final PageData page;
  final bool isLast;

  const OnboardingPageView({Key? key, required this.isLast, required this.page})
      : super(key: key);

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
        Padding(
          padding: const EdgeInsets.only(left: 36, right: 36),
          child: Text(
            widget.page.title,
            style: TextStyle(
              color: widget.page.titleColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.0,
              fontSize: 18,
              height: 1.2,
            ).merge(
              TextStyle(
                fontSize: 0.026.sh,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 0.02.sh),
        if (widget.isLast)
          BlocProvider(
            create: (_) => AuthBloc(
              authService: getIt<AuthService>(),
              userService: getIt<UserService>(),
              dioService: getIt<DioService>(),
              localUserService: getIt<LocalUserService>(),
            )..add(AuthCheckIsLogged()),
            child: const LoginModule(),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: _Text(
            page: widget.page,
            text: widget.page.description,
            style: TextStyle(
              fontSize: 0.02.sh,
              fontWeight: FontWeight.w400,
            ).merge(TextStyle(color: widget.page.descriptionColor)),
          ),
        ),
      ],
    );
  }
}

class LoginModule extends StatelessWidget {
  const LoginModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<AuthBloc, AuthState>(
    //   builder: (context, state) {
    // if (state is AuthLoading) {
    //   return const Expanded(
    //     child: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    //     } else {
    //       return Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Text(
    //             'Login',
    //             style: TextStyle(
    //               fontSize: 36.sp,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 10.h,
    //           ),
    //           Text(
    //             'Welcome',
    //             style: TextStyle(
    //               fontSize: 16.sp,
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //           SizedBox(
    //             height: 47.h,
    //           ),
    //           LoginInput(phoneNumberController: phoneNumberController),
    //           SizedBox(
    //             height: 27.h,
    //           ),
    //           BlocBuilder<AuthBloc, AuthState>(
    //             builder: (context, state) {
    //               return LoginButton(
    //                 onPressed: () {
    //                   final phoneNumber = phoneNumberController.text;

    //                   context.read<AuthBloc>().add(
    //                         AuthInProgress(
    //                           phone: phoneNumber,
    //                         ),
    //                       );
    //                 },
    //                 isLoading: state is AuthLoading,
    //               );
    //             },
    //           ),
    //           SizedBox(
    //             height: 60.h,
    //           ),
    //           SizedBox(
    //             height: 27.h,
    //           ),
    //         ],
    //       );
    //     }
    //   },
    // );
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingFailure) {
          showSnackBar(context: context, message: state.msg);
        }

        if (state is AuthLoadingDone) {
          if (state.user.role == Role.parent) {
            Navigator.pushNamed(context, Routes.mainPage);
          } else {
            Navigator.pushNamed(context, Routes.kidMain);
          }
        }

        if (state is AuthAlreadyLogged) {
          if (state.user.role == Role.parent) {
            Navigator.pushNamed(context, Routes.mainPage);
          } else {
            Navigator.pushNamed(context, Routes.kidMain);
          }
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: 0.8.sw,
              height: 45.h,
              child: LoginButton(
                text: 'Перейти к родителю',
                onPressed: () {
                  final phoneNumber = '84067978373';

                  context.read<AuthBloc>().add(
                        AuthInProgress(
                          phone: phoneNumber,
                        ),
                      );
                },
                isLoading: state is AuthLoading,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: 0.8.sw,
              height: 45.h,
              child: LoginButton(
                text: 'Перейти к ребенку',
                onPressed: () {
                  final phoneNumber = '89559239857';

                  context.read<AuthBloc>().add(
                        AuthInProgress(
                          phone: phoneNumber,
                        ),
                      );
                },
                isLoading: state is AuthLoading,
              ),
            ),
            SizedBox(height: 10.h),
            if (state is AuthLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
          ],
        );
      },
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
        color: page.titleColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
        fontSize: 16,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
        color: page.imageBgColor,
      ),
      child: Image.asset(
        page.imageRes,
        height: iconSize,
        width: iconSize,
      ),
    );
  }
}

class PageData {
  final String title;
  final Color titleColor;
  final String? description;
  final Color descriptionColor;
  final String imageRes;
  final Color imageBgColor;
  final Color bgColor;

  const PageData({
    required this.title,
    this.titleColor = Colors.black,
    this.description,
    this.descriptionColor = Colors.black,
    required this.imageRes,
    this.imageBgColor = Colors.white,
    this.bgColor = Colors.white,
  });
}
