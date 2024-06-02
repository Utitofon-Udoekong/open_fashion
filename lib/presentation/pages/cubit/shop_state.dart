part of 'shop_cubit.dart';

@freezed
class ShopState with _$ShopState {
  const ShopState._();
  const factory ShopState({
    required String success,
    required String failure,
    required bool isLoading,
    required List<CartItem> cart,
    required List<Product> products,
    required List<Product> filteredProducts,
    required Product selectedProduct,
  }) = _ShopState;

  factory ShopState.empty() => ShopState(
        failure: '',
        success: '',
        isLoading: false,
        cart: [],
        products: [],
        filteredProducts: [],
        selectedProduct: Product.empty(),
      );
  int get cartSize => cart.length;
  bool get isCartEmpty => cart.isEmpty;
}
