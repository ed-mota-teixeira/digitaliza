import 'package:get/get.dart';

class ScannedDocuments extends GetxController {
  var list = [].obs;

  void add(String path) => list.add(path);
}
