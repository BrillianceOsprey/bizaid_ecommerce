import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/cart.dart';

part 'cart_state.freezed.dart';
part 'cart_state.g.dart';

@freezed
class CartState with _$CartState {

  factory CartState({
    @Default([]) List<Cart> cartListData
  }) = _CartState;

  factory CartState.fromJson(Map<String, dynamic> json) => _$CartStateFromJson(json);
}