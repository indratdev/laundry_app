import 'package:laundry_app/core/firestore/firestoreapp.dart';

class FireRepository {
  final firestoreApp = FireStoreApp();

  // check master ldy
  checkMasterLdy(String id) {
    return firestoreApp.checkMasterLaundyExist(id);
  }
}
