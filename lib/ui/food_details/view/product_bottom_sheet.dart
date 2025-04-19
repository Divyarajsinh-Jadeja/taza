import 'package:taza/taza.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodDetailsPageStyle;
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(color: style.whiteColor, borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      children: [
        // Centered and bold title for prominence
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: 8.w),
            child: SmartText('Daawat Basmati Rice - Super', style: style.titleTextStyle.copyWith(fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(height: 16.h),
        ProductCard(
          style: style,
          imageUrl: 'https://i.ibb.co/wZDz4H7c/daawat-basmati-rice-rozana-gold-1-kg-quick-pantry.jpg',
          quantityText: '1 kg x 2',
          currentPrice: '₹290',
          oldPrice: '₹400',
          perKgPrice: '₹145/kg',
          discountText: '27% OFF',
          isBestValue: true,
          onAdd: () {
            // TODO: Update total price logic here
          },
        ),
        SizedBox(height: 12.h),
        ProductCard(
          style: style,
          imageUrl: 'https://i.ibb.co/wZDz4H7c/daawat-basmati-rice-rozana-gold-1-kg-quick-pantry.jpg',
          quantityText: '1 kg x 2',
          currentPrice: '₹149',
          oldPrice: '₹200',
          perKgPrice: null,
          discountText: '25% OFF',
          onAdd: () {
            // TODO: Update total price logic here
          },
        ),
        SizedBox(height: 16.h),
        _buildBottomBar(style),
      ],
    );
  }

  Widget _buildBottomBar(FoodDetailsPageStyle style) {
    // TODO: Replace with dynamic total from state management (e.g., Provider, Riverpod)
    final total = '₹0'; // Placeholder for dynamic total
    return SmartRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      decoration: BoxDecoration(color: style.iconColors, borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 12.h),
      children: [
        SmartText('Item total: $total', style: style.bottomSheetAddButtonStyle),
        GestureDetector(
          onTap: () {
            // TODO: Implement confirm action
          },
          child: SmartText('Confirm', style: style.bottomSheetAddButtonStyle),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final FoodDetailsPageStyle style;
  final String imageUrl;
  final String quantityText;
  final String currentPrice;
  final String oldPrice;
  final String? perKgPrice;
  final String discountText;
  final bool isBestValue;
  final VoidCallback onAdd;

  const ProductCard({
    Key? key,
    required this.style,
    required this.imageUrl,
    required this.quantityText,
    required this.currentPrice,
    required this.oldPrice,
    this.perKgPrice,
    required this.discountText,
    this.isBestValue = false,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Card(
      elevation: isBestValue ? 0 : 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Stack(
        children: [
          SmartRow(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: style.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE3E3E3)),
            ),
            children: [
              // Image with error handling
              SmartImage(path: imageUrl, height: 64.w, width: 64.w),
              SizedBox(width: 12.w),
              Expanded(
                child: SmartRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmartText(quantityText, style: style.bottomSheetKgStyle),
                    Container(height: 64.h, width: 0.35.w, color: style.flashColors),
                    _PriceSection(style: style, currentPrice: currentPrice, oldPrice: oldPrice, perKgPrice: perKgPrice),
                    _AddButton(style: style, onAdd: onAdd),
                  ],
                ),
              ),
            ],
          ),
          // Discount badge positioned at top-left
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(color: style.iconColors, borderRadius: const BorderRadius.only(topLeft: Radius.circular(8))),
              child: SmartText(discountText, style: style.bottomSheetPercentageStyle),
            ),
          ),
        ],
      ),
    );

    if (isBestValue) {
      return Card(
        color: style.bottomSheetBestValueBgColor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: Container(
          padding: EdgeInsetsDirectional.all(1.w),
          decoration: BoxDecoration(
            color: style.bottomSheetBestValueBgColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFE3E3E3)),
          ),
          child: SmartColumn(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsetsDirectional.only(top: 4.h), child: SmartText('BEST VALUE', style: style.bestValueTitleStyle)),
              content,
            ],
          ),
        ),
      );
    }

    return content;
  }
}

class _PriceSection extends StatelessWidget {
  final FoodDetailsPageStyle style;
  final String currentPrice;
  final String oldPrice;
  final String? perKgPrice;

  const _PriceSection({required this.style, required this.currentPrice, required this.oldPrice, this.perKgPrice});

  @override
  Widget build(BuildContext context) {
    return SmartColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (perKgPrice != null) SmartText(perKgPrice!, style: style.bottomSheetPerKgPriceStyle),
        SizedBox(height: 8.h),
        SmartRow(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartText(currentPrice, style: style.bottomSheetCurrentPriceStyle),
            SizedBox(width: 6.w),
            SmartText(
              oldPrice,
              style: style.bottomSheetOldPriceStyle.copyWith(
                decoration: TextDecoration.lineThrough, // Strikethrough for old price
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final FoodDetailsPageStyle style;
  final VoidCallback onAdd;

  const _AddButton({required this.style, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAdd,
      style: ElevatedButton.styleFrom(
        backgroundColor: style.iconColors,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      ),
      child: SmartText('ADD', style: style.bottomSheetAddButtonStyle),
    );
  }
}
