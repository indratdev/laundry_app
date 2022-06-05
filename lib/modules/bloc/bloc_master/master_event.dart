part of 'master_bloc.dart';

@immutable
abstract class MasterEvent {}

class EditMasterKiosEvent extends MasterEvent {
  String idDoc, type;
  QueryDocumentSnapshot<Object?> data;

  EditMasterKiosEvent({
    required this.idDoc,
    required this.type,
    required this.data,
  });

  @override
  List<Object> get props => [idDoc, type, data];
}

class SuccessUpdateMasterKiosState extends MasterEvent {}
