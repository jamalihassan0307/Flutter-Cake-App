import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:animations/animations.dart';
import 'package:uidesign06/core/color.dart';
import 'package:uidesign06/core/text_style.dart';
import 'package:uidesign06/data/category.dart';
import 'package:uidesign06/data/items.dart';
import 'package:uidesign06/page/details_page.dart';
import 'package:uidesign06/widget/Category_btn.dart';
import 'package:uidesign06/widget/circurl_btn.dart';
import 'package:uidesign06/widget/item_card.dart';
import 'package:uidesign06/widget/item_card_02.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _advancedDrawerController = AdvancedDrawerController();
  int selectIndex = 0;
  late AnimationController _animationController;
  late AnimationController _menuAnimationController;
  List<Cakes> filteredCakes = [];

  @override
  void initState() {
    super.initState();
    filteredCakes = cakes; // Initially show all cakes
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..forward();

    _menuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _menuAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [mainColor, accent1],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/cap_cake.png',
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.cake),
                title: Text('Cakes'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.favorite),
                title: Text('Favourites'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(),
                SizedBox(height: 20),
                FadeTransition(
                  opacity: _animationController,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 0.2),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeOut,
                    )),
                    child: Text(
                      'Delicious Cakes',
                      style: txtHeading.copyWith(
                        color: mainColor,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                categoryMenu(),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 30.0),
                    itemCount: filteredCakes.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return OpenContainer(
                        transitionDuration: Duration(milliseconds: 500),
                        openBuilder: (context, _) => DetailPage(cake: filteredCakes[index]),
                        closedBuilder: (context, openContainer) => GestureDetector(
                          onTap: openContainer,
                          child: Hero(
                            tag: 'cake_${filteredCakes[index].name}',
                            child: ItemCard(cake: filteredCakes[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 21.0,
                      color: mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: filteredCakes.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(bottom: 20.0),
                    itemBuilder: (context, index) {
                      return FadeTransition(
                        opacity: _animationController,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0.2, 0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(
                              0.4 + (index * 0.1),
                              1.0,
                              curve: Curves.easeOut,
                            ),
                          )),
                          child: ItemCard02(cake: filteredCakes[index]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: _handleMenuButtonPressed,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: AlwaysStoppedAnimation(value.visible ? 1.0 : 0.0),
                color: mainColor,
              );
            },
          ),
        ),
        CircleButton(
          onTap: () {},
          image: 'search.svg',
        ),
      ],
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  categoryMenu() {
    return Container(
      height: 80.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectIndex = index;
                filteredCakes = getFilteredCakes(category.tag, cakes);
                _animationController.reset();
                _animationController.forward();
              });
            },
            child: CategoryButton(
              category: category,
              index: selectIndex,
            ),
          );
        },
      ),
    );
  }
}
