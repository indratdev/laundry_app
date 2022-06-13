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
        Map<String, dynamic> result = await FireAuth.registerUsingEmailPassword(
            email: event.email, password: event.password);

        if (result["errorMessage"] != '') {
          emit(FailedRegisterUserFireState(
              messageError: result["errorMessage"].toString()));
        } else {
          emit(SuccessRegisterUserFireState(user: result["user"]));
        }
      } catch (e) {
        emit(FailedRegisterUserFireState(messageError: e.toString()));
      }
    });

    on<LoginUserFireEvent>((event, emit) async {
      try {
        emit(LoadingLoginUserFireState());
        Map<String, dynamic> result = await FireAuth.signInUsingEmailPassword(
            email: event.email, password: event.password);

        if (result['errorMessage'] != '') {
          emit(FailedLoginUserFireState(
              messageError: result["errorMessage"].toString()));
        } else {
          emit(SuccessLoginrUserFireState(user: result["user"]));
        }
      } catch (e) {
        emit(FailedLoginUserFireState(messageError: e.toString()));
      }
    });
  }
}
