import 'package:alisons_machine_test/utils/app_colors.dart';
import 'package:alisons_machine_test/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String discount;
  final String imageUrl;
  final String category;
  final String title;
  final String price;
  final String strikePrice;

  const ProductCard({
    super.key,
    required this.discount,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.price,
    required this.strikePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (discount.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkBrown,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '$discount off',
                    style: AppTextStyles.discountBadge,
                  ),
                )
              else
                const SizedBox(),
              const Icon(
                Icons.favorite_border,
                color: AppColors.primary,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Image.network(
              imageUrl,
              height: 80,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 80,
                child: Icon(Icons.image, color: AppColors.placeholder),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(category, style: AppTextStyles.productSubtitle),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTextStyles.productTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text('₹ $price', style: AppTextStyles.price),
              const SizedBox(width: 8),
              Text('₹ $strikePrice', style: AppTextStyles.strikePrice),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Add',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.primary,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
