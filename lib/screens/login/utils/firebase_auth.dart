import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

String? name;
String? imageUrl;

  Future<bool> signInWithEmail(String email, String password) async{
    try {
        UserCredential result = await _auth.signInWithEmailAndPassword(email: email,password: password);
        User? user = result.user;
      if(user != null)
      return true;
      else
      return false;
    } catch (e) {
     // print(e.message);
      return false;
    }
  }

  // Future<bool> signupWithEmail(String email, String password) async {
  //   try {
  //     UserCredential res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     FirebaseUser user = res.user;
  //     if(user != null)
  //       return true;
  //     return false;
  //   }catch (e) {
  //     print(e.message);
  //     return false;
  //   }
  // }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("error logging out");
    }
  }

  Future<void> CheckLogOUt() async {
    try {
       UserCredential res = await _auth.signInWithCredential(GoogleAuthProvider.credential());   
      // return  res;  

    } catch (e) {
      print("error logging out");
    }

  }

  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if(account == null )
        return  false;
        
      UserCredential res = await _auth.signInWithCredential(GoogleAuthProvider.credential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));
      if(res.user == null)
     // print(res.user);
        return false;
      return true;
    } catch (e) {
       print(e.toString());
      print("Error logging with google");
      return false;
    }

  }

  


 



  


}