import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/logic/sign_up/state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  /// Sign Up Function with email and password using firebase auth
  Future signUp({required String userEmail, required String pass}) async {
    emit(SignUpLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: pass,
      );
      emit(SignUpSuccessState());
    } catch (e) {
      print("Sign Up Error ==============${e}");
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }
}
