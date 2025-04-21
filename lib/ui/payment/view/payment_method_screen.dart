import 'package:taza/taza.dart';

class PaymentMethodScreen extends GetView<PaymentController> {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).paymentOptionCardStyle;
    return Scaffold(
      backgroundColor: style.whiteColor,
      bottomNavigationBar: SafeArea(
        child: Obx(() {
          final selectedMethod = controller.selectedPayment.value.name;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: SmartButton(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              onTap: () {
                Get.snackbar(
                  'Payment Confirmed',
                  'Proceeding with ${controller.selectedPayment.value.name}',
                  backgroundColor: style.primaryColor.withValues(alpha: 0.2),
                );
              },
              title: 'Confirm · ${selectedMethod.capitalize}',
            ),
          );
        }),
      ),
      appBar: SmartAppBar(
        isCenter: true,
        backgroundColor: style.whiteColor,
        title: 'Payment Method',
        actions: [
          TextButton(
            onPressed: () {
              Get.snackbar('Add Payment', 'Add new payment method clicked');
            },
            child: SmartRow(
              children: [
                Icon(Icons.add, color: style.primaryColor),
                SmartText('Add', style: style.subTitleStyle.copyWith(color: style.primaryColor)),
              ],
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.w),
          itemCount: controller.paymentMethods.length,
          itemBuilder: (context, index) {
            return Obx(() {
              final method = controller.paymentMethods[index];
              final isSelected = controller.selectedPayment.value == method.type;
              return PaymentOptionCard(paymentMethod: method, isSelected: isSelected, onTap: () => controller.selectPayment(method.type));
            });
          },
        ),
      ),
    );
  }
}
