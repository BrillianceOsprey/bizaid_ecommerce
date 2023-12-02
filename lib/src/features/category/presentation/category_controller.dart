import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/category/data/category_repository.dart';
import 'package:starter_app/src/features/category/domain/first_level_category.dart';

part 'category_controller.g.dart';

@riverpod
class FirstCategoryList extends _$FirstCategoryList {
  Future<List<FirstCategory>> _fetchData() async {
    final repository = ref.read(categoryRepositoryProvider);
    final result = await repository.getAllProducts();
    return result.data ?? [];
  }

  @override
  FutureOr<List<FirstCategory>> build() {
    return _fetchData();
  }
}
