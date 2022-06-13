part of 'fireuser_bloc.dart';

@immutable
abstract class FireuserState {}

class FireuserInitial extends FireuserState {}

class LoadingRegisterUserFireState extends FireuserState {}

class FailedRegisterUserFireState extends FireuserState {
  String messageError;

  FailedRegisterUserFireState({
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
