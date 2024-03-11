import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/constants.dart';
import 'package:slash/data/dummy_data.dart';
import 'package:slash/presentation/screens/details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // product.variations[0].productVariantImages[index]
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Slash.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 20.w,
          crossAxisSpacing: 20.w,
          childAspectRatio: 1 / 1.58,
          // width / height
          children: List.generate(
            4,
            (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailsScreen(),
                    ),
                  );
                },
                child: ProductCard(
                  product: product.variations[0].productVariantImages[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final String product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Hero(
            tag: product,
            child: Container(
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                image: DecorationImage(
                  image: NetworkImage(
                    product,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Interns - Wall painting',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: const CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                    'https://assets.designhill.com/design-blog/wp-content/uploads/2019/04/22-min-2.jpg'),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Expanded(
              child: Text(
                'EGP 250',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white70),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: Colors.grey),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
