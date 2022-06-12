import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SimpleWidget {
  static show2(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 240,
            child: SizedBox.expand(child: FlutterLogo()),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  static showDialogSuccess(BuildContext context, String title, String content,
      Function()? function1) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.check,
                    color: Colors.green,
                    size: MediaQuery.of(context).size.width / 4,
                  ),
                  SizedBox(height: 10),
                  Text('Login Berhasil', style: TextStyle(fontSize: 12)),
                  ElevatedButton(
                    onPressed: function1,
                    child: const Text('OK'),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
            ),
          );
        });
  }

  static showDialogFailed(
    BuildContext context,
    String errorMessage,
  ) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.triangleExclamation,
                    color: Colors.red,
                    size: MediaQuery.of(context).size.width / 5,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    errorMessage,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
            ),
          );
        });
  }

  static showDialogSuccess2(BuildContext context, String title, String content,
      Function()? function1) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(color: Colors.amber),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: function1,
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        // return AlertDialog(

        //   title: FaIcon(FontAwesomeIcons.xmark, color: Colors.green),
        //   content: Text(content),
        //   actions: <Widget>[
        //     ElevatedButton(
        //       style: ElevatedButton.styleFrom(primary: Colors.red),
        //       onPressed: function1,
        //       child: const Text('Yes'),
        //     ),
        //   ],
        // );
      },
    );
  }

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
