import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/cart/presentation/cart_controller.dart';
import 'package:starter_app/src/features/cart/presentation/cart_detail_page.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';
import 'package:starter_app/src/shared/utils/async/async_value_ui.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';
import 'package:starter_app/src/shared/utils/logger/logger.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(cartControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
      logger.t(state.value!.first.productCode);
    });
    final cartListState = ref.watch(cartControllerProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.colorScheme.inversePrimary,
          title: Text(
            'Counts: ${cartListState.value?.length.toString() ?? ''}',
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
        body: switch (cartListState) {
          AsyncData(:final value) when value.isNotEmpty => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CartDetailPage(
                          cart: value[index],
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
                          if (value[index].product.imageUrl.isEmpty)
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
                          if (value[index].product.imageUrl.isNotEmpty)
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    value[index].product.imageUrl,
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
                                  value[index].product.productName,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.titleMedium,
                                ),
                                Text(
                                  value[index].quantity.toString(),
                                  style: context.textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                gapH12,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${value[index].product.price.toString()} MMK',
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
            ),
          AsyncLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          _ => const SizedBox(),
        });
  }
}
