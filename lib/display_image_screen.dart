import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upload_document/controller/pdf_controller.dart';
import 'package:upload_document/main.dart';

class DisplayImageScreen extends StatefulWidget {
  final File imageFile;

  const DisplayImageScreen({required this.imageFile});

  @override
  State<DisplayImageScreen> createState() => _DisplayImageScreenState();
}

class _DisplayImageScreenState extends State<DisplayImageScreen> {
  final PDFController pdfController = Get.put(PDFController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Image'),
        actions: [
          IconButton(
            onPressed: () async {
              await pdfController.createPDF();
              await pdfController.savePDF();
              Get.to(const MyApp());
            },
            icon: const Icon(Icons.picture_as_pdf),
          )
        ],
      ),
      body: Center(
        child: Image.file(widget.imageFile),
      ),
    );
  }
}
