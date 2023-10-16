import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/app_constants.dart';
import '../helper/data_helper.dart';

class CreditDropDownWidget extends StatefulWidget {

  final Function onSelectedCredit;

  const CreditDropDownWidget({required this.onSelectedCredit, super.key});

  @override
  State<CreditDropDownWidget> createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double selectedCreditValue = 1;

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
        onChanged: (value_){
          setState(() {
            selectedCreditValue = value_!;
            widget.onSelectedCredit(value_);
          });
        },
        underline: Container(),
        value: selectedCreditValue,
        items: DataHelper.allLessonCredits(),
        // onChanged: (double? selectedValue) {},
      ),
    );
  }
}