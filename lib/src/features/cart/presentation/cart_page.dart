import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/cart/provider/cart_provider.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';

import 'cart_detail_page.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartList  = ref.watch(cartNotifierProvider).cartListData;
    return   Scaffold(
      appBar: AppBar(
          backgroundColor: context.colorScheme.inversePrimary,
          title: Text(
            'Counts: ${cartList.length.toString() }',
          ),
          actions: const [
            Icon(Icons.shopping_cart),
            SizedBox(
              width: 12,
            ),
            Icon(Icons.delete),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      body:   ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CartDetailPage(
                          cart: cartList[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Card(
                      child: Row(
                        children: [
                          if (cartList[index].product.imageUrl.isEmpty)
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 100,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                          if (cartList[index].product.imageUrl.isNotEmpty)
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    cartList[index].product.imageUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          gapW12,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // title
                                Text(
                                  cartList[index].product.productName,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.titleMedium,
                                ),
                                Text(
                                  cartList[index].quantity.toString(),
                                  style: context.textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                gapH12,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${cartList[index].product.price.toString()} MMK',
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
    );
  }
}