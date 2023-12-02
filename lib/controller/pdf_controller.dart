import 'dart:io';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class PDFController extends GetxController {
  late File? _image;
  late pw.Document pdf;

  Future<void> createPDF() async {
    if (_image != null) {
      final image = pw.MemoryImage(await _image!.readAsBytes());
      pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(child: pw.Image(image));
        },
      ));
    } else {}
  }

  Future<void> savePDF() async {
    try {
      final List<Directory>? dir = await getExternalStorageDirectories();
      if (dir != null && dir.isNotEmpty) {
        final Directory selectedDir = dir[0]; // Selecting the first directory
        final file =
            File('${selectedDir.path}/${DateTime.now().toString()}.pdf');
        await file.writeAsBytes(await pdf.save());
        Get.snackbar('Success', 'PDF saved to: ${file.path}');
      } else {
        Get.snackbar('Error', 'External storage directory not found.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error saving PDF: $e');
    }
  }

  void setImage(File imageFile) {
    _image = imageFile;
    pdf = pw.Document();
  }
}
