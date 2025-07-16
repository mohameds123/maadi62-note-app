import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/logic/login/state.dart';
import 'package:note_app/logic/sign_up/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  /// Sign Up Function with email and password using firebase auth
  Future login({required String userEmail, required String pass}) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: pass,
      );

      emit(LoginSuccessState());
    } catch (e) {
      print("Sign Up Error ==============${e}");
      emit(LoginErrorState(errorMessage: e.toString()));
    }
  }
}
