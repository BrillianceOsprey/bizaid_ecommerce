import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/cart/data/cart_repository.dart';
import 'package:starter_app/src/features/cart/domain/cart.dart';
import 'package:starter_app/src/features/cart/provider/cart_provider.dart';
import 'package:starter_app/src/features/home/presentation/product_list/product_list_controller.dart';
import 'package:starter_app/src/features/product/presentation/product_detail_page.dart';
import 'package:starter_app/src/shared/utils/extensions/media_query_extension.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';
import 'package:starter_app/src/shared/widgets/alert_dialogs.dart';

class HomeProductGridView extends StatefulHookConsumerWidget {
  const HomeProductGridView({
    super.key,
  });

  @override
  ConsumerState<HomeProductGridView> createState() =>
      _HomeProductGridViewState();
}

class _HomeProductGridViewState extends ConsumerState<HomeProductGridView> {

  @override
  void initState() { 
    super.initState();
    ref.read(cartNotifierProvider.notifier).getCartData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(paginatedProductControllerProvider.notifier);

    final state = ref.watch(paginatedProductControllerProvider);

    const borderRadius = BorderRadius.all(Radius.circular(10));

    return switch (state) {
      AsyncData(:final value) when value.data.isNotEmpty => GridView.builder(
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: value.data.length +
              (state.isLoading || state.hasError || !controller.canLoadMore()
                  ? 1
                  : 0),
          itemBuilder: (context, index) {
            if (value.data.length == index) {
              // here we will handle isLoading and hasError and done
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (state.hasError) {
                return Center(
                  child: Text(
                    state.error.toString(),
                  ),
                );
              }

              if (!controller.canLoadMore()) {
                return const Center(child: Text('No more data'));
              }
            }

            final product = value.data[index];

            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDatailPage(
                      product.productCode,
                      product.erpCode,
                      product.productName,
                      product.price.toString(),
                      product.imageUrl,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.imageUrl.isEmpty)
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
                  if (product.imageUrl.isNotEmpty)
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: borderRadius,
                      ),
                      child: Container(
                        height: context.screenHeight * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                              product.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price.toString(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await ref.read(cartNotifierProvider.notifier).addCartData(cartData: 
                          Cart(1, product.productCode, 1, 'v1', product, null))
                           .then(
                                (value) => showAlertDialog(
                                    context: context,
                                    title: 'Success',
                                    content:
                                        'You added "${product.productName}" to you cart.'),
                              );
                           
                        },
                        icon: Card(
                          color: context.colorScheme.secondaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.shopping_cart),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.productName,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        product.erpCode.toString(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error, stackTrace: var _) => Center(
          child: SizedBox(
            height: 200,
            child: Center(
              child: Text(
                error.toString(),
              ),
            ),
          ),
        ),
      _ => const SizedBox(),
    };
  }
}
