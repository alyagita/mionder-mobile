
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmobprak/views/edit_profile_page.dart';
import 'package:pmobprak/views/notification_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.changeTab});
  final void Function(int index) changeTab;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFBFBFB),
        title: const Text("My Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/images/alya.png"),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          user.displayName.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          user.email.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()),
                    );
                  },
                  child: const Icon(
                    Icons.edit_sharp,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            child: const Text("Account"),
          ),
          const SizedBox(height: 15),
          Container(
            child: GestureDetector(
              onTap: () {
              widget.changeTab(1);
              Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(Icons.note_alt_outlined),
                  SizedBox(width: 10),
                  Text(
                    "My Orders",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(0.5),
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const notificationPage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.notifications_active_outlined),
                      SizedBox(width: 10),
                      Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(0.5),
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              signOut();
              // log("berhasil logout");
              Navigator.popAndPushNamed(context, 'login_page');
              // Navigator.pushNamed(context, 'login_page');
              // Navigator.push(
              //     context,
              //     DialogRoute(
              //       context: context,
              //       builder: (context) => const LoginPage(),
              //     ));
            },
            child: const Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 10),
                Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
