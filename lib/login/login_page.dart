import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/login/bloc/login_bloc.dart';
import 'package:my_app/login/bloc/login_event.dart';
import 'package:my_app/login/bloc/login_state.dart';
import 'package:my_app/login/model/login_req_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoginLoadedState) {
              return Center(
                  child: Text('Welcome, ${state.loginResp.username}'));
            } else if (state is LoginErrorState) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginReqEvent(
                          loginReqModel: LoginReq(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
