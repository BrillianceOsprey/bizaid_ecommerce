import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/cart/domain/cart.dart';
import 'package:starter_app/src/shared/constants/endpoints.dart';
import 'package:starter_app/src/shared/models/app_response.dart';
import 'package:starter_app/src/shared/utils/dio_client/dio_client.dart';
part 'cart_repository.g.dart';

class CartRepository {
  CartRepository({
    Dio? dioClient,
  }) : _client = dioClient ??= DioClient().instance;

  final Dio _client;

  Future<AppResponse<List<Cart>>> getCartsList() async {
    Map<String, dynamic> headers = {
      'x-temp-user-id': '324432432',
      // Add more headers as needed
    };
    final response = await _client.get(
      Endpoints.carts,
      options: Options(
        headers: headers,
      ),
    );
    print(response.data);

    final result = await computeAppResponseList(
      response.data,
      Cart.fromJson,
    );
    return result.throwIfError();
  }
}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  return CartRepository();
}
