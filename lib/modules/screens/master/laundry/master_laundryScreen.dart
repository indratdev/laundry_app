import 'package:flutter/material.dart';

class MasterLaundryScreen extends StatelessWidget {
  MasterLaundryScreen({Key? key}) : super(key: key);

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _keyForm,
        child: SingleChildScrollView(
          child: Container(
            child: Column(),
          ),
        ),
      ),
    );
  }
}
