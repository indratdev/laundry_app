import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_app/modules/models/member.dart';

class FireAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireInstance = FirebaseFirestore.instance;

  // register
  static Future<User?> registerUsingEmailPassword({
    required String laundryName,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await user!.updateDisplayName(laundryName);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print('The Password provided is too weak');
      } else if (e.code == "email-already-in-use") {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  // add member kios
  Future createMemberKios({required Member member}) async {
    final docMember = _fireInstance.collection('member-kios');

    final newMember = Member(
      name: member.name,
      address: member.address,
      idKios: _auth.currentUser?.uid ?? "",
      phoneNumber: member.phoneNumber,
      description: member.description,
    );

    final json = newMember.toJson();

    await docMember.add(json);
  }
}
