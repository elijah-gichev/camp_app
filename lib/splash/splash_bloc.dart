import 'package:hydrated_bloc/hydrated_bloc.dart';

class SplashCubit extends HydratedCubit<bool> {
  SplashCubit() : super(false);

  void onboardingShowed() => emit(true);

  @override
  bool fromJson(Map<String, dynamic> json) => json['value'] as bool;

  @override
  Map<String, bool> toJson(bool state) => { 'value': state };
}