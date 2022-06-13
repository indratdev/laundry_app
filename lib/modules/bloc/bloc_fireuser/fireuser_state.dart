part of 'fireuser_bloc.dart';

@immutable
abstract class FireuserState {}

class FireuserInitial extends FireuserState {}

class LoadingRegisterUserFireState extends FireuserState {}

class LoadingLoginUserFireState extends FireuserState {}

class FailedRegisterUserFireState extends FireuserState {
  String messageError;

  FailedRegisterUserFireState({
    required this.messageError,
  });

  @override
  List<Object> get props => [messageError];
}

class FailedLoginUserFireState extends FireuserState {
  String messageError;

  FailedLoginUserFireState({
    required this.messageError,
  });

  @override
  List<Object> get props => [messageError];
}

class SuccessRegisterUserFireState extends FireuserState {
  User? user;

  SuccessRegisterUserFireState({
    required this.user,
  });
}

class SuccessLoginrUserFireState extends FireuserState {
  User? user;

  SuccessLoginrUserFireState({
    required this.user,
  });
}
