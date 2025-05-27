import 'package:demo_app/data/model/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_cubit/setting_cubit.dart';
import '../bloc/home_cubit/setting_state.dart';
import '../data/model/product_card.dart';
import '../data/model/setting_model.dart';
import '../utils/HexColor.dart';
import '../widgets/home_widgets/categoryItem_widget.dart';
import '../widgets/home_widgets/filter_widget.dart';
import '../widgets/home_widgets/product_card_widget.dart';
import '../widgets/home_widgets/promotional_banner_widget.dart';
import '../widgets/home_widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> favoriteStatus = [];
  int favoriteCount = 0;
  List<CategoryItem> items = [
    CategoryItem(
      title: 'Fashion',
      iconUrl: 'assets/images/New Project (18).png',
    ),
    CategoryItem(
      title: 'Video Resume',
      iconUrl: 'assets/images/New Project (19).png',
    ),
    CategoryItem(
      title: 'Groceries',
      iconUrl: 'assets/images/New Project (20).png',
    ),
    CategoryItem(
      title: 'Yoga',
      iconUrl: 'assets/images/New Project (21).png',
    ),
    CategoryItem(
      title: 'Home Repair',
      iconUrl: 'assets/images/New Project (22).png',
    ),
    CategoryItem(
      title: 'Medical',
      iconUrl: 'assets/images/New Project (23).png',
    ),
    CategoryItem(
      title: 'Transport',
      iconUrl: 'assets/images/New Project (24).png',
    ),
    CategoryItem(
      title: 'Shop',
      iconUrl: 'assets/images/New Project (25).png',
    ),
  ];
  List<ProductCard> productItem = [
    ProductCard(
        title: 'Get flat 50% off on any shirts',
        imageUrl: "assets/images/profile.jpg",
        brand: 'Anu Attires',
        rating: "4.3",
        review: '(14)',
        trending: true),
    ProductCard(
        title: 'Get flat 80% off on any jeans',
        imageUrl: "assets/images/profile.jpg",
        brand: 'Levis',
        rating: "4.9",
        review: '(6)',
        trending: false),
    ProductCard(
        title: 'Get flat 50% off on any shirts',
        imageUrl: "assets/images/profile.jpg",
        brand: 'Anu Attires',
        rating: "2.3",
        review: '(12)',
        trending: true),
    ProductCard(
        title: 'Get flat 50% off on any shirts',
        imageUrl: "assets/images/profile.jpg",
        brand: 'Anu Attires',
        rating: "4.3",
        review: '(20)',
        trending: false),
    ProductCard(
        title: 'Get flat 50% off on any shirts',
        imageUrl: "assets/images/profile.jpg",
        brand: 'Anu Attires',
        rating: "5.3",
        review: '(14)',
        trending: true)
  ];
  SettingsModel? settings;
  @override
  void initState() {
    super.initState();
    favoriteStatus = List<bool>.filled(productItem.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
      if (state is SettingsError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    }, builder: (context, state) {
      if (state is SettingsLoaded) {
        final header = state.settings.header;
        final category = state.settings.category;
        final DealCard = state.settings.dealCard;
        return CustomScrollView(
          slivers: [
            // AppBar
            SliverAppBar(
              toolbarHeight: header.height ?? 60,
              titleSpacing: header.padding ?? 16,
              backgroundColor: header.background != null
                  ? hexToColor(header.background!)
                  : Colors.white,
              pinned: true,
              floating: true,
              elevation: 1,
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
              ),
              title: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 40,
                ),
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_none,
                          color: Colors.black),
                      onPressed: () {},
                    ),
                    if (favoriteCount > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Text(
                            '$favoriteCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
            // Body content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    // Search Bar
                    TextWidget(context),
                    const SizedBox(height: 20),
                    // Categories
                    CategoryItemWidget(
                        category.grid, category.padding, context, items),
                    const SizedBox(height: 20),
                    // Promotion Banner
                    Center(
                      child: PromotionWidget(
                          DealCard.padding,
                          DealCard.width,
                          DealCard.borderRadius,
                          DealCard.margin,
                          DealCard.background,
                          DealCard.textImagePosition,
                          context),
                    ),
                    const SizedBox(height: 20),
                    // Product section title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Frisco",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        filterIconWithDropdown(),
                        // SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Product Grid
                    Container(
                      height: 300,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: productItem.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: productCard(
                              imageUrl: productItem[index].imageUrl,
                              title: productItem[index].title,
                              brand: productItem[index].brand,
                              rating: productItem[index].rating,
                              reviews: productItem[index].review,
                              trending: productItem[index].trending,
                              context: context,
                              isFavoriteInitial: favoriteStatus[index],
                              onFavoriteChanged: (isFav) {
                                setState(() {
                                  favoriteStatus[index] = isFav;
                                  favoriteCount =
                                      favoriteStatus.where((fav) => fav).length;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }
      return const SizedBox.shrink();
    });
  }
}
