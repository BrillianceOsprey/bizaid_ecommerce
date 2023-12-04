// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:starter_app/src/features/cart/data/cart_repository.dart';
// import 'package:starter_app/src/features/cart/domain/cart.dart';
// part 'cart_controller.g.dart';

// @riverpod
// class CartController extends _$CartController {
//   Future<List<Cart>> _fetchCartsList() async {
//     final repository = ref.read(cartRepositoryProvider);
//     final result = await repository.getCartsList();
//     return result.data ?? [];
//   }

//   @override
//   FutureOr<List<Cart>> build() {
//     return _fetchCartsList();
//   }
// }


// @riverpod
// class AddToCartController extends _$AddToCartController {
//   Future<List<Cart>> _addToCart() async {
//     final repository = ref.read(cartRepositoryProvider);
//     final result = await repository.addToCart();
//     return result.data ?? [];
//   }

//   @override
//   FutureOr<List<Cart>> build() {
//     return _addToCart();
//   }
// }
 
// @riverpod
// class AddToCartController extends _$AddToCartController {
//   Future<List<Cart>> _addToCart() async {
//     final repository = ref.read(cartRepositoryProvider);
//     final result = await repository.addToCart();
//     return result.data ?? [];
//   }

//   @override
//   FutureOr<List<Cart>> build() {
//     return _addToCart();
//   }
// }
