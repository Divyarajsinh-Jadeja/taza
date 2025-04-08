import 'package:taza/taza.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Manage Customer Account"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: controller.navigateToManageCustomerAccount,
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Task Management"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: controller.navigateToTaskManagement,
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text("Media Capture"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              controller.media(context);
            },
          ),
          // Signature(controller: controller.signatureController, width: 300.w, height: 300.w, backgroundColor: Colors.lightBlueAccent),
          // SmartButton(
          //   margin: EdgeInsets.all(16.h),
          //   onTap: () {
          //     controller.signatureController.toPngBytes().then((value) {
          //       controller.signatureController.clear();
          //       controller.signatureImage = value;
          //       print(value);
          //     });
          //   },
          //   title: "Save Signature",
          // ),
          // controller.signatureImage != null ? Image.memory(controller.signatureImage!, height: 150.h) : Text("No signature saved"),
        ],
      ),
    );
  }
}
