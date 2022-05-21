import 'package:camp_app/auth/bloc/auth_bloc.dart';
import 'package:camp_app/auth/service/auth_service.dart';
import 'package:camp_app/auth/widgets/login_button.dart';
import 'package:camp_app/auth/widgets/login_input.dart';
import 'package:camp_app/auth/widgets/login_title.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/core/services/local_user_service.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/core/widgets/show_snackbar.dart';
import 'package:camp_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 47.h, right: 15, left: 15, bottom: 49.h),
          decoration: const BoxDecoration(),
          child: BlocProvider(
            create: (_) => AuthBloc(
              authService: getIt<AuthService>(),
              userService: getIt<UserService>(),
              dioService: getIt<DioService>(),
              localUserService: getIt<LocalUserService>(),
            )..add(AuthCheckIsLogged()),
            child: LoginScreentView(
              phoneNumberController: _phoneNumberController,
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreentView extends StatelessWidget {
  final TextEditingController phoneNumberController;

  const LoginScreentView({
    required this.phoneNumberController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LoginTitle(),
        SizedBox(
          height: 64.h,
        ),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingFailure) {
              showSnackBar(context: context, message: state.msg);
            }

            if (state is AuthLoadingDone || state is AuthAlreadyLogged) {
              Navigator.pushReplacementNamed(context, Routes.mainPage);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 47.h,
                  ),
                  LoginInput(phoneNumberController: phoneNumberController),
                  SizedBox(
                    height: 27.h,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return LoginButton(
                        onPressed: () {
                          final phoneNumber = phoneNumberController.text;

                          context.read<AuthBloc>().add(
                                AuthInProgress(
                                  phone: phoneNumber,
                                ),
                              );
                        },
                        isLoading: state is AuthLoading,
                      );
                    },
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
