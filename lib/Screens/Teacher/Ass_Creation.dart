import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Appbars/T_Appbar.dart';

class Ass_Creation extends StatefulWidget {
  const Ass_Creation({super.key});

  @override
  State<Ass_Creation> createState() => _Ass_CreationState();
}

class _Ass_CreationState extends State<Ass_Creation> {
  // Dummy data for dropdowns; later to be replaced by API data
  final List<String> firstDropdownItems = ['Bcs-AI', 'Bcs-GC', 'Bcs-SE'];
  final List<String> secondDropdownItems = ['Flutter', 'Option B', 'Option C'];
  final List<String> thirdDropdownItems = ['All', '7A', '7B'];

  // Variables to store selected values
  String? selectedFirst;
  String? selectedSecond;
  String? selectedThird;

  // Button activation based on dropdown selections
  bool get isButtonActive =>
      selectedFirst != null && selectedSecond != null && selectedThird != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: T_ReusableAppbar(
          title: "Teacher",
          avatarUrl: "assets/images/Female_Teacher1.png",
          onBack: Navigator.of(context).pop),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Create Assignment",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // First Dropdown
            const Text(
              "Department",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: selectedFirst,
              decoration: const InputDecoration(
                  hintText: 'Select required Department',
                  hintStyle: TextStyle(fontSize: 14)),
              items: firstDropdownItems
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedFirst = value;
                  selectedSecond = null;
                  selectedThird = null;
                });
              },
            ),
            const SizedBox(height: 35),
            // Second Dropdown - enabled only if first dropdown has a value
            const Text(
              "Courses",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: selectedSecond,
              decoration: const InputDecoration(
                  hintText: 'Select required Courses',
                  hintStyle: TextStyle(fontSize: 14)),
              items: secondDropdownItems
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(
                          option,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ))
                  .toList(),
              onChanged: selectedFirst != null
                  ? (value) {
                      setState(() {
                        selectedSecond = value;
                        selectedThird = null;
                      });
                    }
                  : null, // Disable dropdown if no selection in first dropdown
            ),
            const SizedBox(height: 35),

            // Third Dropdown - enabled only if second dropdown has a value
            const Text(
              "Section",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: selectedThird,
              decoration: const InputDecoration(
                  hintText: 'Select required Section',
                  hintStyle: TextStyle(fontSize: 14)),
              items: thirdDropdownItems
                  .map((choice) => DropdownMenuItem(
                        value: choice,
                        child: Text(
                          choice,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ))
                  .toList(),
              onChanged: selectedSecond != null
                  ? (value) {
                      setState(() {
                        selectedThird = value;
                      });
                    }
                  : null, // Disable dropdown if no selection in second dropdown
            ),
            const SizedBox(height: 50),

            // Button - activated only if all dropdowns have selected values
            ElevatedButton(
              onPressed: isButtonActive
                  ? () {
                      // Handle button click
                      print("All items selected, button clicked!");
                    }
                  : null, // Disable button if not all selections are made
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isButtonActive ? Colors.deepPurple : Colors.grey,
                  minimumSize: const Size(00, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'Create',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
