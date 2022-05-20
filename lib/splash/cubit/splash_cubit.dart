import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends HydratedCubit<SplashState> {
  SplashCubit() : super(SplashState.AppLaunchFirst);

  void fisrtLaunchHappend() {
    emit(SplashState.AppLaunchNotFirst);
  }

  @override
  SplashState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['isFirstSplash'] as bool) {
        return SplashState.AppLaunchFirst;
      }
      return SplashState.AppLaunchNotFirst;
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SplashState state) {
    try {
      return {
        'isFirstSplash': state == SplashState.AppLaunchFirst,
      };
    } catch (_) {
      return null;
    }
  }
}
