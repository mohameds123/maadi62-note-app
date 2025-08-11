import 'package:note_app/data/note_model.dart';

class GetNoteState {}

class GetNoteInitialState extends GetNoteState {}

class GetNoteLoadingState extends GetNoteState {}

class GetNoteSuccessState extends GetNoteState {
  List <NoteModel> notes ;
  GetNoteSuccessState ({required this.notes});
}

class GetNoteErrorState extends GetNoteState {
  final String em ;
  GetNoteErrorState ({required this.em});
}
// ====== Delete states ======
class DeleteNoteLoadingState extends GetNoteState {}

class DeleteNoteSuccessState extends GetNoteState {}

class DeleteNoteErrorState extends GetNoteState {
  final String em;
  DeleteNoteErrorState({required this.em});
}