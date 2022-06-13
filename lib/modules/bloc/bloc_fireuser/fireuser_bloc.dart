import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_app/core/auth/fireauth.dart';
import 'package:meta/meta.dart';

part 'fireuser_event.dart';
part 'fireuser_state.dart';

class FireuserBloc extends Bloc<FireuserEvent, FireuserState> {
  FireuserBloc() : super(FireuserInitial()) {
    on<RegisterUserFireEvent>((event, emit) async {
      try {
        emit(LoadingRegisterUserFireState());
        User? user = await FireAuth.registerUsingEmailPassword(
            email: event.email, password: event.password);
        emit(SuccessRegisterUserFireState(user: user));
      } catch (e) {
        emit(FailedRegisterUserFireState(messageError: e.toString()));
      }
    });
  }
}



// User? user = await FireAuth.registerUsingEmailPassword(
//                             context: context,
//                             email: _emailController.text,
//                             password: _passwordController.text);

//                         if (user?.uid != '' || user!.uid.isNotEmpty) {
//                           return SimpleWidget.showDialogSuccess(
//                               context,
//                               'Sukses',
//                               'Pendaftaran Pengguna Baru Berhasil', () {
//                             _emailController.text = '';
//                             _passwordController.text = '';
//                             _passwordController2.text = '';
//                             Navigator.of(context)
//                                 .pushNamedAndRemoveUntil('/', (route) => false);
//                           });