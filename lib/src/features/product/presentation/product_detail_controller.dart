import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/product/data/product_repository.dart';
import 'package:starter_app/src/features/product/domain/product.dart';

part 'product_detail_controller.g.dart';

@riverpod
class ProductDetailController extends _$ProductDetailController {
  Future<List<Product>> _fetchData() async {
    // final repository = ref.read(productsRepositoryProvider);
    // final result = await repository.getAllProducts();

    // print(result.data?.meta?.currentPage.toString());

    // return result.data?.data ?? [];
    return [];
  }

  @override
  FutureOr<List<Product>> build() {
    return _fetchData();
  }
}
