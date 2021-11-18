import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String timestampToDateFormat(Timestamp timestamp) {
  DateTime time = timestamp.toDate();

  DateFormat formatDate = DateFormat('MMMM yyyy');

  return formatDate.format(time);
}

String formatTitle(String title) {
// convert title to 'Title Case'

  List a = title.split(' ');
  for (int i = 0; i < a.length; i++) {
    a[i] = StringUtils.capitalize(a[i]);
  }
  String titleCaseTitle = a.join(' ');
  return titleCaseTitle;
}

// used to show a dialog box on screen
bool isDialogScreenVisible(bool show) {
  return show == true ? true : false;
}

//used to break up long bits of text
String formatTextWithParagraphs(String text) {
  int numOfSentences = 0;
  for (int i = 0; i < text.length; i++) {
    if (text[i] == '.') {
      numOfSentences++;
    }

    // create a paragraph
    if (numOfSentences == 5) {
      text = text.substring(0, i + 1) +
          "\n\n" +
          text.substring(i + 2, text.length);
      numOfSentences = 0;
    }
  }

  print(text);
  return text;
}

String formatName(String name) {
  name.trim();
  for (int i = 0; i < name.length; i++) {
    if (name[i] == ' ' && i + 2 < name.length) {
      name = name.substring(0, i + 2) + '.';
      break;
    }
  }
  return name;
}
