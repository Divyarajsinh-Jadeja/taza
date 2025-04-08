import 'package:taza/taza.dart';

enum ImageType {
  asset,
  network,
  file,
  svg,
}

/// DIY Progress Bar Chevron Widget Enums
enum Edge { top, right, bottom, left }

enum Clipper { start, center, end }

enum InlineSpanType {
  text,
  widget,
}

// enum GenderType {
//   male(1, APPStrings.male, "Male"),
//   female(2, APPStrings.female, "Female"),
//   other(3, APPStrings.other, "Other"),
//   ;
//
//   final int value;
//   final String labelKey;
//   final String apiValue;
//
//   const GenderType(this.value, this.labelKey, this.apiValue);
// }

enum MessageSendType {
  send,
  receive,
  timeStart,
}

enum GeoLocatorError {
  locationServicesDisabled('location_services_disabled'),
  locationPermissionsDenied('location_permissions_denied'),
  locationPermissionsDeniedPermanently('location_permissions_denied_permanently'),
  ;

  const GeoLocatorError(this.code);

  final String code;
}
