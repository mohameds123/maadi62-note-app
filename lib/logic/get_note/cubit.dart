import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/logic/get_note/state.dart';
import '../../data/note_model.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitialState());

  Future getNotes() async {
    emit(GetNoteLoadingState());

    try {
      final response = await FirebaseFirestore.instance
          .collection("notes")
          .get();

      final finalResult = response.docs.map((doc) {
        return NoteModel.fromJson({
          ...doc.data(),
          'noteId': doc.id,
        });
      }).toList();

      emit(GetNoteSuccessState(notes: finalResult));
    } catch (e) {
      print("GET NOTE ERROR ===== $e");
      emit(GetNoteErrorState(em: e.toString()));
    }
  }


  Future deleteNote(String noteId) async {
    emit(DeleteNoteLoadingState());
    try {
      await FirebaseFirestore.instance
          .collection("notes")
          .doc(noteId)
          .delete();

      emit(DeleteNoteSuccessState());

      await getNotes();
    } catch (e) {
      print("DELETE NOTE ERROR ===== $e");
      emit(DeleteNoteErrorState(em: e.toString()));
    }
  }
}
