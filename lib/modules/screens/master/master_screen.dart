import 'package:flutter/material.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master'),
      ),
      body: ListTile(
        title: Text('Master Kios'),
        onTap: () {
          Navigator.pushNamed(context, '/masterkios');
        },
      ),
    );
  }
}
