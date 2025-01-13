import 'package:equatable/equatable.dart';
import 'package:my_app/login/model/login_req_model.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginReqEvent extends LoginEvent {
  LoginReq loginReqModel;
  LoginReqEvent({required this.loginReqModel});

  @override
  List<Object> get props => [loginReqModel];
}
