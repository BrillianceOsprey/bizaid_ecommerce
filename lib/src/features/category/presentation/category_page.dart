import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/category/data/category_repository.dart';
import 'package:starter_app/src/features/category/domain/first_level_category.dart';
import 'package:starter_app/src/features/category/presentation/category_controller.dart';
import 'package:starter_app/src/shared/utils/logger/logger.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryPage extends StatefulHookConsumerWidget {
  final int itemCategoryId;
  const CategoryPage(this.itemCategoryId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  // List<ThirdLevelCategory> thirdCategoryList = [];
  // @override
  // void initState() {
  //   getThiredCategory(
  //     widget.itemCategoryId.toString(),
  //   );
  //   super.initState();
  // }

  // Future<void> getThiredCategory(String itemCategoryId) async {
  //   Future.microtask(() {
  //     final repository = ref.read(categoryRepositoryProvider);

  //     final data = repository.getThirdCategory(itemCategoryId);

  //     data.then((value) {
  //       setState(() {
  //         thirdCategoryList = value;
  //       });
  //       logger.t(value.length);
  //       logger.t(widget.itemCategoryId);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(thirdCategoryListProvider(widget.itemCategoryId.toString()));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Categories'),
        ),
        body: SizedBox(
          child: switch (state) {
            AsyncData(:final value) when value.isNotEmpty => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        value[index].productCategoryName ?? '',
                      ),
                      // leading: Image.network(
                      //   thirdCategoryList[index].imageUrl ?? '',
                      // ),
                      leading: SizedBox(
                        child: CachedNetworkImage(
                          height: 70,
                          width: 70,
                          imageUrl: value[index].imageUrl ?? '',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                  Colors.red,
                                  BlendMode.colorBurn,
                                ),
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Center(
                            child: Text('No image'),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            AsyncLoading() => const Center(child: CircularProgressIndicator()),
            _ => const Text('No data'),
          },
        ));
  }
}
