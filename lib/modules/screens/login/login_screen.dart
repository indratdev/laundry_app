import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_app/core/auth/fireauth.dart';
import 'package:laundry_app/modules/bloc/bloc_fireuser/fireuser_bloc.dart';
import 'package:laundry_app/utils/mixins/validation_mixin.dart';
import 'package:laundry_app/widgets/simplewidget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final validMix = ValidationMixin();

  TextEditingController hpemailController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laundry Login'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: BlocListener<FireuserBloc, FireuserState>(
            listener: (context, state) {
              if (state is LoadingLoginUserFireState) {
                CircularProgressIndicator.adaptive();
              }

              if (state is FailedLoginUserFireState) {
                return SimpleWidget.showDialogFailed(
                    context, state.messageError);
              }

              if (state is SuccessLoginrUserFireState) {
                return SimpleWidget.showDialogSuccess(
                    context, 'Login', 'Berhasil Login', () {
                  Navigator.of(context, rootNavigator: true).pop(false);
                  Navigator.pushReplacementNamed(context, '/home');
                });
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: hpemailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                      validator: (String? value) {
                        return validMix.validationEmail(value);
                      },
                    ),
                    TextFormField(
                      controller: pwdController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                      ),
                      validator: (String? value) {
                        return validMix.validateTxtFormField(value);
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        primary: Colors.red,
                      ),
                      child: const Text('MASUK'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<FireuserBloc>(context)
                              .add(LoginUserFireEvent(
                            email: hpemailController.text,
                            password: pwdController.text,
                          ));

                          // Map<String, dynamic> result =
                          //     await FireAuth.signInUsingEmailPassword(
                          //         email: hpemailController.text,
                          //         password: pwdController.text,
                          //         context: context);
                          // print(result);
                          // if (result['user'] != null) {
                          //   SimpleWidget.showDialogSuccess(
                          //       context, 'title', 'content', () {
                          //     Navigator.of(context, rootNavigator: true)
                          //         .pop(false);
                          //     Navigator.pushReplacementNamed(context, '/home');
                          //   });
                          //   print('>>> ${result['user']}');

                          //   if (result['errorMessage'] != '') {
                          //     // print('Error ===> ${result['errorMessage']}');
                          //     SimpleWidget.showDialogFailed(
                          //         context, result['errorMessage']);
                          //   }
                          // }

                          // Navigator.pushReplacementNamed(context, '/home');
                          // User? user = await FireAuth.signInUsingEmailPassword(
                          //     email: hpemailController.text,
                          //     password: pwdController.text,
                          //     context: context);

                          // SimpleWidget.showDialogSuccess(
                          //   context,
                          //   'Login Success',
                          //   'Content',
                          //   () {
                          //     Navigator.of(context, rootNavigator: true).pop(false);
                          //   },
                          // );
                        }

                        // result.then((value) {
                        //   SimpleWidget.showDialogSuccess(
                        //     context,
                        //     'Login Success',
                        //     'Content',
                        //     () {
                        //       Navigator.of(context, rootNavigator: true).pop(false);
                        //     },
                        //   );
                        // });
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgotpwd');
                          },
                          child: const Text('Lupa Password ?'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
