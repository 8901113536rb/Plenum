import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showProgressDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Prevents dismissal by tapping outside
    builder: (BuildContext context) {
      return const AlertDialog(
        content: Row(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text('Loading...'),
          ],
        ),
      );
    },
  );
}
void hideprogressDialog(BuildContext context){
  Navigator.pop(context);

}