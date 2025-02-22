import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FileDisplayWidget extends StatelessWidget {
  final String fileName;
  final String fileExtension;
  final int fileSize;

  const FileDisplayWidget({
    Key? key,
    required this.fileName,
    required this.fileExtension,
    required this.fileSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData getFileIcon(String extension) {
      switch (extension.toUpperCase()) {
        case 'pdf':
          return Icons.picture_as_pdf;
        case 'docx':
          return Icons.description;
        default:
          return Icons.insert_drive_file;
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(144, 219, 218, 216),
      ),
      child: Row(
        children: [
          // Logo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: fileExtension == 'pdf' ? Colors.red : Colors.blue,
            ),
            child: Center(
                child: Icon(
              getFileIcon(fileExtension),
              color: Colors.white,
            )),
          ),
          const SizedBox(width: 10),
          // File Name and Size
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  '${(fileSize / 1024).toStringAsFixed(2)} KB',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 133, 133, 133),
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
