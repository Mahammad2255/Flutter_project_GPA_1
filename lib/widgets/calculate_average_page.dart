import 'package:first_project/helper/data_helper.dart';
import 'package:first_project/widgets/credit_dropdown_widget.dart';
import 'package:first_project/widgets/lesson_list.dart';
import 'package:first_project/widgets/letter_dropdown_widget.dart';
import 'package:first_project/widgets/show_average.dart';
import 'package:flutter/material.dart';

import '../const/app_constants.dart';
import '../model/lesson.dart';

class CalculateAveragePage extends StatefulWidget {
  const CalculateAveragePage({super.key});

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String enteredLesson = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            Constants.title,
            style: Constants.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(lesson_number: DataHelper.allEnteredLessons.length, average: DataHelper.calculateAvg()),
              )
            ], 
          ),
          Expanded(
            child: LessonList(
              onDismiss: (index){
                DataHelper.allEnteredLessons.removeAt(index);
                setState(() {
                  
                });
              },
            ), 
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: _buildTextFormField()),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: LetterDropDownWidget(onSelectedLetter: (letter){
                selectedLetterValue = letter;
              },))),
              Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: CreditDropDownWidget(onSelectedCredit:(credit){
                selectedCreditValue = credit;
                
              } ))),


              IconButton(
                onPressed: _enterLessonAndCalculateAvg,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Constants.mainColor,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    
    return TextFormField(
      onSaved: (value){
        setState(() {
          enteredLesson = value!;
        });
      },
      validator: (s){
        if(s!.length <=0){
          return 'Enter subject name';
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Math",
          border: OutlineInputBorder(borderRadius: Constants.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(0.3)),
    );
  }

 

  

  void _enterLessonAndCalculateAvg() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      Lesson entered_l = Lesson(name: enteredLesson, letterValue: selectedLetterValue, creditValue: selectedCreditValue);
      DataHelper.addLesson(entered_l);
      setState(() {
        
      });
    }
  }
}
