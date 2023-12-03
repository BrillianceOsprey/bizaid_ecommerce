import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/home/presentation/product_list/product_list_controller.dart';
import 'package:starter_app/src/features/product/presentation/product_detail_page.dart';
import 'package:starter_app/src/shared/utils/extensions/media_query_extension.dart';

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
  Widget build(BuildContext context) {
    final controller = ref.watch(paginatedProductControllerProvider.notifier);
    // final scrollController = usePagination(
    //   controller.loadMore,
    //   () => controller.canLoadMore(),
    // );

    final state = ref.watch(paginatedProductControllerProvider);

    const borderRadius = BorderRadius.all(Radius.circular(10));
    // ref.listen(productDetailControllerProvider, (previous, next) {
    //   next.when(
    //     data: (data) {
    //       log(data.toString());
    //     },
    //     error: (_, __) {
    //       log(_.toString());
    //     },
    //     loading: () {},
    //   );
    // });

    // final productState = ref.watch(productDetailControllerProvider);

    return SizedBox(
        child: switch (state) {
      AsyncData(:final value) when value.data.isNotEmpty => GridView.builder(
          // controller: scrollController,
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
                return Center(child: Text(state.error.toString()));
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
                    builder: (context) => const ProductDatailPage(
                      'productCode',
                      'erpCode',
                      'productName',
                      'price',
                      'http://13.228.29.1/productAllImage/SHATDX003.jpg',
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
                        // width: context.screenWidth * 0.3,
                        height: context.screenHeight * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                              // 'http://13.228.29.1/productAllImage/SHATDX003.jpg',
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
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline),
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       'Only 10 items left',
                  //       style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         margin: const EdgeInsets.only(
                  //           top: 8,
                  //           right: 8,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color:
                  //               context.colorScheme.onBackground.withOpacity(0.1),
                  //           borderRadius: BorderRadius.circular(4),
                  //         ),
                  //         child: const Padding(
                  //           padding: EdgeInsets.all(2.0),
                  //           child: Icon(
                  //             Icons.shopping_cart_outlined,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            );
          },
        ),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error, stackTrace: var _) =>
        Center(child: Text(error.toString())),
      _ => const SizedBox(),
    });
  }
}
