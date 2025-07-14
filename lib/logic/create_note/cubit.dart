import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/note_model.dart';
import 'package:note_app/logic/create_note/state.dart';

class CreateNoteCubit extends Cubit <CreateNoteState> {
  CreateNoteCubit () : super (CreateNoteInitialState());
  
  /// Function to add data to firebase store
  Future createNote ({required NoteModel notes})async {
    emit(CreateNoteLoadingState());
    try{
     await FirebaseFirestore.instance.collection("notes").add(notes.toJson());
     emit(CreateNoteSuccessState());
      
    }catch (e){
      emit(CreateNoteErrorState(em: e.toString()));
    }
  }
}