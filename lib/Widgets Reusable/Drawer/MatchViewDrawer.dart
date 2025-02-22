import 'package:flutter/material.dart';

class MatchOverviewDrawer extends StatelessWidget {
  final Function onDownload;

  const MatchOverviewDrawer({super.key, required this.onDownload});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Match Overview",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () => onDownload(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with your data count
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.do_not_disturb_alt_sharp,
                            color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Ignore",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    // Handle delete action
                  },
                  child: ListTile(
                    leading: Text(
                      "${index + 1}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    title: const Center(
                      child: Text(
                        "Course Name",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Assignment 0${index + 1}"),
                          Text("2021-Arid-021${index + 7}"),
                        ],
                      ),
                    ),
                    trailing: Text(
                      "${(index + 1) * 1}%",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
