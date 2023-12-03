import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/category/presentation/category_controller.dart';
import 'package:starter_app/src/features/category/presentation/category_page.dart';
import 'package:starter_app/src/features/home/presentation/product_list/product_list_controller.dart';
import 'package:starter_app/src/features/home/presentation/widgets/home_product_grid_view.dart';
import 'package:starter_app/src/shared/pagination/use_pagination.dart';
import 'package:starter_app/src/shared/utils/async/async_value_ui.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';

final selectedFirstCategoryTitleProvider = StateProvider<String>((ref) => '');

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  bool isShowSecondCategory = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(firstCategoryListProvider, (_, state) {
      state.showAlertDialogOnError(context);
      ref.read(selectedFirstCategoryTitleProvider.notifier).state =
          state.value!.first.divisionName ?? '';
    });

    final firstCategorystate = ref.watch(firstCategoryListProvider);
    final secondCatState = ref.watch(secondCategoryListProvider);

    final controller = ref.watch(paginatedProductControllerProvider.notifier);
    final scrollController = usePagination(
      controller.loadMore,
      () => controller.canLoadMore(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: ListView(
        controller: scrollController,
        children: [
          Text(
            'First Category',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: switch (firstCategorystate) {
                AsyncData(value: final data) when data.isNotEmpty =>
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // setState(() {
                        //   isShowSecondCategory = !isShowSecondCategory;
                        // });
                        ref
                            .read(selectedFirstCategoryTitleProvider.notifier)
                            .state = data[index].divisionName ?? '';
                        ref
                            .read(secondCategoryListProvider.notifier)
                            .change(data[index].divisionId.toString());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              data[index].divisionName.toString(),
                              style: context.textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                AsyncLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                _ => const SizedBox(),
              }),

          // second category list

          switch (secondCatState) {
            AsyncData(:final value) when value.isNotEmpty => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ref.watch(selectedFirstCategoryTitleProvider),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.14,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            // ignore: inference_failure_on_instance_creation
                            MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                value[index].itemCategoryId,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              // CachedNetworkImage(
                              //   height: 70,
                              //   width: 70,
                              //   imageUrl:
                              //       'http://13.228.29.1/productAllImage/HHPSA006.jpg',
                              //   imageBuilder: (context, imageProvider) =>
                              //       Container(
                              //     decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //         image: imageProvider,
                              //         fit: BoxFit.cover,
                              //         colorFilter: const ColorFilter.mode(
                              //           Colors.red,
                              //           BlendMode.colorBurn,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              //   placeholder: (context, url) =>
                              //       const CircularProgressIndicator(),
                              //   errorWidget: (context, url, error) =>
                              //       const Icon(Icons.error),
                              // ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      value[index].imageUrl ?? '',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(value[index].itemCategoryName ?? ''),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            AsyncLoading() => const Center(child: CircularProgressIndicator()),
            _ => const Text('No data'),
          },

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              // vertical: 16,
            ),
            child: HomeProductGridView(),
          ),
        ],
      ),
    );
  }
}
