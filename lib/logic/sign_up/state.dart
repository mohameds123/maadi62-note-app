class SignUpStates {}

class SignUpInitialState extends SignUpStates{}

class SignUpLoadingState extends SignUpStates{}

class SignUpSuccessState extends SignUpStates{}

class SignUpErrorState extends SignUpStates{
  final String errorMessage ;
  SignUpErrorState({required this.errorMessage});
}