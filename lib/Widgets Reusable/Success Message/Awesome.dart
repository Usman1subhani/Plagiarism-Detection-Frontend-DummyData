import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class MyAwesomeDialog extends StatefulWidget {
  const MyAwesomeDialog({super.key});

  @override
  State<MyAwesomeDialog> createState() => _MyAwesomeDialogState();
}

class _MyAwesomeDialogState extends State<MyAwesomeDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome Dialog Testing"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.topSlide,
              showCloseIcon: true,
              title: "Success",
              desc: "Your assignment has been submitted",
              btnOkOnPress: () {},
            ).show(); // Call the show method to display the dialog
          },
          child: const Text("Show Success Dialog"),
        ),
      ),
    );
  }
}
