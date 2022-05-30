import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController hpemail = TextEditingController();
  TextEditingController pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laundry Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: hpemail,
                  decoration: const InputDecoration(
                    labelText: 'No Hp atau Email',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                ),
                TextField(
                  controller: pwd,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    primary: Colors.red,
                  ),
                  child: const Text('MASUK'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    primary: Colors.green,
                  ),
                  child: const Text('DAFTAR'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Lupa Password ?'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
