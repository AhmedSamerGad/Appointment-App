import 'package:appointments/features/authentication/signup/data/models/sign_up_request.dart';
import 'package:appointments/features/authentication/signup/data/repo/sign_up_repo.dart';
import 'package:appointments/features/authentication/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(const SignUpState.loading());
  final SignUpRepo signUpRepo;

  void emitingSignUp(SignUpRequest signUpRequest) async{
    emit(const SignUpState.loading());
    final response = await signUpRepo.signUp(signUpRequest);
    response.when(success: (request){
      emit(SignUpState.success(response));
    }, failure: (error){
      emit(SignUpState.error(error));
    });
  }
}
