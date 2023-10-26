// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_task1/home_page/pages/homepage.dart';
// import 'package:flutter_task1/sign_in/pages/sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

//   Future<void> signInWithGoogle(BuildContext context) async {
//     try {
//       final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//       if (gUser == null) {
//         return;
//       }

//       //obtain auth details from request
//       final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//       //createa new credential for user
//       final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: gAuth.accessToken, idToken: gAuth.idToken);

//       final UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       if (userCredential.user != null) {
//         // ignore: use_build_context_synchronously
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const HomePage()));
//       }
//       // return await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (error) {
//       print('Error Signing with Google:$error');
//     }
//   }

//   Future<void> signOut(BuildContext context) async {
//     try {
//       await _googleSignIn.signOut();
//       await FirebaseAuth.instance.signOut();
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const signInPage()));
//     } catch (error) {
//       print("Error siging out:$error");
//     }
//   }
// }
