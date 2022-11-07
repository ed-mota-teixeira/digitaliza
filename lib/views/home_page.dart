import 'package:digitaliza/ctrl/scanned_documents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ScannedDocuments scannedDocs = Get.put(ScannedDocuments());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Digitaliza'),
              excludeHeaderSemantics: true,
              actions: [
                IconButton(onPressed: () => Get.toNamed('/scan'), icon: const Icon(Icons.scanner)),
              ],
            ),
            body: Obx(
              () => ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(scannedDocs.list.elementAt(index)),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: scannedDocs.list.length),
            )));
  }
}
