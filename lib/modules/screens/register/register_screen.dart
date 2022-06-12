import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/core/auth/fireauth.dart';
import 'package:laundry_app/utils/mixins/validation_mixin.dart';
import 'package:laundry_app/widgets/simplewidget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final validationMixin = ValidationMixin();

  // final _laundryNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();

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
                      return validationMixin.validationEmail(value);
                    },
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _passwordController2,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Ulangi-Password",
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
                      if (_formKey.currentState!.validate()) {
                        // validasi password
                        (validationMixin.validatePasswordConfirm(
                                _passwordController.text,
                                _passwordController2.text))
                            ? null
                            : SimpleWidget.showDialogFailed(context,
                                'Password dan konfimasi password tidak sama');

                        // print(pass);

                        User? user = await FireAuth.registerUsingEmailPassword(
                            context: context,
                            email: _emailController.text,
                            password: _passwordController.text);

                        if (user?.uid != '' || user!.uid.isNotEmpty) {
                          return SimpleWidget.showDialogSuccess(
                              context,
                              'Sukses',
                              'Pendaftaran Pengguna Baru Berhasil', () {
                            _emailController.text = '';
                            _passwordController.text = '';
                            _passwordController2.text = '';
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/', (route) => false);
                          });
                        }

                        setState(() {
                          _isProcessing = false;
                        });
                      }
                    }
                    // },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
