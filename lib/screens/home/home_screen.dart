import 'package:provider/provider.dart';
import 'package:alisons_machine_test/providers/home_provider.dart';
import 'package:alisons_machine_test/models/home_response.dart';
import 'package:alisons_machine_test/services/home_service.dart';
import 'package:alisons_machine_test/utils/app_colors.dart';
import 'package:alisons_machine_test/utils/app_text_styles.dart';
import 'package:alisons_machine_test/widgets/category_item.dart';
import 'package:alisons_machine_test/widgets/product_card.dart';
import 'package:alisons_machine_test/widgets/promo_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).fetchHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final isLoading = homeProvider.isLoading;
    final homeData = homeProvider.homeData;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/images/kart_icon.png",
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search, color: AppColors.white),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.favorite_border, color: AppColors.white),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 16.0),
            child: Icon(Icons.notifications_outlined, color: AppColors.white),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
          : homeData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load data'),
                  TextButton(
                    onPressed: homeProvider.fetchHomeData,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Banner using local asset
                    const PromoBanner(
                      imagePath: 'assets/images/top_banner.png',
                    ),
                    const SizedBox(height: 10),

                    // Categories
                    if (homeData.categories.isNotEmpty) ...[
                      _buildSectionHeader('Categories'),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeData.categories.length,
                          itemBuilder: (context, index) {
                            final cat = homeData.categories[index];
                            return CategoryItem(
                              title: cat.name,
                              imageUrl: HomeService.getImageUrl(cat.image),
                            );
                          },
                        ),
                      ),
                    ],

                    // Featured Products
                    if (homeData.ourProducts.isNotEmpty) ...[
                      _buildSectionHeader('Featured Products'),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeData.ourProducts.length,
                          itemBuilder: (context, index) {
                            final prod = homeData.ourProducts[index];
                            return _buildProductCard(prod);
                          },
                        ),
                      ),
                    ],

                    // Daily Best Selling
                    if (homeData.bestSeller.isNotEmpty) ...[
                      _buildSectionHeader('Daily Best Selling'),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeData.bestSeller.length,
                          itemBuilder: (context, index) {
                            final prod = homeData.bestSeller[index];
                            return _buildProductCard(prod);
                          },
                        ),
                      ),
                    ],

                    const SizedBox(height: 16),

                    // Middle Banner using local asset
                    const PromoBanner(
                      imagePath: 'assets/images/second_banner.png',
                    ),
                    const SizedBox(height: 10),

                    // Recently Added
                    if (homeData.newArrivals.isNotEmpty) ...[
                      _buildSectionHeader('Recently Added'),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeData.newArrivals.length,
                          itemBuilder: (context, index) {
                            final prod = homeData.newArrivals[index];
                            return _buildProductCard(prod);
                          },
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildProductCard(ProductModel prod) {
    String discount = '';
    if (prod.oldPrice.isNotEmpty && prod.price.isNotEmpty) {
      final oldPrice = double.tryParse(prod.oldPrice) ?? 0;
      final currentPrice = double.tryParse(prod.price) ?? 0;
      if (oldPrice > currentPrice && currentPrice > 0) {
        final pct = ((oldPrice - currentPrice) / oldPrice) * 100;
        discount = '${pct.round()}%';
      }
    }

    return ProductCard(
      discount: discount,
      imageUrl: HomeService.getImageUrl(prod.image),
      category: prod.category,
      title: prod.name,
      price: prod.price,
      strikePrice: prod.oldPrice,
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.sectionTitle),
          Row(
            children: const [
              Icon(Icons.chevron_left, size: 20, color: AppColors.textPrimary),
              Icon(Icons.chevron_right, size: 20, color: AppColors.textPrimary),
            ],
          ),
        ],
      ),
    );
  }
}
