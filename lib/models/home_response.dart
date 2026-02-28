class HomeResponse {
  final int success;
  final String message;
  final List<BannerModel> banner1;
  final List<BannerModel> banner2;
  final List<BannerModel> banner3;
  final List<ProductModel> recentViews;
  final List<ProductModel> ourProducts;
  final List<ProductModel> suggestedProducts;
  final List<ProductModel> bestSeller;
  final List<ProductModel> flashSail;
  final List<ProductModel> newArrivals;
  final List<CategoryModel> categories;
  final int cartCount;

  HomeResponse({
    required this.success,
    required this.message,
    required this.banner1,
    required this.banner2,
    required this.banner3,
    required this.recentViews,
    required this.ourProducts,
    required this.suggestedProducts,
    required this.bestSeller,
    required this.flashSail,
    required this.newArrivals,
    required this.categories,
    required this.cartCount,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      success: json['success'] ?? 0,
      message: json['message'] ?? '',
      banner1:
          (json['banner1'] as List?)
              ?.map((e) => BannerModel.fromJson(e))
              .toList() ??
          [],
      banner2:
          (json['banner2'] as List?)
              ?.map((e) => BannerModel.fromJson(e))
              .toList() ??
          [],
      banner3:
          (json['banner3'] as List?)
              ?.map((e) => BannerModel.fromJson(e))
              .toList() ??
          [],
      recentViews:
          (json['recentviews'] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
          [],
      ourProducts:
          (json['our_products'] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
          [],
      suggestedProducts:
          (json['suggested_products'] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
          [],
      bestSeller:
          (json['best_seller'] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
          [],
      flashSail:
          (json['flash_sail'] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
          [],
      newArrivals:
          (json['newarrivals'] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
          [],
      categories:
          (json['categories'] as List?)
              ?.map((e) => CategoryModel.fromJson(e))
              .toList() ??
          [],
      cartCount: json['cartcount'] ?? 0,
    );
  }
}

class BannerModel {
  final int id;
  final String image;
  final String title;
  final String subTitle;

  BannerModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      subTitle: json['sub_title'] ?? '',
    );
  }
}

class ProductModel {
  final int productId;
  final String name;
  final String image;
  final String price;
  final String oldPrice;
  final String category;
  final String stock;

  ProductModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.category,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? '',
      oldPrice: json['oldprice'] ?? '',
      category: json['category'] ?? '',
      stock: json['stock'] ?? '',
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final cat = json['category'] ?? {};
    return CategoryModel(
      id: cat['id'] ?? 0,
      name: cat['name'] ?? '',
      image: cat['image'] ?? '',
    );
  }
}
