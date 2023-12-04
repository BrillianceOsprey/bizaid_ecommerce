import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/product/presentation/widgets/product_related_list.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';
import 'package:starter_app/src/shared/utils/extensions/media_query_extension.dart';

@RoutePage()
class ProductDatailPage extends StatefulHookConsumerWidget {
  const ProductDatailPage(
    this.productCode,
    this.erpCode,
    this.productName,
    this.price,
    this.imageUrl, {
    super.key,
  });
  final String productCode;
  final String erpCode;
  final String productName;
  final String price;
  final String imageUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDatailPageState();
}

class _ProductDatailPageState extends ConsumerState<ProductDatailPage> {
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(10));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Product Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(
            //   widget.imageUrl,
            //   height: 200, // Adjust the height as needed
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            if (widget.imageUrl.isEmpty)
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: borderRadius,
                ),
                child: SizedBox(
                  height: context.screenHeight * 0.15,
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 80,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
            if (widget.imageUrl.isNotEmpty)
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: borderRadius,
                ),
                child: Container(
                  // width: context.screenWidth * 0.3,
                  height: context.screenHeight * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                        // 'http://13.228.29.1/productAllImage/SHATDX003.jpg',
                        widget.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              widget.productName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            gapH8,
            Text('ERP Code: ${widget.erpCode}'),
            gapH8,
            Text('Price: ${widget.price}'),
            const SizedBox(height: 16),
            // Add more details or components as needed
            gapH8,
            Expanded(
              child: ProductRelatedList(widget.productCode),
            ),
          ],
        ),
      ),
    );
  }
}
