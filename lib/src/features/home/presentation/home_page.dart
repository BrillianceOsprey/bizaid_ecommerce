import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/category/presentation/category_page.dart';
import 'package:starter_app/src/features/home/presentation/widgets/home_product_grid_view.dart';
import 'package:starter_app/src/shared/utils/extensions/media_query_extension.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  bool isShowSecondCategory = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          Text(
            'First Category',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    isShowSecondCategory = !isShowSecondCategory;
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'First Category',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // second category list

          if (isShowSecondCategory)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Second Category',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.14,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          // ignore: inference_failure_on_instance_creation
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(),
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'http://13.228.29.1/productAllImage/SHATDX003.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text('Hanger'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          else
            const SizedBox(),

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
