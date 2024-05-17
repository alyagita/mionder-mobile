import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmobprak/views/login_page.dart';
import 'package:pmobprak/views/notification_page.dart';
import 'package:pmobprak/views/reservation_page.dart';
import 'package:pmobprak/views/home_page.dart';
import 'package:pmobprak/views/profile_page.dart';
import 'package:pmobprak/views/signup_page.dart';
import 'package:pmobprak/views/social_page.dart';
import 'package:pmobprak/views/tracker_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0xffFBFBFB)),
              useMaterial3: true,
            ),
            initialRoute: snapshot.data != null ? 'home_page' : 'login_page',
            routes: {
              'home_page': (context) => const MyHomePage(),
              'signup_page': (context) => const SignupPage(),
              'login_page': (context) => const LoginPage(),
            },
            // home:
            //     snapshot.data != null ? const MyHomePage() : const LoginPage(),
          );
        }
        return const LoginPage();
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTab = 0;
  List<Widget> pages = [];
  @override
  void initState() {
    pages = <Widget>[
    HomePage(changeTab: changeTab,),
    const TrackerPage(),
    const ReservationPage(),
    const SocialPage(),
  ];
    // TODO: implement initState
    super.initState();
  }

  void changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFBFBFB),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ProfilePage(changeTab: changeTab,)),
                  );
                },
                child: const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/alya.png"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const notificationPage()),
                  );
                },
                child: const Icon(
                  Icons.notifications_none,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        body: pages[selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTab,
          onTap: (index) => changeTab(index),
          iconSize: 30,
          mouseCursor: SystemMouseCursors.grab,
          selectedFontSize: 10,
          selectedIconTheme:
              const IconThemeData(color: Color(0xff004AAD), size: 40),
          selectedItemColor: const Color(0xff004AAD),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedIconTheme: const IconThemeData(
            color: Color(0xff018CF8),
          ),
          unselectedItemColor: const Color(0xff018CF8),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Tracker',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.domain_verification),
              label: 'Reservation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: 'Reviews',
            ),
          ],
        ));
  }
}
