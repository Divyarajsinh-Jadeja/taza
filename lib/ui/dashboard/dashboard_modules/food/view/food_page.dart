import 'package:taza/taza.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            toolbarHeight: 80.h,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: SmartTextField(
              controller: controller.searchController,
              hintText: LocaleKeys.search.tr,
              onTapOutside: (value) => FocusScope.of(context).unfocus(),
              onValueChanges: (value) {},
              onFieldSubmitted: (value) {},
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: DynamicSliverHeaderDelegate(
              minHeight: 50,
              maxHeight: 300,
              builder: (shrinkOffset, overlapsContent) {
                return FoodScreenTabsView();
              },
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(childCount: 20, (context, index) => ListTile(title: Text('Food Item $index')))),
        ],
      ),
    );
  }
}
