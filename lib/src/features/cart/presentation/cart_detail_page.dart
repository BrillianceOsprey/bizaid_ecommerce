import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';

class CartDetailPage extends StatefulHookConsumerWidget {
  const CartDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartDetailPageState();
}

class _CartDetailPageState extends ConsumerState<CartDetailPage> {
  final TextEditingController quantityController = TextEditingController();
  // List<Cart> shoppingCart = [
  //   Cart(
  //     1,
  //     '4665',
  //     4,
  //     '88',
  //     const Product(
  //       productCode: 'productCode',
  //       erpCode: 'erpCode',
  //       productName: 'productName',
  //       price: 'price',
  //       imageUrl: 'imageUrl',
  //       variants: [],
  //     ),
  //     'variants',
  //   ),
  //   Cart(
  //     1,
  //     '4665',
  //     4,
  //     '88',
  //     const Product(
  //       productCode: 'productCode',
  //       erpCode: 'erpCode',
  //       productName: 'productName',
  //       price: 'price',
  //       imageUrl: 'imageUrl',
  //       variants: [],
  //     ),
  //     'variants',
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          Sizes.p16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'http://13.228.29.1/productAllImage/SHATDX003.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: Sizes.p16,
            ),
            const Text(
              'product.productName',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            const Text('ERP Code: 44444'),
            gapH8,
            const Text('Price: 5456464'),
            gapH8,
            const Text('Quantity: 433'),
            gapH12,
            Row(
              children: [
                const Text('Quantity: '),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                gapH16,
                ElevatedButton(
                  onPressed: () {
                    final newQuantity =
                        int.tryParse(quantityController.text) ?? 0;
                    setState(() {
                      // widget.product.quantity = newQuantity;
                    });
                  },
                  child: const Text('Update Quantity'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
