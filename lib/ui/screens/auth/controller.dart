import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tkchatfinal/core/entities/user.dart';
import 'package:tkchatfinal/core/routes/routes.dart';
import 'package:tkchatfinal/core/store/user.dart';
import 'package:tkchatfinal/ui/screens/screens.dart';
import 'package:tkchatfinal/ui/widgets/widgets.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    "openid",
  ],
);

class SignInController extends GetxController {
  final state = SignInState();
  SignInController();
  final db = FirebaseFirestore.instance;
  Future<void> handleGoogleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
        final gAuth = await user.authentication;
        final gCredential = GoogleAuthProvider.credential(
          idToken: gAuth.idToken,
          accessToken: gAuth.accessToken,
        );
        await FirebaseAuth.instance.signInWithCredential(gCredential);
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";
        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.displayName = displayName;
        userProfile.email = email;
        userProfile.accessToken = id;
        userProfile.photoUrl = photoUrl;
        UserStore.to.saveProfile(userProfile);
        var userbase = await db
            .collection("users")
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userData, options) =>
                  userData.toFirestore(),
            )
            .where("id", isEqualTo: id)
            .get();
        if (userbase.docs.isEmpty) {
          final data = UserData(
            id: id,
            name: displayName,
            photourl: photoUrl,
            email: email,
            location: "",
            fcmtoken: "",
            addtime: Timestamp.now(),
          );
          await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userData, options) =>
                    userData.toFirestore(),
              )
              .add(data);
        }
        toastInfo(msg: "Login Success");
        Get.offAllNamed(AppRoutes.Application);
      }
    } catch (err) {
      toastInfo(msg: "Login Error");
      throw Exception(err);
    }
  }

  @override
  void onReady() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log("User is currently logged out");
      } else {
        log("User is logged in");
      }
    });
    super.onReady();
  }
}
