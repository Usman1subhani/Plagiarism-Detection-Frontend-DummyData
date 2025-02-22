import 'package:flutter/material.dart';

class FileDownloadingCard extends StatelessWidget {
  final String fileName;
  final String fileExtension;
  final int fileSize;
  final VoidCallback onDownload;

  const FileDownloadingCard({
    Key? key,
    required this.fileName,
    required this.fileExtension,
    required this.fileSize,
    required this.onDownload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData getFileIcon(String extension) {
      switch (extension.toLowerCase()) {
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
      decoration: BoxDecoration(
        color: const Color.fromARGB(144, 219, 218, 216),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // File Icon Container
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: fileExtension.toLowerCase() == 'pdf'
                  ? Colors.red
                  : Colors.blue,
            ),
            child: Center(
              child: Icon(
                getFileIcon(fileExtension),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // File Info (Assignment number, file name, size)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: const TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  '${(fileSize / 1024).toStringAsFixed(2)} KB',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 133, 133, 133),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Download Button Icon on the right
          IconButton(
            icon: const Icon(Icons.cloud_download_outlined),
            color: const Color.fromARGB(255, 136, 71, 228),
            iconSize: 40,
            onPressed: onDownload,
          ),
        ],
      ),
    );
  }
}
