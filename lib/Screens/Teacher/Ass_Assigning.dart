import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Appbars/T_Appbar.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/File%20Display%20Card/FileDisplay.dart';

class AssigningAssignment extends StatefulWidget {
  const AssigningAssignment({super.key});

  @override
  State<AssigningAssignment> createState() => _AssigningAssignmentState();
}

class _AssigningAssignmentState extends State<AssigningAssignment> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  PlatformFile? pickedFile;
  bool showbuttons = false;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );
    if (result != null) {
      setState(() {
        pickedFile = result.files.first;
        showbuttons = true;
      });
    }
  }

  void _clearFile() {
    setState(() {
      pickedFile = null;
      showbuttons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: T_ReusableAppbar(
        title: 'Teacher',
        avatarUrl: 'assets/images/Female_Teacher1.png',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Compiler Construction',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Bcs-4A',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Title TextField
              const Text('Title'),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter something here',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Last Date'),
                        TextField(
                          controller: _dateController,
                          decoration: const InputDecoration(
                            hintText: 'Select Date',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.calendar_month_outlined,
                                color: Color.fromARGB(255, 77, 58, 248)),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              _dateController.text =
                                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Time'),
                        TextField(
                          controller: _timeController,
                          decoration: const InputDecoration(
                            hintText: 'Select Time',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 77, 58, 248),
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              // ignore: use_build_context_synchronously
                              _timeController.text = pickedTime.format(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 235,
                      child: CustomPaint(
                        painter: DashedBorderPainter(
                          color: const Color.fromARGB(255, 114, 114, 114),
                          strokeWidth: 2.0,
                          dashWidth: 7.0,
                          dashSpace: 7.0,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(144, 219, 218, 216)),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/cloud-upload.svg',
                                height: 85,
                              ),
                              const Text(
                                'DRAG FILES HERE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Drag and drop files here \n or browse your gallery',
                                style: TextStyle(fontSize: 16, height: 1.2),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ElevatedButton(
                                onPressed: _pickFile,
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  backgroundColor:
                                      const Color.fromARGB(255, 77, 58, 248),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 55, vertical: 13),
                                ),
                                child: const Text(
                                  'Browse File',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              if (pickedFile != null)
                FileDisplayWidget(
                  fileName: basename(pickedFile!.name),
                  fileExtension: pickedFile!.extension ?? '',
                  fileSize: pickedFile!.size,
                ),

              const SizedBox(
                height: 10,
              ),
              if (showbuttons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.topSlide,
                            showCloseIcon: true,
                            title: "Success",
                            desc: "Your assignment has been submitted",
                            btnOkOnPress: () {},
                          ).show();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            backgroundColor: const Color(0xFF11A631),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 42, vertical: 15)),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    ElevatedButton(
                      onPressed: _clearFile,
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        backgroundColor: const Color(0xFFD81616),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                      child: const Text(
                        'Remove',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(size.width, startY),
          Offset(size.width, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }

    startX = size.width;
    while (startX > 0) {
      canvas.drawLine(Offset(startX, size.height),
          Offset(startX - dashWidth, size.height), paint);
      startX -= dashWidth + dashSpace;
    }

    startY = size.height;
    while (startY > 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY - dashWidth), paint);
      startY -= dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
