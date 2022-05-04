import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future<GoogleSignInAccount> signInWithGoogle() async {
    try {
      final GoogleSignInAccount account = await googleSignIn.signIn();
      // print(account);
      return account;
    } catch (e) {
      return null;
    }
  }
}
