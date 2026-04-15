// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fyp_project/config/components/CustomSnackbar.dart';
// import 'package:fyp_project/Model/LoadingModel.dart';
// import 'package:fyp_project/Pages/Authentication/SignUp_SignInPage.dart';
// import 'package:fyp_project/Pages/BottomNavBar/BottomNavBar.dart';
// import 'package:fyp_project/Providers/Authentication/AuthServices.dart';

// class Authprovider extends ChangeNotifier {

//   Future<void> submitForm({
//     required bool isSignUp,
//     required BuildContext context,
//     required String email,
//     required String password,
//     required GlobalKey<FormState> formKey,
//     required LoadingProvider loadingProvider,
//     required String confirmPassword,
//   }) async {
//     if (!formKey.currentState!.validate()) return;

//     if (isSignUp && password != confirmPassword) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
//       return;
//     }

//     loadingProvider.setActiveButton("Signing");

//     try {
//       if (isSignUp) {
//         final user = await AuthService.createAccount(
//           email: email,
//           password: password,
//         );

//         if (user != null) {
//           CustomSnackBar.success("Email verified! Account created.");
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) => SignUpandSignInPage(),
//             ),
//           );
//         } else {
//           CustomSnackBar.error("Please verify your email first.");
//         }
//       } else {
//         // await AuthService.login(email: email, password: password);
//         CustomSnackBar.success("Logged in successfully!");
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
//       }
//     } catch (e) {
//       CustomSnackBar.error(e.toString());
//     } finally {
//       loadingProvider.setActiveButton(null);
//     }
//   }
//   //-------------Spash Screen Auth

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User? _user;

//   User? get user => _user;

//   Future<void> checkUserStatus() async {
//     await Future.delayed(const Duration(seconds: 2)); // splash delay
//     _user = _auth.currentUser;
//     notifyListeners();
//   }

//   bool get isLoggedIn => _user != null;

//   //-----------selection of items

//   int _selectedIndex = 0; // none selected
//   int get selectedIndex => _selectedIndex;

//   void selectButton(int index) {
//     _selectedIndex = index;
//     notifyListeners();
//   }

//   //---------Form Verification-----------

//   bool _obscurePassword = true;
//   bool _obscureCPassword = true;

//   bool get obscurePassword => _obscurePassword;
//   bool get obscureCPassword => _obscureCPassword;

//   // ✅ Toggle password visibility
//   void togglePasswordVisibility() {
//     _obscurePassword = !_obscurePassword;
//     notifyListeners();
//   }

//   // ✅ Toggle Confirm password visibility
//   void toggleCPasswordVisibility() {
//     _obscureCPassword = !_obscureCPassword;
//     notifyListeners();
//   }

//   // ✅ Validate email
 

//   //------------Timer for Link Sending

//   bool _isTimerRunning = false;
//   int _remainingSeconds = 0;
//   Timer? _timer;

//   bool get isTimerRunning => _isTimerRunning;
//   int get remainingSeconds => _remainingSeconds;

//   /// ✅ Start timer for given seconds
//   void startTimer({int seconds = 30}) {
//     _isTimerRunning = true;
//     _remainingSeconds = seconds;

//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingSeconds > 0) {
//         _remainingSeconds--;
//         notifyListeners();
//       } else {
//         _isTimerRunning = false;
//         _timer?.cancel();
//         notifyListeners();
//       }
//     });
//   }

//   /// ⏹ Stop and reset timer
//   void stopTimer() {
//     if (_timer != null && _timer!.isActive) {
//       _timer!.cancel();
//     }
//     _isTimerRunning = false;
//     _remainingSeconds = 0;
//     notifyListeners();
//   }

//   /// 🔁 Restart timer (use same duration)
//   void restartTimer({int seconds = 30}) {
//     stopTimer();
//     startTimer(seconds: seconds);
//   }

//   /// ------------------Send password reset link to email

//   Future<void> sendPasswordResetEmail({
//     required String email,
//     required BuildContext context,
//   }) async {
//     try {
//       final FirebaseAuth auth = FirebaseAuth.instance;
//       startTimer();
//       await auth.sendPasswordResetEmail(email: email);
//       print('Password reset email sent to $email');
//       CustomSnackBar.success('Password reset email sent to $email');
//       await Future.delayed(Duration(seconds: 4));
//       Navigator.of(context).pop();
//     } on FirebaseAuthException catch (e) {
//       stopTimer();
//       if (e.code == 'user-not-found') {
//         throw Exception('No user found with this email.');
//       } else if (e.code == 'invalid-email') {
//         throw Exception('Invalid email address.');
//       } else if (e.code == 'missing-android-pkg-name' ||
//           e.code == 'missing-ios-bundle-id') {
//         throw Exception('Missing app configuration for password reset.');
//       } else {
//         throw Exception(e.message ?? 'FirebaseAuth Error.');
//       }
//     } catch (e) {
//       stopTimer();
//       CustomSnackBar.error(e.toString());
//     }
//   }
// }



// // class TwitterSignInService {
// //   static final FirebaseAuth _auth = FirebaseAuth.instance;

// //   /// Sign in with Twitter
// //   static Future<UserCredential?> signInWithTwitter() async {
// //     try {
// //       // Create a TwitterLogin instance
// //       final twitterLogin = TwitterLogin(
// //         apiKey: 'WA95ItacUMYTdTAtBfuDSRWyd',
// //         apiSecretKey: 'fm2I6Kg3fnvt4O3RZwCBtDBO8mVgEUJrZpr31q7ZjCZVCbDOph',
// //         redirectURI: 'qrscanner5://',
// //       );

// //       // Trigger the sign-in flow
// //       final result = await twitterLogin.login();

// //       // Check for error
// //       if (result.status != TwitterLoginStatus.loggedIn ||
// //           result.authToken == null ||
// //           result.authTokenSecret == null) {
// //         throw FirebaseAuthException(
// //           code: 'twitter-login-failed',
// //           message: result.errorMessage ?? 'Twitter login failed',
// //         );
// //       }

// //       // Create a credential for Firebase
// //       final twitterAuthCredential = TwitterAuthProvider.credential(
// //         accessToken: result.authToken!,
// //         secret: result.authTokenSecret!,
// //       );

// //       // Sign in to Firebase
// //       final userCredential =
// //           await _auth.signInWithCredential(twitterAuthCredential);

// //       return userCredential;
// //     } catch (e) {
// //       print('Twitter Sign-In Error: $e');
// //       rethrow; // Rethrow to allow caller to handle it
// //     }
// //   }

// //   /// Sign out from Twitter and Firebase
// //   static Future<void> signOut() async {
// //     try {
// //       await _auth.signOut();
// //     } catch (e) {
// //       print('Twitter Sign-Out Error: $e');
// //       rethrow;
// //     }
// //   }
// // }


// // class AuthService {
// //  static final FirebaseAuth _auth = FirebaseAuth.instance;

// // static Future<User?> createAccount({
// //   required String email,
// //   required String password,
// //   context
// // }) async {
// //   try {
// //     // Create user
// //     UserCredential userCredential =
// //         await _auth.createUserWithEmailAndPassword(email: email, password: password);
// //     User? user = userCredential.user;

// //     if (user == null) throw Exception("User creation failed.");

// //     // Send verification email
// //     await user.sendEmailVerification();
// //     CustomSnackBar.success(context, 'Send Email at $email .Please Verify It');
// //     print('📧 Verification email sent to ${user.email}');

// //     // Wait for verification (up to 1.5 minute)
// //     bool verified = await _waitForEmailVerification(user, timeoutSeconds: 90);

// //     if (!verified) {
// //       await user.delete(); // 🔥 Delete the unverified user
// //       throw Exception("Email not verified.");
// //     }

// //     print('✅ Email verified successfully.');
// //     return user;
// //   } on FirebaseAuthException catch (e) {
// //     if (e.code == 'weak-password') {
// //       throw Exception('Password too weak.');
// //     } else if (e.code == 'email-already-in-use') {
// //       throw Exception('Email already in use.');
// //     } else if (e.code == 'invalid-email') {
// //       throw Exception('Invalid email.');
// //     } else {
// //       throw Exception(e.message ?? 'FirebaseAuth Error.');
// //     }
// //   } catch (e) {
// //     rethrow;
// //   }
// // }

// // static Future<bool> _waitForEmailVerification(User user, {int timeoutSeconds = 90}) async {
// //   int elapsed = 0;
// //   while (elapsed < timeoutSeconds) {
// //     await Future.delayed(const Duration(seconds: 3));

// //     // Reload and get updated user
// //     await _auth.currentUser?.reload();
// //     User? refreshedUser = _auth.currentUser;

// //     if (refreshedUser != null && refreshedUser.emailVerified) {
// //       return true;
// //     }

// //     elapsed += 3;
// //   }
// //   return false;
// // }



// //    /// 🔹 Log in existing user
// //   static Future<User?> login({
// //     required String email,
// //     required String password,
// //   }) async {
// //     try {
// //       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       return userCredential.user;
// //     } on FirebaseAuthException catch (e) {
// //       print("Login Error: ${e.message}");
// //       rethrow;
// //     } catch (e) {
// //       print("Unexpected error during login: $e");
// //       rethrow;
// //     }
// //   }

// //   /// 🔹 Log out the current user
// //   static Future<void> logout() async {
// //     await _auth.signOut();
// //   }

// // }
