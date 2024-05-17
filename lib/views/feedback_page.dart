import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmobprak/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FeedbackDialog(),
    );
  }
}

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          Color.fromARGB(255, 255, 250, 176), // Background color of the dialog
      title: const Text(
        'Feedback',
        style: TextStyle(color: Colors.black), // Title text color
      ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Enter your feedback here',
            hintStyle: TextStyle(
                color: Color(0xff004AAD),
                fontWeight: FontWeight.w300), // Hint text color
            filled: true,
            fillColor: Color(0xffD2E0FB), // Background color of the text field
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          style: TextStyle(color: Colors.black), // Input text color
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red), // Text color for Cancel button
          ),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text(
            'Send',
            style: TextStyle(color: Colors.blue), // Text color for Send button
          ),
          onPressed: () async {
            if (_formKey.currentState?.validate() == true) {
              String message = '';

              try {
                final collection =
                    FirebaseFirestore.instance.collection('feedback');

                await collection.doc().set({
                  'timestamp': FieldValue.serverTimestamp(),
                  'feedback': _controller.text,
                });
              } catch (_) {
                message = 'Error sending feedback. Please try again later.';
              }
              ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(message)));
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
