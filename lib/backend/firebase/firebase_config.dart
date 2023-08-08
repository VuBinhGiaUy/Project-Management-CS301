import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDKO6p16Cw_PFNWoJ3Bz5RzJO9rY6_s5RE",
            authDomain: "projectmanagement-54fa2.firebaseapp.com",
            projectId: "projectmanagement-54fa2",
            storageBucket: "projectmanagement-54fa2.appspot.com",
            messagingSenderId: "241173725281",
            appId: "1:241173725281:web:0db49caec011ae6bbfaa20",
            measurementId: "G-64M12MK7BJ"));
  } else {
    await Firebase.initializeApp();
  }
}
