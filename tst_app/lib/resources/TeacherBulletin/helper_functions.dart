import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String timestampToDateFormat(Timestamp timestamp) {
  DateTime time = timestamp.toDate();
  DateFormat formatDate = DateFormat('MM yyyy');

  return formatDate.format(time);
}

String formatTitle(String title) {
  // return StringUtils.
  return StringUtils.capitalize(title);
}

// used to show a dialog box on screen
bool isDialogScreenVisible(bool show) {
  return show == true ? true : false;
}
