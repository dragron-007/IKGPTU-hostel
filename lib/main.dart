import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ptu_hostel/Screens/SplashScreen.dart';
import 'package:ptu_hostel/api/firebase_api.dart';
import 'package:ptu_hostel/Screens/notification_page.dart';
import 'package:ptu_hostel/idform.dart';
import 'package:ptu_hostel/Screens/SiginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ptu_hostel/Screens/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  await FirebaseApi(navigatorKey: navigatorKey).initNotification();

  runApp(MyApp(navigatorKey: navigatorKey));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: SplashScreen(),
      routes: {
        '/notification_screen': (context) => NotificationPage(),
      },
    );
  }
}

// AuthenticationWrapper should be declared outside of the MyApp class
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading indicator can be shown here
          return CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data != null) {
          // User is signed in
          return HomePage(); // Make sure HomePage is imported and properly defined
        } else {
          // User is not signed in
          return LoginPage(); // Make sure LoginPage is imported and properly defined
        }
      },
    );
  }
}
