import 'package:chatconnect/screens/auth.dart';
import 'package:chatconnect/screens/chat.dart';
import 'package:chatconnect/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        //useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 63, 17, 177),
        ),
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges() ,
          builder: (ctx, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return SplashScreen();
            }

            if(snapshot.hasData){
              return const ChatScreen();
            }
            return const AuthScreen();
          }),
    );
  }
}
// class AuthScreen extends StatelessWidget {
//   const AuthScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Auth Screen Loaded!'),
//     );
//   }
// }


