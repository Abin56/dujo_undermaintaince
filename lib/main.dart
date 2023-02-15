import 'package:dujo_website/view/pages/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyANdsgHSqGl6sxiCt7VHWu6rtJDx5mdwwI",
        authDomain: "lepton-dujo-official.firebaseapp.com",
        projectId: "lepton-dujo-official",
        storageBucket: "lepton-dujo-official.appspot.com",
        messagingSenderId: "983512130711",
        appId: "1:983512130711:web:991cea266a41c65a55b5d2"),
  );
  ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(1536, 792),
        builder: (context, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: const Color(0xFF02BB9F),
                primaryColorDark: const Color(0xFF167F67),
                // ignore: deprecated_member_use
                accentColor: const Color(0xFF02BB9F),
              ),
              home: const HomePage());
        });
  }
}


class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
