import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
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
}
