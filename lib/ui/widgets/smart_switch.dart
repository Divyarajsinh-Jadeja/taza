import 'package:taza/taza.dart';

class SmartSwitch extends StatefulWidget {
  const SmartSwitch({
    super.key,
    required this.value,
    required this.onToggle,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70,
    this.toggleColor = Colors.white,
    this.activeToggleColor,
    this.inactiveToggleColor,
    this.width = 70.0,
    this.height = 35.0,
    this.toggleSize = 20.0,
    this.valueFontSize = 16.0,
    this.borderRadius = 20.0,
    this.padding = 4.0,
    this.showOnOff = false,
    this.activeText,
    this.inactiveText,
    this.activeTextFontWeight,
    this.inactiveTextFontWeight,
    this.switchBorder,
    this.activeSwitchBorder,
    this.inactiveSwitchBorder,
    this.toggleBorder,
    this.activeToggleBorder,
    this.inactiveToggleBorder,
    this.activeIcon,
    this.inactiveIcon,
    this.duration = const Duration(milliseconds: 200),
    this.disabled = false,
  });

  final bool value;
  final ValueChanged<bool> onToggle;

  final bool showOnOff;
  final String? activeText;
  final String? inactiveText;

  final Color activeColor;
  final Color inactiveColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final FontWeight? activeTextFontWeight;
  final FontWeight? inactiveTextFontWeight;

  final Color toggleColor;
  final Color? activeToggleColor;
  final Color? inactiveToggleColor;

  final double width;
  final double height;
  final double toggleSize;
  final double valueFontSize;
  final double borderRadius;
  final double padding;

  final BoxBorder? switchBorder;
  final BoxBorder? activeSwitchBorder;
  final BoxBorder? inactiveSwitchBorder;
  final BoxBorder? toggleBorder;
  final BoxBorder? activeToggleBorder;
  final BoxBorder? inactiveToggleBorder;

  final Widget? activeIcon;
  final Widget? inactiveIcon;

  final Duration duration;
  final bool disabled;

  @override
  State<SmartSwitch> createState() => _SmartSwitchState();
}

class _SmartSwitchState extends State<SmartSwitch> with SingleTickerProviderStateMixin {
  late final Animation _toggleAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, value: widget.value ? 1.0 : 0.0, duration: widget.duration);
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SmartSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      widget.value ? _animationController.forward() : _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color toggleColor =
        widget.value ? (widget.activeToggleColor ?? widget.toggleColor) : (widget.inactiveToggleColor ?? widget.toggleColor);

    Color switchColor = widget.value ? widget.activeColor : widget.inactiveColor;

    Border? switchBorder =
        widget.value
            ? (widget.activeSwitchBorder as Border?) ?? widget.switchBorder as Border?
            : (widget.inactiveSwitchBorder as Border?) ?? widget.switchBorder as Border?;

    Border? toggleBorder =
        widget.value
            ? (widget.activeToggleBorder as Border?) ?? widget.toggleBorder as Border?
            : (widget.inactiveToggleBorder as Border?) ?? widget.toggleBorder as Border?;

    double textSpace = widget.width.w - widget.toggleSize.w;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Align(
          child: GestureDetector(
            onTap: () {
              if (!widget.disabled) {
                widget.value ? _animationController.forward() : _animationController.reverse();
                widget.onToggle(!widget.value);
              }
            },
            child: Opacity(
              opacity: widget.disabled ? 0.6 : 1,
              child: Container(
                width: widget.width.w,
                height: widget.height.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius.r),
                  border: switchBorder ?? Border.all(color: Colors.grey),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 10.h,
                      width: 40.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(widget.borderRadius.r), color: switchColor),
                    ),
                    AnimatedOpacity(
                      opacity: widget.value ? 1.0 : 0.0,
                      duration: widget.duration,
                      child: Container(
                        width: textSpace,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        alignment: Alignment.centerLeft,
                        child: _activeText,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedOpacity(
                        opacity: !widget.value ? 1.0 : 0.0,
                        duration: widget.duration,
                        child: Container(
                          width: textSpace,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          alignment: Alignment.centerRight,
                          child: _inactiveText,
                        ),
                      ),
                    ),
                    Align(
                      alignment: _toggleAnimation.value,
                      child: Container(
                        width: widget.toggleSize.w,
                        height: widget.toggleSize.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: toggleColor, border: toggleBorder),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Stack(
                            children: [
                              Center(
                                child: AnimatedOpacity(
                                  opacity: widget.value ? 1.0 : 0.0,
                                  duration: widget.duration,
                                  child: widget.activeIcon,
                                ),
                              ),
                              Center(
                                child: AnimatedOpacity(
                                  opacity: !widget.value ? 1.0 : 0.0,
                                  duration: widget.duration,
                                  child: widget.inactiveIcon,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  FontWeight get _activeTextFontWeight => widget.activeTextFontWeight ?? FontWeight.w900;

  FontWeight get _inactiveTextFontWeight => widget.inactiveTextFontWeight ?? FontWeight.w900;

  Widget get _activeText {
    if (widget.showOnOff) {
      return Text(
        widget.activeText ?? "On",
        style: TextStyle(color: widget.activeTextColor, fontWeight: _activeTextFontWeight, fontSize: widget.valueFontSize.sp),
      );
    }
    return const SizedBox.shrink();
  }

  Widget get _inactiveText {
    if (widget.showOnOff) {
      return Text(
        widget.inactiveText ?? "Off",
        style: TextStyle(color: widget.inactiveTextColor, fontWeight: _inactiveTextFontWeight, fontSize: widget.valueFontSize.sp),
        textAlign: TextAlign.right,
      );
    }
    return const SizedBox.shrink();
  }
}
