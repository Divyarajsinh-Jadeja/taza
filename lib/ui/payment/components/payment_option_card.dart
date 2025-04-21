import 'package:taza/taza.dart';

class PaymentOptionCard extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionCard({super.key, required this.paymentMethod, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).paymentOptionCardStyle;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsetsDirectional.only(bottom: 16.h),
        padding: EdgeInsetsDirectional.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? style.primaryColor.withValues(alpha: 0.2) : style.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: isSelected ? style.primaryColor : style.greyColor),
        ),
        child: SmartRow(
          children: [
            SizedBox(width: 50.w, height: 40.h, child: _buildIcon(paymentMethod.type, style)),
            SizedBox(width: 16.w),
            Expanded(
              child:
                  paymentMethod.number != null
                      ? SmartColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmartText(paymentMethod.number ?? '', style: style.titleStyle),
                          SizedBox(height: 4.h),
                          SmartText(paymentMethod.expiry ?? '', style: style.primaryTitleStyle),
                        ],
                      )
                      : SmartText(paymentMethod.type.name, style: style.titleStyle),
            ),
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Icon(Icons.check_circle, color: style.primaryColor, size: 24.w),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(PaymentType type, PaymentOptionCardStyle style) {
    final double size = 40.w;

    switch (type) {
      case PaymentType.visa:
        return SmartImage(path: 'https://i.ibb.co/hJrhYjw4/Visa-Logo.png', width: size, height: size, fit: BoxFit.contain);

      case PaymentType.mastercard:
        return SmartImage(
          path: 'https://i.ibb.co/mC3sZh1c/mastercard-logo-png-transparent-svg-vector-bie-supply-0.png',
          width: size,
          height: size,
          fit: BoxFit.contain,
        );

      case PaymentType.googlePay:
        return SmartImage(
          path: 'https://fonts.gstatic.com/s/i/productlogos/googleg/v6/24px.svg',
          width: size,
          height: size,
          fit: BoxFit.contain,
        );

      case PaymentType.paypal:
        return SmartImage(path: 'https://i.ibb.co/spVTrcr2/paypal-logo-png-7.png', width: size, height: size, fit: BoxFit.contain);
    }
  }
}
