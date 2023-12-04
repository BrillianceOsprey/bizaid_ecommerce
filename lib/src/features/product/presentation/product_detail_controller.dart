import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/product/data/product_repository.dart';
import 'package:starter_app/src/features/product/domain/product.dart';

part 'product_detail_controller.g.dart';

@riverpod
class ProductDetailController extends _$ProductDetailController {
  Future<List<Product>> _fetchData(String erpCode) async {
    final repository = ref.read(productsRepositoryProvider);

    final result = await repository.getRelatedProduct(erpCode);
    return result.data;
  }

  @override
  FutureOr<List<Product>> build(String erpCode) {
    return _fetchData(erpCode);
  }
}
