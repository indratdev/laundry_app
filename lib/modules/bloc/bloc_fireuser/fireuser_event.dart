part of 'fireuser_bloc.dart';

@immutable
abstract class FireuserEvent {}

class RegisterUserFireEvent extends FireuserEvent {
  String email, password;

  RegisterUserFireEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
