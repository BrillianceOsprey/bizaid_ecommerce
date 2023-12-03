import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/product/domain/product.dart';
import 'package:starter_app/src/shared/constants/endpoints.dart';
import 'package:starter_app/src/shared/models/app_response.dart';
import 'package:starter_app/src/shared/models/paginated_response.dart';
import 'package:starter_app/src/shared/utils/dio_client/dio_client.dart';

part 'product_repository.g.dart';

class ProductRepository {
  ProductRepository({
    Dio? dioClient,
  }) : _client = dioClient ??= DioClient().instance;

  final Dio _client;

  Future<PaginatedData<Product>> getAllProducts(int page, int limit) async {
    final response = await _client.get(
      Endpoints.products,
      queryParameters: {
        'page': '$page',
        'limit': '$limit',
        'search': '',
        'divisionId': '',
        'itemCategoryId': '',
        'productCategoryId': '',
      },
    );

    final result = AppResponse.fromJson(
      response.data,
      (dynamic json) {
        return PaginatedData.fromJson(
          json,
          (dynamic subJson) {
            return Product.fromJson(subJson);
          },
        );
      },
    );

    return result.throwIfError().data!;
  }
}

@riverpod
ProductRepository productsRepository(ProductsRepositoryRef ref) {
  return ProductRepository();
}
