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
