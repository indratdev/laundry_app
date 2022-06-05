import 'package:flutter/material.dart';

class SimpleWidget {
  static showDialog2Action(
    BuildContext context,
    String title,
    String content,
    Function()? functionBtn1,
    Function()? functionBtn2,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.transparent),
              onPressed: functionBtn1,
              child: const Text('No'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: functionBtn2,
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
