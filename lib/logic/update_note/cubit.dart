import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/note_model.dart';
import 'package:note_app/logic/update_note/state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit() : super(UpdateNoteInitialState());

  Future<void> updateNote({
    required String noteId,
    required NoteModel note,
  }) async {
    emit(UpdateNoteLoadingState());
    try {
      await FirebaseFirestore.instance
          .collection("notes")
          .doc(noteId)
          .update(note.toJson());
      emit(UpdateNoteSuccessState());
    } catch (e) {
      emit(UpdateNoteErrorState(error: e.toString()));
    }
  }


}
