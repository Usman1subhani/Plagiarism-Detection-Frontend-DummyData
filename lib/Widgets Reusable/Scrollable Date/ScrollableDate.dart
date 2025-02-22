import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScrollableDateBar extends StatelessWidget {
  final String selectedDate;
  final Function(String) onDateSelected;

  const ScrollableDateBar({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a reference date for consistency
    DateTime referenceDate = DateTime.now();

    return SizedBox(
      height: 60, // Increase height to accommodate days and dates.
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          // Generate date dynamically relative to the selected date
          DateTime dateTime = referenceDate
              .add(Duration(days: index - 15)); // Center around today
          String date = DateFormat('yyyy-MM-dd').format(dateTime);
          String day =
              DateFormat('EEE').format(dateTime); // First 3 letters of the day.

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day, // Display day
                    style: TextStyle(
                      fontSize: date == selectedDate ? 19 : 16,
                      color: date == selectedDate ? Colors.green : Colors.black,
                      fontWeight: date == selectedDate
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 2), // Add spacing between day and date
                  Text(
                    date.substring(8), // Display date (day of the month)
                    style: TextStyle(
                      fontSize: date == selectedDate ? 16 : 14,
                      color: date == selectedDate ? Colors.green : Colors.black,
                      fontWeight: date == selectedDate
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
