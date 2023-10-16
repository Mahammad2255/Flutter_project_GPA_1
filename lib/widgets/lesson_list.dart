import 'package:first_project/const/app_constants.dart';
import 'package:first_project/model/lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/data_helper.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;

  const LessonList({required this.onDismiss, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.allEnteredLessons;
    return allLessons.length >0 ? ListView.builder(itemCount: allLessons.length, itemBuilder: (context, index){
      return Dismissible(
        direction: DismissDirection.startToEnd,
        key: UniqueKey(),
        onDismissed: (a){

          onDismiss(index); 
          
        },
        child: Padding(
          padding: const EdgeInsets.all(2.3),
          child: Card(
            child: ListTile(
              title: Text(allLessons[index].name),
              leading: CircleAvatar(
                backgroundColor: Constants.mainColor,
                child: Text((allLessons[index].letterValue * allLessons[index].creditValue).toStringAsFixed(0)),
              ),
              subtitle: Text('${allLessons[index].creditValue} Credit, Grade ${allLessons[index].letterValue}'),
            ),
          ),
        ),
      );
    }): Container(
      child: Center(child: Text('Please add subject', style: Constants.titleStyle) ),

    );
  }
}