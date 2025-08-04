import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/core/colors/colors_manager.dart';
import 'package:note_app/data/note_model.dart';
import 'package:note_app/logic/create_note/cubit.dart';
import 'package:note_app/logic/create_note/state.dart';

import '../widgets/text_form_filed_widget.dart';
import 'notes_screen.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TextEditingController noteAddressController = TextEditingController();
  TextEditingController descController = TextEditingController();
  XFile ?selectedMedia;

  Future choseMediaGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedMedia = image;

      });
    }
  }



  Future choseMediaCamera() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        selectedMedia = image;
      });
    }
  }
  Future <String?> uploadImage (XFile image)async{

    try{
      final storage = FirebaseStorage.instance.ref().child("note_images/${DateTime.now().millisecondsSinceEpoch}.jpg");
      await storage.putFile(File(image.path));
      return await storage!.getDownloadURL();

    }catch (e){
      print("Uploaded Error ===========$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNoteCubit(),
      child: BlocConsumer<CreateNoteCubit, CreateNoteState>(
        listener: (context, state) {
          if (state is CreateNoteSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Your Note Was Created Successfully")),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotesScreen()),
            );
          } else if (state is CreateNoteErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.em)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 134,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Create New Note",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 44),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Head line",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 9),

                              TextFormFiledWidget(
                                hintTxt: 'Enter Note Address',
                                keyType: TextInputType.text,
                                controller: noteAddressController,
                              ),
                              SizedBox(height: 44),
                              Text(
                                "Description",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 9),
                              TextFormFiledWidget(
                                hintTxt: 'Enter Your Description',
                                keyType: TextInputType.text,
                                controller: descController,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 90,
                                ),
                              ),
                             selectedMedia == null?  SizedBox(height: 77) : Image.file(File(selectedMedia!.path)),

                              InkWell(
                                onTap: () {
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(
                                      content: Container(
                                        height: 140,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(

                                              child: Container(
                                                width: 160,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: ColorsManager.primary
                                                ),
                                                child: Center(child: Text("Gallery",
                                                style: TextStyle(
                                                  color: Colors.white
                                                ),
                                                )),
                                              ),
                                              onTap: (){},
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(

                                              child: Container(
                                                width: 160,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: ColorsManager.primary
                                                ),
                                                child: Center(child: Text("Camera",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                )),
                                              ),
                                              onTap: (){
                                                choseMediaCamera();
                                              },
                                            ),


                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: 312,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Select Media",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 9),
                              InkWell(
                                onTap: () {
                                  context.read<CreateNoteCubit>().createNote(
                                    notes: NoteModel(
                                      headLine: noteAddressController.text,
                                      description: descController.text,
                                      createdAt: DateTime.now(),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: 312,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: (state is CreateNoteLoadingState)
                                      ? Center(child: CircularProgressIndicator())
                                      : Center(
                                          child: Text(
                                            "Create",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
