import 'package:image_picker/image_picker.dart';

abstract class StorageService {
  Future<String?> uploadImage(String? author, String? title, XFile? image);
  Future<String?> getDownloadUrl(String? author, String? title);
  Future<void> deleteFile(String route);
}
