import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/features/product/data/product_repository.dart';
import 'package:starter_app/src/features/product/domain/product.dart';
import 'package:starter_app/src/shared/models/paginated_response.dart';

part 'product_list_controller.g.dart';

@riverpod
class PaginatedProductController extends _$PaginatedProductController
    with AutoDisposePaginationControllerMixin<Product> {
  @override
  FutureOr<PaginatedData<Product>> build() =>
      loadData(const PaginationRequest(page: 1, limit: 10));

  @override
  FutureOr<PaginatedData<Product>> loadData(PaginationRequest query) {
    final repository = ref.read(productsRepositoryProvider);
    return repository.getAllProducts(query.page, query.limit);
  }
}

mixin AutoDisposePaginationControllerMixin<T>
    // ignore: invalid_use_of_internal_member
    on BuildlessAutoDisposeAsyncNotifier<PaginatedData<T>> {
  FutureOr<PaginatedData<T>> loadData(PaginationRequest query);

  FutureOr<void> loadMore() async {
    final oldState = state;

    if (oldState.requireValue.isCompleted) return;
    if (oldState.requireValue.nextPage() == null) {
      print('nextPage() is null');
      return;
    }

    state = AsyncLoading<PaginatedData<T>>().copyWithPrevious(oldState);
    state = await AsyncValue.guard<PaginatedData<T>>(() async {
      final res = await loadData(oldState.requireValue.nextPage()!);
      res.data.insertAll(0, state.requireValue.data);
      return res;
    });
  }

  bool canLoadMore() {
    if (state.isLoading) return false;
    if (!state.hasValue) return false;
    if (state.requireValue.isCompleted) return false;
    return true;
  }
}
