import 'package:taza/taza.dart';

class MediaCaptureService {
  final ImagePicker _picker = ImagePicker();

  // Capture Photo from Camera
  Future<String?> capturePhotoFromCamera(BuildContext context) async {
    if (await Utils.checkCameraStoragePermissions(context, isCamera: true)) {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      return pickedFile?.path;
    }
    return null;
  }

  // Capture Video from Camera
  Future<String?> captureVideoFromCamera(BuildContext context) async {
    if (await Utils.checkCameraStoragePermissions(context, isCamera: true)) {
      final pickedFile = await _picker.pickVideo(source: ImageSource.camera);
      return pickedFile?.path;
    }
    return null;
  }

  // Pick Photo from Gallery
  Future<String?> pickPhotoFromGallery(BuildContext context) async {
    if (await Utils.checkCameraStoragePermissions(context, isCamera: false)) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      return pickedFile?.path;
    }
    return null;
  }

  // Pick Video from Gallery
  Future<String?> pickVideoFromGallery(BuildContext context) async {
    if (await Utils.checkCameraStoragePermissions(context, isCamera: false)) {
      final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
      return pickedFile?.path;
    }
    return null;
  }
}
