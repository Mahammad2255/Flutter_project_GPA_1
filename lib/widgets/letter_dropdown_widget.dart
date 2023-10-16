import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/app_constants.dart';
import '../helper/data_helper.dart';

class LetterDropDownWidget extends StatefulWidget {
  final Function onSelectedLetter;

  const LetterDropDownWidget({required this.onSelectedLetter, Key? key}): super(key: key);

  @override
  State<LetterDropDownWidget> createState() => _LetterDropDownWidgetState();
}

class _LetterDropDownWidgetState extends State<LetterDropDownWidget> {
  double selectedLetterValue = 4;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value_) {
          setState(() {
            selectedLetterValue = value_!;
            widget.onSelectedLetter(selectedLetterValue);
          });
        },
        underline: Container(),
        value: selectedLetterValue,
        items: DataHelper.allLessonsLetters(),
        // onChanged: (double? selectedValue) {},
      ),
    );
  }
}