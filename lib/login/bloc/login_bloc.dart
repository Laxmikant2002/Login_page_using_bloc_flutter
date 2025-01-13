import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/login/bloc/login_event.dart';
import 'package:my_app/login/bloc/login_state.dart';
import 'package:my_app/login/repo/login_repo.dart';
import 'package:my_app/login/model/login_resp_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginReqEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final LoginResp loginResp = await LoginRepo().login(
          event.loginReqModel.username!,
          event.loginReqModel.password!,
        );
        emit(LoginLoadedState(loginResp: loginResp));
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    });
  }
}
