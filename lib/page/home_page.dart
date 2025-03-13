import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:animations/animations.dart';
import 'package:sweet_delights/core/color.dart';
// import 'package:sweet_delights/core/text_style.dart';
import 'package:sweet_delights/data/category.dart';
import 'package:sweet_delights/data/items.dart';
import 'package:sweet_delights/page/details_page.dart';
import 'package:sweet_delights/widget/Category_btn.dart';
// import 'package:sweet_delights/widget/circurl_btn.dart';
import 'package:sweet_delights/widget/item_card.dart';
// import 'package:sweet_delights/widget/item_card_02.dart';
import 'package:sweet_delights/widget/item_list_card.dart';
import 'package:sweet_delights/page/favorites_page.dart';
import 'package:sweet_delights/page/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:sweet_delights/providers/favorites_provider.dart';
import 'package:sweet_delights/providers/cart_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _advancedDrawerController = AdvancedDrawerController();
  int selectIndex = 0;
  late AnimationController _animationController;
  late TabController _tabController;
  List<Cakes> filteredCakes = [];
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCakes = cakes;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..forward();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
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
      drawer: _buildDrawer(),
      child: Scaffold(
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!isSearching) ...[
                              Text(
                                'Find your',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                'Sweet Delights',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                            ],
                            SizedBox(height: 20),
                            _buildSearchBar(),
                            SizedBox(height: 20),
                            _buildCategories(),
                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildGridView(),
                          _buildListView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_tabController.index == 0 ? 1 : 0);
          },
          backgroundColor: mainColor,
          child: AnimatedIcon(
            color: Colors.white,
            icon: AnimatedIcons.view_list,
            progress: _tabController.animation!,
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
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
          CircleAvatar(
            radius: 20,
            backgroundColor: accent2,
            child: Icon(Icons.person_outline, color: mainColor),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            isSearching = value.isNotEmpty;
            filteredCakes = cakes.where((cake) {
              return cake.name.toLowerCase().contains(value.toLowerCase()) ||
                  cake.flavour.toLowerCase().contains(value.toLowerCase());
            }).toList();
          });
        },
        decoration: InputDecoration(
          hintText: 'Search cakes...',
          prefixIcon: Icon(Icons.search, color: mainColor),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: CategoryButton(
              category: categories[index],
              selectedIndex: selectIndex,
              index: index,
              onTap: () {
                setState(() {
                  selectIndex = index;
                  filteredCakes = getFilteredCakes(categories[index].tag, cakes);
                  _animationController.reset();
                  _animationController.forward();
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: filteredCakes.length,
      itemBuilder: (context, index) {
        return OpenContainer(
          // openColor: Colors.transparent,
          closedColor: pink02,
          // middleColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 500),
          openBuilder: (context, _) => DetailPage(cake: filteredCakes[index]),
          closedBuilder: (context, openContainer) => Hero(
            tag: 'cake_${filteredCakes[index].name}',
            child: ItemCard(
              cake: filteredCakes[index],
              onTap: openContainer,
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredCakes.length,
      itemBuilder: (context, index) {
        return OpenContainer(
          openColor: Colors.transparent,
          closedColor: Colors.transparent,
          middleColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 500),
          openBuilder: (context, _) => DetailPage(cake: filteredCakes[index]),
          closedBuilder: (context, openContainer) => Hero(
            tag: 'cake_list_${filteredCakes[index].name}',
            child: ItemListCard(
              cake: filteredCakes[index],
              onTap: openContainer,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawer() {
    return SafeArea(
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
                fit: BoxFit.cover,
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoritesPage()),
              ),
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              trailing: Consumer<FavoritesProvider>(
                builder: (context, provider, child) {
                  return provider.favorites.isEmpty
                      ? null
                      : CircleAvatar(
                          radius: 12,
                          backgroundColor: mainColor,
                          child: Text(
                            provider.favorites.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        );
                },
              ),
            ),
            ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              ),
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              trailing: Consumer<CartProvider>(
                builder: (context, provider, child) {
                  return provider.items.isEmpty
                      ? null
                      : CircleAvatar(
                          radius: 12,
                          backgroundColor: mainColor,
                          child: Text(
                            provider.itemCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        );
                },
              ),
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
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
