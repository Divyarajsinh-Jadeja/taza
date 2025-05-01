import 'package:taza/taza.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    FoodModel model = Get.arguments;
    final style = AppTheme.of(context).foodCardStyle;

    const double gstPercent = 0.05;
    final double itemTotal = model.price * model.quantity;
    final double gstAmount = itemTotal * gstPercent;
    final double deliveryFee = 30.0;
    final double grandTotal = itemTotal + gstAmount + deliveryFee;
    final String orderId = "ORD${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}";
    final String deliveryAddress =  "123 Park Avenue, City Center, NY 10101";

    return Scaffold(
      appBar: SmartAppBar(
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: SmartColumn(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🆔 Order ID
            SmartText("Order ID: $orderId", style: style.subTitleStyle),

            /// 🏪 Restaurant Info
            SmartRow(
              spacing: 12.w,
              children: [
                SmartImage(
                  path: model.imageUrl,
                  size: 70.w,
                  clipBehavior: Clip.antiAlias,
                  imageBorderRadius: style.imageDecoration,
                ),
                SmartColumn(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmartText(
                      model.restaurantName ?? "Unknown Restaurant",
                      style: style.titleStyle,
                    ),
                    SmartRow(
                      spacing: 4.w,
                      children: [
                        SmartImage(path: AppImages.icStar, height: 14.h),
                        SmartText(
                          "${model.rating} • ${model.reviewsCount} reviews",
                          style: style.subTitleStyle,
                        ),
                      ],
                    ),
                    SmartText(
                      "Delivered in ${model.deliveryTime}",
                      style: style.subTitleStyle,
                    ),
                  ],
                ),
              ],
            ),

            Divider(),

            /// 🍽 Food Item
            SmartRow(
              spacing: 10.w,
              children: [
                SmartImage(
                  path: model.isVeg ? AppImages.icVeg : AppImages.icNonVeg,
                  size: 12.w,
                ),
                SmartColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmartText(model.name, style: style.reorderTitleStyle),
                    SmartText(
                      "${model.quantity} x ${model.price.toCurrencyCodeFormat()}",
                      style: style.reorderAmountStyle,
                    ),
                  ],
                ),
              ],
            ),

            Divider(),

            /// 📦 Order Status
            SmartColumn(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartText("Order Status", style: style.reorderTitleStyle),
                SmartText("Delivered on 28 Aug, 4:40PM"),
              ],
            ),

            Divider(),

            /// 💰 Bill Summary
            SmartText("Bill Summary", style: style.reorderTitleStyle),
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmartText("Item Total", style: style.reorderAmountStyle),
                SmartText(itemTotal.toCurrencyCodeFormat()),
              ],
            ),
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmartText("GST (5%)", style: style.reorderAmountStyle),
                SmartText(gstAmount.toCurrencyCodeFormat()),
              ],
            ),
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmartText("Delivery Charges", style: style.reorderAmountStyle),
                SmartText(deliveryFee.toCurrencyCodeFormat()),
              ],
            ),
            Divider(),
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmartText("Grand Total", style: style.amountStyle),
                SmartText(grandTotal.toCurrencyCodeFormat(), style: style.amountStyle),
              ],
            ),

            Divider(),

            /// 🧾 Payment Method
            SmartColumn(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartText("Payment Method", style: style.reorderTitleStyle),
                SmartText("Paid via UPI (Google Pay)", style: style.reorderAmountStyle),
              ],
            ),

            Divider(),

            /// 📍 Delivery Address
            SmartColumn(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartText("Delivery Address", style: style.reorderTitleStyle),
                SmartText(deliveryAddress, style: style.reorderAmountStyle),
                SmartText("Note: Leave at the doorstep", style: style.subTitleStyle),
              ],
            ),

            Divider(),

            /// 🔁 Reorder Button
            Align(
              alignment: Alignment.centerRight,
              child: SmartButton.white(
                onTap: () {},
                title: LocaleKeys.reorder.tr,
                width: 120.w,
                height: 36.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
