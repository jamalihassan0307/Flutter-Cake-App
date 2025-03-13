import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sweet_delights/core/color.dart';
import 'package:sweet_delights/core/text_style.dart';
import 'package:sweet_delights/data/items.dart';
import 'package:sweet_delights/widget/custom_app_bar.dart';
import 'package:sweet_delights/widget/rating_bar.dart';

class DetailPage extends StatefulWidget {
  final Cakes cake;
  const DetailPage({Key? key, required this.cake}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  int qty = 1;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Container with Gradient
            Positioned(
              right: 0,
              child: Hero(
                tag: 'background_${widget.cake.name}',
                child: Container(
                  height: height / 2,
                  width: 360.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [pink02, accent2],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
            // Cake Image
            Positioned(
              top: 60,
              right: 20,
              child: Hero(
                tag: 'cake_${widget.cake.name}',
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    height: height / 3,
                    width: 320.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.cake.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Content
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: height * 0.5,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cake.name,
                        style: txtHeading.copyWith(
                          color: mainColor,
                          fontSize: 28.0,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              StarRating(rating: widget.cake.rating),
                              SizedBox(width: 10),
                              Text(
                                '${widget.cake.rating}',
                                style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              color: pink01,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                _buildQuantityButton(
                                  icon: Icons.remove,
                                  onTap: () {
                                    if (qty > 1) setState(() => qty--);
                                  },
                                ),
                                SizedBox(width: 10),
                                Text(
                                  qty.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: mainColor,
                                  ),
                                ),
                                SizedBox(width: 10),
                                _buildQuantityButton(
                                  icon: Icons.add,
                                  onTap: () => setState(() => qty++),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: ReadMoreText(
                            widget.cake.description,
                            trimLines: 4,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            style: TextStyle(
                              color: black.withOpacity(0.7),
                              height: 1.5,
                              fontSize: 16,
                            ),
                            moreStyle: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                            lessStyle: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: gray02,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: TextStyle(
                                    color: grayColor,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '\$${(double.parse(widget.cake.price) * qty).toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // App Bar
            CustomAppBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: mainColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
