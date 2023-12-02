// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';

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
  List<String> productList = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.imageUrl,
              height: 200, // Adjust the height as needed
              width: double.infinity,
              fit: BoxFit.cover,
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
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productList[index]),
                    // You can add more details or customize the list item as needed
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
