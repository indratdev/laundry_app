import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laundry_app/core/auth/fireauth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _laundryNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Baru"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _laundryNameController,
                    decoration: InputDecoration(
                      hintText: "contoh : Happy Clean Laundry",
                      labelText: "Nama Toko Laundry",
                      icon: const Icon(Icons.people),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "contoh : user123@gmail.com",
                      icon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       labelText: "Alamat",
                //       icon: const Icon(Icons.directions),
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(5.0)),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: TextFormField(
                //     keyboardType: TextInputType.number,
                //     decoration: InputDecoration(
                //       labelText: "Nomor Telpon",
                //       hintText: "contoh : 0811xxx",
                //       icon: const Icon(Icons.call),
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(5.0)),
                //     ),
                //     validator: (String? value) {
                //       if (value == null || value.isEmpty) {
                //         return 'No. Telpon tidak boleh kosong';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: const Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  child: const Text(
                    "DAFTAR",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    // if (_formKey.currentState.validate()) {}
                    if (_formKey.currentState!.validate()) {
                      User? user = await FireAuth.registerUsingEmailPassword(
                          laundryName: _laundryNameController.text,
                          email: _emailController.text,
                          password: _passwordController.text);

                      setState(() {
                        _isProcessing = false;
                      });

                      if (user != null) {
                        print("udah ada usernya");
                        // Navigator.of(context).pushAndRemoveUntil(
                        //   MaterialPageRoute(
                        //     builder: (context) => ProfilePage(user: user),
                        //   ),
                        //   ModalRoute.withName('/'),
                        // );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
