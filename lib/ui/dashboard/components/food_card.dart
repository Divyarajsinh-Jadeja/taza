import 'package:taza/taza.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).foodCardStyle;
    return Container(
      height: 96.h,
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: colors(context).colorD2D2D7),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: SmartRow(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmartImage(
              width: 90.w,
              height: 96.h,
              path:
                  "https://s3-alpha-sig.figma.com/img/fa98/63bf/8cb3f4e04b7c05896d3b1ea7e3e10881?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fPQAZQbWzYWn6OxATAu7DaYryQ0-ovyG4r7hVrYKTyh7Yz4ecRYxMZ2Gg4iRAt1xld2nkNsQOvN744cTfombX~mYbxFzUjtOKfriGjzPkaBn30~-WI875GGurU4Q22nCauv4tfQqAoH7OcmJlli9RZB1BuEjuO9AoxEjasgLrqWzo8VUp~Gc7B7RA2DwWgEsrOj-lz1~oo4NRA8ZSo62uJfvm84nmHr~DBSW81kujIZ9m8Jhphc9bL6UizsLSPMnHML39uSWniuwXBaMATveNebOSBtMkvrIN2IA1EXWv3ga2UTvIpTecdRHq2gtnb7gW2mPNB4nl00MD759gZ0Reg__",
            ).animate(delay: 400.ms)
                .shimmer(duration: 400.ms)
                .flip(),
            8.horizontalSpace,
            Expanded(
              child: SmartColumn(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmartRow(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SmartText(
                          "Family Bucket",
                          style: style.titleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ).animate()
                          .fadeIn(
                          duration: 300.ms, delay: 600.ms, curve: Curves.decelerate)
                          .slideX(begin: 0.2, end: 0),
                      SmartImage(
                        path: AppImages.icNonVeg,
                        height: 16.h,
                        width: 16.w,
                      ).animate(delay: 400.ms)
                          .shimmer(duration: 400.ms)
                          .flip(),
                    ],
                  ),
                  4.height,
                  SmartRow(
                    spacing: 4,
                    children: [
                      SmartImage(path: AppImages.icStar, height: 14),
                      SmartText(
                        "4.2 (1.2k) • 30-35 min",
                        style: style.subTitleStyle,
                      ),
                    ],
                  ).animate()
                      .scaleXY(
                      begin: 0,
                      end: 1,
                      delay: 300.ms,
                      duration:  500.ms,
                      curve: Curves.decelerate),
                  Spacer(),
                  SmartRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmartText("89 SAR", style: style.amountStyle).animate()
                          .scaleXY(
                          begin: 0,
                          end: 1,
                          delay: 300.ms,
                          duration:  500.ms,
                          curve: Curves.decelerate),
                      Container(
                        height: 32.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: SmartRow(
                          spacing: 0,
                          children: [
                            IconButton(
                              iconSize: 16.r,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.teal,
                              ),
                            ),
                            Text(
                              "1",
                              style: style.titleStyle.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                            IconButton(
                              iconSize: 16.r,
                              onPressed: () {},
                              icon: const Icon(Icons.add, color: Colors.teal),
                            ),
                          ],
                        ),
                      ).animate()
                          .fadeIn(
                          duration: 300.ms, delay: 600.ms, curve: Curves.decelerate)
                          .slideX(begin: 0.2, end: 0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



