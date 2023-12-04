 import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/cart_notifer.dart';
import '../application/cart_state.dart'; 

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});