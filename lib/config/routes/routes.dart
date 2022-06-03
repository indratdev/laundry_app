import 'package:flutter/material.dart';
import 'package:laundry_app/modules/screens/forgotpwd/forgotpwd_screen.dart';
import 'package:laundry_app/modules/screens/login/login_screen.dart';
import 'package:laundry_app/modules/screens/master/managemkios.dart';
import 'package:laundry_app/modules/screens/master/master_screen.dart';
import 'package:laundry_app/modules/screens/master/masterkios.dart';
import 'package:laundry_app/modules/screens/register/register_screen.dart';
import 'package:laundry_app/modules/screens/laundryapp.dart';

class Routes {
  Map<String, WidgetBuilder> getAllRoutes = {
    '/': (_) => LoginScreen(),
    '/register': (_) => RegisterScreen(),
    '/forgotpwd': (_) => ForgotpwdScreen(),
    '/home': (_) => LaundryApp(),
    '/master': (_) => MasterScreen(),
    '/masterkios': (_) => MasterKios(),
    '/masterkios/add': (_) => ManageMasterKios(),
  };
}
