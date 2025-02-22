import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../Assignment Card/AssignmentCard.dart';

class TimelineList extends StatelessWidget {
  final List<Map<String, String>> tasks;

  const TimelineList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tasks.isNotEmpty
        ? SizedBox(
            height: 300, // Set a specific height for the ListView
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Stack(
                  children: [
                    Positioned(
                      top: 105,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          task['time']!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.2,
                      indicatorStyle: const IndicatorStyle(
                        width: 15,
                        color: Color(0xFF6929C4),
                      ),
                      endChild: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to NotifyBox or other functionality here
                          },
                          child: AssignmentCard(
                            courseTitle: task['courseTitle']!,
                            assignmentTitle: task['assignmentTitle']!,
                            time: task['time']!,
                            date: task['date']!,
                            fileName: task['fileName']!,
                          ),
                        ),
                      ),
                      beforeLineStyle: const LineStyle(
                        color: Color(0xFF6929C4),
                        thickness: 2,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        : const Center(
            child: Text(
              "You don’t have any work here.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
  }
}
