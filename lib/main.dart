import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_app/config/routes/routes.dart';
import 'package:laundry_app/modules/bloc/bloc_master/master_bloc.dart';
import 'package:laundry_app/modules/bloc/bloc_fireuser/fireuser_bloc.dart';

void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  final routes = Routes();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MasterBloc(),
        ),
        BlocProvider(
          create: (context) => FireuserBloc(),
        ),
      ],

      // create: (context) => SubjectBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes.getAllRoutes,
        // initialRoute: '/login',
      ),
    );
  }
}
