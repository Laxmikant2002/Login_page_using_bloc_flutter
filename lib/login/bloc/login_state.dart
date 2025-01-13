import 'package:equatable/equatable.dart';
import 'package:my_app/login/model/login_resp_model.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadedState extends LoginState {
  final LoginResp loginResp;
  LoginLoadedState({required this.loginResp});

  @override
  List<Object?> get props => [loginResp];
}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
