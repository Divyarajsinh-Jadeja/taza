// Dart core & system libraries
export 'dart:async';
export 'dart:convert';
export 'dart:core' hide Record;
export 'dart:io' hide HeaderValue, Link;
export 'dart:isolate';
export 'dart:math';

// Flutter SDK packages
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/gestures.dart';

// Third-party packages
export 'package:get/get.dart' hide IterableExtensions;
export 'package:get_storage/get_storage.dart';
export 'package:dartz/dartz.dart' hide State;
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:get/get_connect/connect.dart';
export 'package:get/get_connect/http/src/http.dart';
export 'package:device_info_plus/device_info_plus.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:flutter_svg/flutter_svg.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:flutter_bounceable/flutter_bounceable.dart';
export 'package:another_flushbar/flushbar.dart' hide OnTap;
export 'package:permission_handler/permission_handler.dart';
export 'package:pin_code_fields/pin_code_fields.dart';
export 'package:image_picker/image_picker.dart';
export 'package:flutter_animate/flutter_animate.dart';


// Project core
export 'package:taza/app/app_class.dart';
export 'package:taza/app/app_const.dart';
export 'package:taza/app/app_fonts.dart';
export 'package:taza/app/app_images.dart';
export 'package:taza/app/app_routes.dart';
export 'package:taza/app/theme/app_colors.dart';
export 'package:taza/app/theme/app_style_data.dart';
export 'package:taza/app/theme/app_theme.dart';
export 'package:taza/app/date_formatter.dart';
export 'package:taza/generated/locales.g.dart';

// Utilities
export 'package:taza/utils/utils.dart';
export 'package:taza/utils/navigator_key.dart';
export 'package:taza/utils/exception_file.dart';

// Extensions
export 'package:taza/extension_methods/string.dart';
export 'package:taza/extension_methods/date_time.dart';
export 'package:taza/extension_methods/duration.dart';
export 'package:taza/extension_methods/widgets_extensions.dart';

// Enums
export 'package:taza/enums/enums.dart';

// Data layer
export 'package:taza/data/local/session_manager.dart';
export 'package:taza/data/network/client/api_client.dart';
export 'package:taza/data/network/client/api_provider.dart';
export 'package:taza/data/network/client/api_service.dart';
export 'package:taza/data/network/client/connectivity_manager.dart';
export 'package:taza/data/network/models/common_response.dart';
export 'package:taza/data/network/models/error_model.dart';
export 'package:taza/data/network/models/user_response.dart';
export 'package:taza/data/network/repository/app_repository.dart';
export 'package:taza/data/network/repository/user_repository.dart';
export 'package:taza/data/network/api_const/api_keys.dart';
export 'package:taza/data/network/models/food_model.dart';

// Services
export 'package:taza/common/common_service.dart';
export 'package:taza/common/media_capture_service.dart';

// UI Widgets
export 'package:taza/ui/widgets/auto_size_text.dart';
export 'package:taza/ui/widgets/button.dart';
export 'package:taza/ui/widgets/no_data_found_widget.dart';
export 'package:taza/ui/widgets/smart_appbar.dart';
export 'package:taza/ui/widgets/smart_circular_progress_indicator.dart';
export 'package:taza/ui/widgets/smart_column.dart';
export 'package:taza/ui/widgets/smart_dropdown.dart';
export 'package:taza/ui/widgets/smart_gradient_container.dart';
export 'package:taza/ui/widgets/smart_image_viewer.dart';
export 'package:taza/ui/widgets/smart_rich_text.dart';
export 'package:taza/ui/widgets/smart_row.dart';
export 'package:taza/ui/widgets/smart_single_child_scroll_view.dart';
export 'package:taza/ui/widgets/smart_stepper.dart';
export 'package:taza/ui/widgets/smart_text.dart';
export 'package:taza/ui/widgets/text_field.dart';
export 'package:taza/ui/widgets/smart_switch.dart';
export 'package:taza/ui/widgets/smart_animator.dart';
export 'package:taza/ui/widgets/smart_tab_bar.dart';

// UI Pages & Controllers
export 'package:taza/ui/splash/binding/splash_binding.dart';
export 'package:taza/ui/splash/view/splash_controller.dart';
export 'package:taza/ui/splash/view/splash_screen.dart';

export 'package:taza/ui/dashboard/binding/dashboard_binding.dart';
export 'package:taza/ui/dashboard/view/dashboard_controller.dart';
export 'package:taza/ui/dashboard/view/dashboard_page.dart';
export 'package:taza/ui/dashboard/components/bottom_navigation_bar_data_model.dart';
export 'package:taza/ui/dashboard/components/custom_bottom_bar.dart';
export 'package:taza/ui/dashboard/components/tabdata.dart';
export 'package:taza/ui/dashboard/components/food_card.dart';
export 'package:taza/ui/dashboard/components/offer_popup.dart';

export 'package:taza/ui/smart_quantity/view/smart_quantity.dart';
export 'package:taza/ui/smart_quantity/view/smart_quantity_controller.dart';

export 'package:taza/ui/smart_tab_bar/view/smart_delivery_tab_bar.dart';
export 'package:taza/ui/smart_tab_bar/view/smart_delivery_tab_bar_controller.dart';


export 'package:taza/ui/dashboard/dashboard_modules/home/view/home_controller.dart';
export 'package:taza/ui/dashboard/dashboard_modules/home/view/home_page.dart';

export 'package:taza/ui/dashboard/dashboard_modules/cart/view/cart_controller.dart';
export 'package:taza/ui/dashboard/dashboard_modules/cart/view/cart_page.dart';

export 'package:taza/ui/dashboard/dashboard_modules/food/view/food_controller.dart';
export 'package:taza/ui/dashboard/dashboard_modules/food/view/food_page.dart';

export 'package:taza/ui/dashboard/dashboard_modules/reorder/view/reorder_controller.dart';
export 'package:taza/ui/dashboard/dashboard_modules/reorder/view/reorder_page.dart';

export 'package:taza/ui/dashboard/dashboard_modules/rewards/view/rewards_controller.dart';
export 'package:taza/ui/dashboard/dashboard_modules/rewards/view/rewards_page.dart';

export 'package:taza/ui/widgets/smart_category_card.dart';
export 'package:taza/ui/widgets/smart_category_row.dart';

export 'package:taza/ui/checkout/view/checkout_controller.dart';
export 'package:taza/ui/checkout/binding/checkout_binding.dart';
export 'package:taza/ui/checkout/view/checkout_screen.dart';

/// Model Classes
export 'package:taza/models/food_category.dart';
export 'package:taza/ui/dashboard/dashboard_modules/home/view/widgets/address_bottom_sheet_widget.dart';

export 'package:taza/ui/dashboard/dashboard_modules/home/components/smart_search_bar.dart';
export 'package:taza/ui/dashboard/dashboard_modules/home/components/food_option_card.dart';
export 'package:taza/ui/dashboard/dashboard_modules/home/components/home_address_header.dart';


export 'package:taza/ui/dashboard/dashboard_modules/food/components/food_screen_tabs_view.dart';
export 'package:taza/ui/dashboard/dashboard_modules/food/components/foodscreen_tab_header_delegate.dart';
export 'package:taza/ui/dashboard/dashboard_modules/food/components/food_tab_children.dart';
export 'package:taza/ui/dashboard/dashboard_modules/food/components/grocery_tab_children.dart';

export 'package:taza/ui/dashboard/dashboard_modules/food/components/food_item_card.dart';
export 'package:carousel_slider/carousel_controller.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
export 'package:taza/ui/dashboard/dashboard_modules/food/components/filter_category_bar.dart';
