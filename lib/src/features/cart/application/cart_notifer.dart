import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/cart/application/cart_state.dart';
import 'package:starter_app/src/features/cart/data/cart_repository.dart';
import 'package:starter_app/src/features/cart/domain/cart.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState());

  final cartRepo = CartRepository();
  Future<void> addCartData({required Cart cartData}) async {
   
    state = state.copyWith(cartListData: [...state.cartListData, cartData]);
    cartRepo.addToCart(
        productCode: cartData.productCode, quantity: cartData.quantity);
         
  }

  Future<void> getCartData() async {
    cartRepo.getCartsList().then((value) {
      List<Cart> carListData = value.data ?? [];
      state = state.copyWith(cartListData: carListData);
    });
  }

  Future<void> deleteCartData(Cart cartData) async {
    cartRepo.deleteCart(productCode: cartData.productCode);

    List<Cart> cartListData = [];
    cartListData.addAll(state.cartListData);
    int index = cartListData.indexOf(cartData);
    cartListData.removeAt(index);
    state = state.copyWith(cartListData: cartListData);
     cartRepo.deleteCart(
        productCode: cartData.id.toString(),  );
  }

  Future<void> updateCartData(Cart cartData, int quantity) async {
    List<Cart> cartListData = [];
    cartListData.addAll(state.cartListData);
    int index = cartListData.indexOf(cartData);
    var updCartData  = Cart(cartData.id, cartData.productCode, quantity, cartData.variantId, cartData.product, null);
    cartListData[index] = updCartData;
    state = state.copyWith(cartListData: cartListData);
        cartRepo.addToCart(
        productCode: cartData.productCode, quantity:  quantity);
  }
}
