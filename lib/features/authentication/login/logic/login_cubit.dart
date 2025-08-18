// ignore_for_file: avoid_print

import 'package:appointments/core/network/dio_halper.dart';
import 'package:appointments/core/utils/shared_prefrances.dart';
import 'package:appointments/features/authentication/domin/user_entities.dart';
import 'package:appointments/features/authentication/login/data/models/login_request.dart';
import 'package:appointments/features/authentication/login/data/repo/login_repo.dart';
import 'package:appointments/features/authentication/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  static UserEntities? user;
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.loading());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitLoginStates() async {
    emit(const LoginState.loading());
    try {
      final response = await loginRepo.login(
        LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );
      print('API Response: $response');
      response.when(
        success: (loginResponse) async {
          if (loginResponse.token == null) {
          throw Exception('Server did not return a token');
        }
        await saveUserToken(loginResponse.token!);
          DioHelper.setTokenAfterLogin(loginResponse.token!);
          await SharedPrefrancesHelpers.setSecuredString('userId', loginResponse.id);

        user = loginResponse;
        emit(LoginState.success(loginResponse));
          user = loginResponse;
          // Debug log
          emit(LoginState.success(loginResponse));
        },
        failure: (error) {
          emit(LoginState.error(error: _handleError(error)));
          print('Login Exception: $error');
        },
      );
    } catch (e) {
      emit(LoginState.error(error: _handleError(e.toString())));
      print('Login Exception: $e');
    }
  }

  String _handleError(String error) {
    if (error.contains('Connection refused')) {
      return 'Cannot connect to the server. Please check your internet connection or try again later.';
    }
    if (error.contains('SocketException')) {
      return 'Network error. Please check your connection and try again.';
    }
    return error;
  }

  Future<void> saveUserToken(String token) async {
  // Use a consistent key for token storage
  
  // Save to secure storage
  await SharedPrefrancesHelpers.setSecuredString('tokenKey', token);
  
  // Update Dio headers
  
  // Verify the token was saved and set
  print('Token saved and set: ${token.substring(0, 10)}...');
}

@override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
