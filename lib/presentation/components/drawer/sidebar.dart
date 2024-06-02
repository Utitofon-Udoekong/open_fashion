import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/presentation/components/socials.dart';
import 'package:open_fashion/presentation/components/tiles/icon_tiles.dart';
import 'package:open_fashion/constants/style_guides.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: IntrinsicHeight(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(Icons.close),
                  ),
                  TabBar(
                    tabs: const [
                      Tab(
                        text: 'WOMEN',
                      ),
                      Tab(
                        text: 'MEN',
                      ),
                    ],
                    labelStyle: AppTextStyle.bodyM(color: AppColors.body),
                    unselectedLabelColor: AppColors.body.withOpacity(0.5),
                    indicator: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.divider),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  TabBarView(
                    children: [
                      _buildPanel(),
                      _buildPanel(),
                    ],
                  ),
                  const IconTile(
                      image: AppImages.call, title: '(786) 713-8616'),
                  const Gap(20),
                  const IconTile(
                      image: AppImages.location, title: 'Store locator'),
                  Column(
                    children: [
                      Gap(20),
                      Image.asset(AppImages.dividerPlain),
                      Gap(20),
                      Socials(),
                      Gap(20),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListView.builder(
            itemCount: item.body.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(item.body[index]),
                // trailing: const Icon(Icons.delete),
                onTap: () {
                  // setState(() {
                  //   _data.removeWhere(
                  //       (Item currentItem) => item == currentItem);
                  // });
                },
              );
            },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.body,
    required this.headerValue,
    this.isExpanded = false,
    this.hasChild = false,
  });

  List<String> body;
  String headerValue;
  bool isExpanded;
  bool hasChild;
}

const titles = ['New', 'Apparel', 'Bag', 'Shoes', 'Beauty', 'Accessories'];
List<Item> generateItems() {
  return List<Item>.generate(6, (int index) {
    return Item(
        headerValue: titles[index],
        body: [
          'outer'
              'dress'
              'blouse/shirt'
              't-shirt'
              'knitwear'
              'skirt'
              'pants'
              'denim'
              'kids'
        ],
        hasChild: true);
  });
}
