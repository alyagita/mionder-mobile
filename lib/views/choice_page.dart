import 'package:flutter/material.dart';

class choicePage extends StatelessWidget {
  const choicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Consultation Method'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('How would you like to consult?'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan fungsi yang ingin dieksekusi saat tombol panggilan ditekan
                          print('Consult via Call');
                          Navigator.of(context).pop();
                        },
                        child: const Text('Consult via Call'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan fungsi yang ingin dieksekusi saat tombol pesan ditekan
                          print('Consult via Message');
                          Navigator.of(context).pop();
                        },
                        child: const Text('Consult via Message'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Text('Open Consultation Options'),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: choicePage(),
  ));
}
