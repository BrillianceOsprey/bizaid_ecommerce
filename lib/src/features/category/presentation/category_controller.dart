import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/category/data/category_repository.dart';
import 'package:starter_app/src/features/category/domain/first_level_category.dart';

part 'category_controller.g.dart';

@riverpod
class FirstCategoryList extends _$FirstCategoryList {
  Future<List<FirstCategory>> _fetchFirstCategoryData() async {
    final repository = ref.read(categoryRepositoryProvider);
    final result = await repository.getFirstCategory();
    return result.data ?? [];
  }

  @override
  FutureOr<List<FirstCategory>> build() {
    return _fetchFirstCategoryData();
  }
}

@riverpod
class SecondCategoryList extends _$SecondCategoryList {
  Future<List<SecondLevelCategory>> _fetchData([String? divisionId]) async {
    final repository = ref.read(categoryRepositoryProvider);

    if (divisionId == null) {
      final firstCategories = ref.watch(firstCategoryListProvider).value;
      if (firstCategories == null || firstCategories.isEmpty) {
        return [];
      } else {
        final result = await repository
            .getSecondCategory(firstCategories[0].divisionId.toString());
        return result;
      }
    } else {
      final result = await repository.getSecondCategory(divisionId);
      return result;
    }
  }

  @override
  FutureOr<List<SecondLevelCategory>> build() {
    return _fetchData();
  }

  Future<void> change(String divisionId) async {
    // state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchData(divisionId));
  }
}

@riverpod
class ThirdCategoryList extends _$ThirdCategoryList {
  Future<List<ThirdLevelCategory>> _fetchData(String itemCategoryId) async {
    final repository = ref.read(categoryRepositoryProvider);

    final result = await repository.getThirdCategory(itemCategoryId);
    return result;
  }

  @override
  FutureOr<List<ThirdLevelCategory>> build(String itemCategoryId) {
    return _fetchData(itemCategoryId);
  }

  Future<void> change(String itemCategoryId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchData(itemCategoryId));
  }
}
