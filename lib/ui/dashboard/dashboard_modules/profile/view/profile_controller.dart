import 'package:taza/taza.dart';

class ProfileController extends GetxController {
  final MediaCaptureService mediaCaptureService = MediaCaptureService();
  Uint8List? signatureImage;

  @override
  void onInit() {
    debugPrint("ProfileController onInit");
    super.onInit();
  }
  
  void navigateToManageCustomerAccount() {
    // Get.toNamed(AppRoutes.manageCustomerPage);
  }

  void navigateToTaskManagement() {
   // Get.toNamed(AppRoutes.taskManagementPage);
  }

  void media(BuildContext context) {
    mediaCaptureService.capturePhotoFromCamera(context);
  }
}
