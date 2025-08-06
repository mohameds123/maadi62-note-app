import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_app/logic/login/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  /// Login with Email & Password
  Future login({required String userEmail, required String pass}) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: pass,
      );

      emit(LoginSuccessState());
    } catch (e) {
      print("Login Error ==============${e}");
      emit(LoginErrorState(errorMessage: e.toString()));
    }
  }

  /// Login with Google
  Future<void> continueWithGoogle() async {
    emit(LoginLoadingState());

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        emit(LoginErrorState(errorMessage: 'Google sign-in was canceled.'));
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(LoginSuccessState());
    } catch (e) {
      print("Google Sign-In Error: $e");
      emit(LoginErrorState(errorMessage: e.toString()));
    }
  }
}
