import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/logic/get_note/cubit.dart';
import 'package:note_app/logic/get_note/state.dart';

import '../../core/colors/colors_manager.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(
      builder: (context, state) {
        if (state is GetNoteLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if (state is GetNoteSuccessState){
          return SizedBox(
            height: 750,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 390,
                        //height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorsManager.marron,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, top: 20, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.notes[index].headLine,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.notes[index].description,

                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.light,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${state.notes[index].createdAt.hour}:${state.notes[index].createdAt.minute}${state.notes[index].createdAt.hour >= 12 ? " Pm":" Am"}".toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsManager.light,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }else if (state is GetNoteErrorState){
          return Text(state.em);
        }return SizedBox();

      },
    );
  }
}
