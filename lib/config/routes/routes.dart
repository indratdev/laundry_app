import 'package:flutter/material.dart';
import 'package:laundry_app/modules/screens/forgotpwd/forgotpwd_screen.dart';
import 'package:laundry_app/modules/screens/login/login_screen.dart';
import 'package:laundry_app/modules/screens/master/kios/managemkios.dart';
import 'package:laundry_app/modules/screens/master/master_screen.dart';
import 'package:laundry_app/modules/screens/master/kios/masterkios.dart';
import 'package:laundry_app/modules/screens/register/register_screen.dart';
import 'package:laundry_app/modules/screens/home/laundryapp.dart';
import 'package:laundry_app/modules/screens/master/laundry/master_laundryScreen.dart';

class Routes {
  Map<String, WidgetBuilder> getAllRoutes = {
    '/': (_) => LoginScreen(),
    '/register': (_) => RegisterScreen(),
    '/forgotpwd': (_) => ForgotpwdScreen(),
    '/home': (_) => LaundryApp(),
    '/master': (_) => MasterScreen(),
    '/masterlaundry': (_) => MasterLaundryScreen(),
    '/masterkios': (_) => MasterKios(),
    '/masterkios/operation': (_) => ManageMasterKios(type: 'add'),
  };
}
