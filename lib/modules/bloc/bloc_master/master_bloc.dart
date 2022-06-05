import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'master_event.dart';
part 'master_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  MasterBloc() : super(MasterInitial()) {
    on<EditMasterKiosEvent>((event, emit) {
      try {} catch (e) {}
    });
  }
}
