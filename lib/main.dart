import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mafia_chat/screens/chat_page.dart';
import 'package:mafia_chat/screens/kirish.dart';
import 'package:mafia_chat/screens/sign_in.dart';
import 'package:mafia_chat/screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _authUser = FirebaseAuth.instance;

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute:
          _authUser.currentUser != null ? 'chat_ekran' : 'kirish_ekran',
      routes: {
        'kirish_ekran': (context) => const KirishEkrani(),
        'chat_ekran': (context) => const ChatPage(),
        'sign_in': (context) => const SignIn(),
        'sign_up': (context) => SignUp(),
      },
      // home: KirishEkrani(),
    );
  }
}
