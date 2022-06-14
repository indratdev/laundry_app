import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreApp {
  final _db = FirebaseFirestore.instance;
  CollectionReference? ref;

  // check exist MasterLaundy with userid
  Future<bool> checkMasterLaundyExist(String docID) async {
    var exist = false;
    try {
      await _db
          .collection('masterldy')
          .where('userid', isEqualTo: docID)
          // .limit(1)
          .get()
          .then((doc) {
        final List<DocumentSnapshot> document = doc.docs;
        (document.isEmpty) ? exist = false : exist = true;
      });
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }
}
