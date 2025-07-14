class CreateNoteState {}

class CreateNoteInitialState extends CreateNoteState {}

class CreateNoteLoadingState extends CreateNoteState {}

class CreateNoteSuccessState extends CreateNoteState {}

class CreateNoteErrorState extends CreateNoteState {
  final String em ;
  CreateNoteErrorState ({required this.em});
}
