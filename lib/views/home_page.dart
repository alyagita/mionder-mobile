import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmobprak/views/feedback_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.changeTab});
  final void Function(int index) changeTab;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(
          height: 24,
        ),
        const Text("Good Evening,",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.normal,
            )),
        Text(user.displayName.toString(),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(
          height: 18,
        ),
        const Text("How are you feeling today?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            )),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xffEF5DA8),
                          title: const Text(
                            "Yeay!",
                            style: TextStyle(color: Colors.white),
                          ),
                          content: const Text(
                            "Thank you for being happy <3",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Back',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xffEF5DA8),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Image.asset("assets/images/happy.png"),
                  ),
                ),
                const Text(
                  "Happy",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xffAEAFF7),
                          title: Text(
                            "Wohoo!",
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Text(
                            "Calmness is the key to overcoming challenges :)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Back',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Color(0xffAEAFF7),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset("assets/images/calm.png"),
                  ),
                ),
                const Text(
                  "Calm",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xffA0E3E2),
                          title: Text(
                            "Stay Calm!",
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Text(
                            "Let's take a moment to breathe and calm down!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Back',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Color(0xffA0E3E2),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset("assets/images/manic.png"),
                  ),
                ),
                const Text(
                  "Manic",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xffF09E54),
                          title: Text(
                            "Keep Cool!",
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Text(
                            "Let's take a moment to relax, and find a solution together...",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Back',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Color(0xffF09E54),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset("assets/images/angry.png"),
                  ),
                ),
                const Text(
                  "Angry",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xffC3F2A6),
                          title: Text(
                            "Take your time!",
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Text(
                            "Even in your darkest moments, know that there's light at the end of the tunnel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Back',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Color(0xffC3F2A6),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset("assets/images/sad.png"),
                  ),
                ),
                const Text(
                  "Sad",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 18, 17, 17)),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 250, 176),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1 on 1 Counseling",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "Let's open up to the things\nthat matter the most",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      changeTab(2);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Book Now ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff004AAD),
                          ),
                        ),
                        Icon(Icons.calendar_month, color: Color(0xff004AAD)),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset("assets/images/session.png")
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                changeTab(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffD2E0FB),
                padding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.book, color: Colors.black),
                  Text(
                    " Tracker",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const FeedbackDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffD2E0FB),
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.menu_book_rounded, color: Colors.black),
                  Text(
                    " Feedback",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 222, 253, 232),
          ),
          padding: const EdgeInsets.all(30),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "“It is better to conquer yourself than\nto win a thousand battles”",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              Icon(
                Icons.format_quote,
                color: Colors.black,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 96, 96),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Emergency Line",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "24-hour crisis counseling and \nsuicide prevention services",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Get Help ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.call,
                size: 50,
                color: Colors.white,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

