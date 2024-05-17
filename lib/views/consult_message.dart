import 'package:flutter/material.dart';

class consultMessagePage extends StatefulWidget {
  const consultMessagePage({super.key});

  @override
  _consultMessagePageState createState() => _consultMessagePageState();
}

class _consultMessagePageState extends State<consultMessagePage> {
  String groupValue1 = "Never";
  String groupValue2 = "Never";
  String groupValue3 = "Never";
  String groupValue4 = "Never";
  String groupValue5 = "Never";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diagnostic Test"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                "In the past month, how often have you...",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              buildQuestion(
                "Felt upset because of something that happened unexpectedly?",
                groupValue1,
                (value) {
                  setState(() {
                    groupValue1 = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              buildQuestion(
                "Felt that you were unable to control the important things in your life?",
                groupValue2,
                (value) {
                  setState(() {
                    groupValue2 = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              buildQuestion(
                "Felt nervous and stressed?",
                groupValue3,
                (value) {
                  setState(() {
                    groupValue3 = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              buildQuestion(
                "Felt confident about your ability to handle your personal problems?",
                groupValue4,
                (value) {
                  setState(() {
                    groupValue4 = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              buildQuestion(
                "Felt that things were going your way?",
                groupValue5,
                (value) {
                  setState(() {
                    groupValue5 = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff004AAD), // Set the background color
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuestion(String question, String groupValue, Function(String?) onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.all(20), // Add padding to the container
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 250, 176), // Set the box color
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          RadioListTile(
            title: const Text("Never"),
            value: "Never",
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          RadioListTile(
            title: const Text("Rarely"),
            value: "Rarely",
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          RadioListTile(
            title: const Text("Sometimes"),
            value: "Sometimes",
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          RadioListTile(
            title: const Text("Fairly often"),
            value: "Fairly often",
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          RadioListTile(
            title: const Text("Very often"),
            value: "Very often",
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: consultMessagePage(),
  ));
}
