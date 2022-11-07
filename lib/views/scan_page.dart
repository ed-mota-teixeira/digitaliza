import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:digitaliza/ctrl/scanned_documents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanPage extends StatelessWidget {
  ScanPage({super.key});

  final ScannedDocuments scannedDocs = Get.put(ScannedDocuments());

  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      scannedDocs.list.addAll(pictures);
    } catch (e) {
      debugPrint(e.toString());
      Get.showSnackbar(const GetSnackBar(message: 'Failed to scan data'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Capture'),
        actions: [
          IconButton(
            onPressed: () => onPressed(),
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  for (var picture in scannedDocs.list) Image.file(File(picture)),
                ],
              ))),
    ));
  }
}
