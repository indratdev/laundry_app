import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/modules/models/member.dart';
import 'package:laundry_app/widgets/simplewidget.dart';

class FireAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireInstance = FirebaseFirestore.instance;
  static final fireCollMKios = _fireInstance.collection('member-kios');

  // register
  static Future<User?> registerUsingEmailPassword({
    // required String laundryName,
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // await user!.updateDisplayName(laundryName);
      // await user.reload();
      user = _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

      if (e.code == "weak-password") {
        // en : The Password provided is too weak
        errorMessage = 'Kata sandi yang diberikan terlalu lemah';
      } else if (e.code == "email-already-in-use") {
        // en : The account already exists for that email
        errorMessage = 'Akun sudah terdaftar di sistem kami';
      }
      SimpleWidget.showDialogFailed(context, errorMessage);
    } catch (e) {
      print(e);
      SimpleWidget.showDialogFailed(context, e.toString());
    }
    return user;
  }

  //sign in
  // static Future<User?> signInUsingEmailPassword({
  static Future<Map<String, dynamic>> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    String errorMessage = '';

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        errorMessage = 'Email tidak terdaftar';
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided.');
        errorMessage = 'Kata sandi yang diberikan salah.';
      }
      //show message error
      SimpleWidget.showDialogFailed(context, errorMessage);
    }

    return {
      "user": user,
      // "errorMessage": errorMessage,
    };
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

  Future updateMemberKios({
    required Member member,
    required String idDocs,
  }) async {
    final docMember = _fireInstance.collection('member-kios').doc(idDocs);

    final newMember = Member(
      name: member.name,
      address: member.address,
      idKios: _auth.currentUser?.uid ?? "",
      phoneNumber: member.phoneNumber,
      description: member.description,
    );

    final json = newMember.toJson();

    await docMember.update(json).then(
        (value) => {
              print("<<< Update Data Success >>>"),
            }, onError: (e) {
      print('<<< Failed to Update data>>>');
    });
  }

  Future deleteMemberKios({
    required String idDocs,
  }) async {
    final docMember = _fireInstance.collection('member-kios').doc(idDocs);

    await docMember.delete().then(
        (value) => {
              print('<<< Delete Master Kios Data Success >>>'),
            }, onError: (e) {
      print('<<< Failed to Delete Master Kios Data >>>');
    });
  }
}
