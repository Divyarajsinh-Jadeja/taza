import 'package:taza/taza.dart';

/// All app level utility methods are defined here
class Utils {
  Utils._();

  /// Show common snack bar messages
  static Future<void> showMessage(String? message) async {
    if (message.isNullOrEmpty) return;
    await Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 1300),
      backgroundColor: AppThemes().appColor.primary,
      margin: EdgeInsets.all(10.w),
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
    ).show(NavigatorKey.navigatorKey.currentContext!);
  }

  /// Get device id for device
  static Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return Future.value(iosDeviceInfo.identifierForVendor);
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return Future.value(androidDeviceInfo.id);
    } else {
      return '';
    }
  }

  /// Get device type based on platform
  static int getDeviceType() {
    if (kIsWeb) {
      return 0;
    } else if (Platform.isAndroid) {
      return 1;
    } else if (Platform.isIOS) {
      return 2;
    } else {
      return -1;
    }
  }

  /// Get device name based on platform
  static Future<String> getDeviceName() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return Future.value(iosDeviceInfo.utsname.machine);
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return Future.value(androidDeviceInfo.model);
    } else {
      return '';
    }
  }

  /// Get device timezone
  static String getDeviceTimeZone() {
    return DateTime.now().timeZoneName;
  }

  /// Close keyboard
  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<T?> showSmartModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = true,
    double scrollControlDisabledMaxHeightRatio = AppConst.defaultScrollControlDisabledMaxHeightRatio,
    bool useRootNavigator = true,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    AnimationStyle? sheetAnimationStyle,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      barrierLabel: barrierLabel,
      elevation: elevation,
      shape:
          shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(6.r), topRight: Radius.circular(6.r))),
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      sheetAnimationStyle: sheetAnimationStyle,
    );
  }

  /// Show common dialog box
  static void showDoubleActionDialog({
    String? title,
    String? content,
    String? cancelButtonText,
    String? okButtonText,
    VoidCallback? onOkPressed,
    VoidCallback? onCancelPressed,
  }) {
    showDialog(
      context: NavigatorKey.navigatorKey.currentContext!,
      builder: (context) {
        final style = AppTheme.of(context).showDoubleActionDialogStyle;
        return AlertDialog.adaptive(
          title: title != null ? SmartText(title, style: style.titleStyle) : null,
          content: content != null ? SmartText(content, style: style.contentStyle) : null,
          actions: [
            if (cancelButtonText != null)
              TextButton(
                style: const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {
                  Get.back();
                  if (onCancelPressed != null) {
                    onCancelPressed();
                  }
                },
                child: SmartText(cancelButtonText, style: style.okButtonStyle),
              ),
            if (okButtonText != null)
              TextButton(
                style: const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {
                  Get.back();
                  if (onOkPressed != null) {
                    onOkPressed();
                  }
                },
                child: SmartText(okButtonText, style: style.okButtonStyle),
              ),
          ],
          buttonPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          actionsPadding: EdgeInsets.only(bottom: 8.w, right: 16.w, left: 8.w, top: 0.w),
          contentPadding: EdgeInsets.only(bottom: 0.w, right: 20.w, left: 20.w, top: 16.w),
        );
      },
    );
  }

  /// Show popup dialog with title and message
  static void showPopupDialog(
    String title,
    String message, {
    bool isDismissible = false,
    String? textConfirm,
    Future<bool> Function()? onWillPop,
    VoidCallback? onConfirm,
    Color? confirmTextColor,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      barrierDismissible: isDismissible,
      textConfirm: textConfirm,
      onWillPop: onWillPop,
      onConfirm: onConfirm,
      confirmTextColor: confirmTextColor,
    );
  }

  static String convertTimestampTo12Hour(int timestamp) {
    if (timestamp == 0) {
      return "";
    }
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('h:mm a').format(dateTime);
  }

  static List<String> getProfileImageUrls() {
    List<String> urls = [
      "https://i.pravatar.cc/150?img=${Random().nextInt(70)}", // Random profile avatars
      "https://thispersondoesnotexist.com", // AI-generated human face
    ];

    return urls;
  }

  static String getRandomProfileImage() {
    List<String> urls = getProfileImageUrls();
    return urls[Random().nextInt(urls.length)];
  }

  static int getCurrentTimestamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static Future<bool> checkCameraStoragePermissions(BuildContext context, {required bool isCamera}) async {
    // Determine which permission to request based on isCamera flag
    List<Permission> permissionsToRequest = isCamera ? [Permission.camera] : [Permission.storage];

    // Request selected permission(s)
    Map<Permission, PermissionStatus> statuses = await permissionsToRequest.request();

    Permission requestedPermission = permissionsToRequest.first;
    PermissionStatus status = statuses[requestedPermission]!;

    // Scenario 1: Permission Granted
    if (status.isGranted) {
      return true;
    }
    // Scenario 2: Permission Denied (can request again)
    else if (status.isDenied) {
      showDoubleActionDialog(
        title: LocaleKeys.permissionsRequired.tr,
        content: LocaleKeys.permissionsRequiredDesc.tr.interpolate([isCamera ? LocaleKeys.camera.tr : LocaleKeys.storage.tr]),
        okButtonText: LocaleKeys.retry.tr,
        onOkPressed: () async {
          checkCameraStoragePermissions(context, isCamera: isCamera);
        },
      );
      return false;
    }
    // Scenario 3: Permission Permanently Denied
    else if (status.isPermanentlyDenied) {
      showDoubleActionDialog(
        title: LocaleKeys.permissionsRequired.tr,
        content: LocaleKeys.permissionsPermanentlyDenied.tr.interpolate([isCamera ? LocaleKeys.camera.tr : LocaleKeys.storage.tr]),
        okButtonText: LocaleKeys.openSettings.tr,
        onOkPressed: () async {
          openAppSettings();
        },
      );
      return false;
    }
    // Scenario 4: Permission Restricted (e.g., by system policies)
    else if (status.isRestricted) {
      showDoubleActionDialog(
        title: LocaleKeys.permissionsRequired.tr,
        content: LocaleKeys.permissionsPermanentlyDenied.tr.interpolate([isCamera ? LocaleKeys.camera.tr : LocaleKeys.storage.tr]),
        okButtonText: LocaleKeys.openSettings.tr,
        onOkPressed: () async {
          openAppSettings();
        },
      );
      return false;
    }

    return false; // Fallback case
  }

  static Color getContrastColor(Color color) {
    // Calculate luminance to determine brightness
    final double luminance = color.computeLuminance();

    // Return black for light colors, white for dark colors
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }
}
