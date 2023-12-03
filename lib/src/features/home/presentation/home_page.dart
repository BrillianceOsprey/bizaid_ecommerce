import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/category/presentation/category_controller.dart';
import 'package:starter_app/src/features/category/presentation/category_page.dart';
import 'package:starter_app/src/features/home/presentation/product_list/product_list_controller.dart';
import 'package:starter_app/src/features/home/presentation/widgets/first_cat_placeholder.dart';
import 'package:starter_app/src/features/home/presentation/widgets/home_product_grid_view.dart';
import 'package:starter_app/src/features/home/presentation/widgets/second_cat_placeholder.dart';
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
  @override
  Widget build(BuildContext context) {
    // get first category
    ref.listen(firstCategoryListProvider, (_, state) {
      state.showAlertDialogOnError(context);
      ref.read(selectedFirstCategoryTitleProvider.notifier).state =
          state.value!.first.divisionName ?? '';
    });

    final firstCategorystate = ref.watch(firstCategoryListProvider);
    // watch second category from repository
    final secondCatState = ref.watch(secondCategoryListProvider);
    // pagination controller for home page product
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'First Category',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
                _ => const FirstCatPlaceHolder(),
              }),

          // second category list

          switch (secondCatState) {
            AsyncData(:final value) when value.isNotEmpty => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      ref.watch(selectedFirstCategoryTitleProvider),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
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
                              value[index].imageUrl == null
                                  ? SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 80,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    )
                                  : Container(
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
            AsyncLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            _ => const SecondCatPlaceHolder(),
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
