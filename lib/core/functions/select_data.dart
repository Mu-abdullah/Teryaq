import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../language/lang_keys.dart';
import '../style/widgets/app_text.dart';

void selectData({
  required BuildContext context,
  required TextEditingController controller,
  required String content,
  String format = 'yyyy-MM-dd',
}) {
  var date = BottomPicker.date(
    headerBuilder: (context) => AppText(content),
    layoutOrientation: TextDirection.rtl,
    dateOrder: DatePickerDateOrder.dmy,
    initialDateTime: DateTime.now(),
    maxDateTime: DateTime(2050),
    minDateTime: DateTime(1950),
    pickerThemeData: CupertinoTextThemeData(
      actionTextStyle: customTextStyle(context),
      dateTimePickerTextStyle: customTextStyle(context),
    ),
    // ✅ Updated: buttonBuilder now handles both button appearance AND onSubmit
    buttonBuilder: (context, onPressed) {
      return GestureDetector(
        onTap: () {
          // Handle the submit action here
          var date = convertDateToArabic(onPressed.toString(), format: format);
          controller.text = date;
          // Close the picker
          Navigator.pop(context as BuildContext);
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: AppText(
            LangKeys.chooseDate,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
    onChange: (index) {},
    bottomPickerTheme: BottomPickerTheme.blue,
  );

  date.show(context);
}

String convertDateToArabic(String dateString, {required String format}) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDate = intl.DateFormat(format).format(dateTime);
  return formattedDate;
}
