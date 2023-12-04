import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/category/domain/first_level_category.dart';
import 'package:starter_app/src/shared/constants/endpoints.dart';
import 'package:starter_app/src/shared/models/app_response.dart';
import 'package:starter_app/src/shared/utils/dio_client/dio_client.dart';
import 'package:starter_app/src/shared/utils/logger/logger.dart';
part 'category_repository.g.dart';

class CategoryRepository {
  CategoryRepository({
    Dio? dioClient,
  }) : _client = dioClient ??= DioClient().instance;

  final Dio _client;

  Future<AppResponse<List<FirstCategory>>> getFirstCategory() async {
    final response = await _client.get(Endpoints.firstCategory);
    print(response.data);

    final result = await computeAppResponseList(
      response.data,
      FirstCategory.fromJson,
    );
    return result.throwIfError();
  }

  Future<List<SecondLevelCategory>> getSecondCategory(String divisionId) async {
    final response = await _client.get(
      Endpoints.secondCategory,
      queryParameters: {
        'divisionId': divisionId,
      },
    );

    final result = await computeAppResponseList(
      response.data,
      SecondLevelCategory.fromJson,
    );
    final categories = result.throwIfError().data ?? [];
    return categories;
  }

  Future<List<ThirdLevelCategory>> getThirdCategory(
      String itemCategoryId) async {
    final response = await _client.get(
      Endpoints.thirdCategory,
      queryParameters: {
        'itmCategoryId': itemCategoryId,
      },
    );
    logger.f(response.realUri);
    final result = await computeAppResponseList(
      response.data,
      ThirdLevelCategory.fromJson,
    );
    final categories = result.throwIfError().data ?? [];
    return categories;
  }
}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepository();
}
