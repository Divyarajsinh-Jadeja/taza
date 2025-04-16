import 'package:taza/taza.dart';

class TermsPrivacyWidget extends StatelessWidget {
  const TermsPrivacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).loginPageStyle;
    return Align(
      alignment: AlignmentDirectional.center,
      child: SmartRichText(
        textAlign: TextAlign.center,
        spans: [
          SmartTextSpan(
            text: "${LocaleKeys.byContinueTerms.tr} ",
            style: style.bottomTextStyle,
          ),
          SmartTextSpan(
            text: "${LocaleKeys.termsOfUse.tr} ",
            style: style.termsAndPrivacyTextStyle,
          ),
          SmartTextSpan(
            text: "${LocaleKeys.and.tr} ",
            style: style.bottomTextStyle,
          ),
          SmartTextSpan(
            text: LocaleKeys.privacyPolicy.tr,
            style: style.termsAndPrivacyTextStyle,
          ),
        ],
      ),

    );
  }
}
