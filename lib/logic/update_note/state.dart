abstract class UpdateNoteState {}

class UpdateNoteInitialState extends UpdateNoteState {}

class UpdateNoteLoadingState extends UpdateNoteState {}

class UpdateNoteSuccessState extends UpdateNoteState {}

class UpdateNoteErrorState extends UpdateNoteState {
  final String error;
  UpdateNoteErrorState({required this.error});
}
