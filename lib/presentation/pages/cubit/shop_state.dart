
part of 'shop_cubit.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState({
    required String success,
    required String failure,
    required String saFirstName,
    required String saLastName,
    required String saAddress,
    required String saCity,
    required String saState,
    required String saZipCode,
    required String saPhone,
    required String pmCardName,
    required String pmCardNumber,
    required String pmExpMonth,
    required String pmExpDate,
    required String pmCVV,
    required bool isLoading,
    required List<CartItem> cart,
    required List<Product> products,
    required List<Product> filteredProducts,
    required Product selectedProduct,
    required ShippingAddress selectedShippingAddress,
    required PaymentMethod selectedPaymentMethod,
  }) = _ShopState;

  factory ShopState.empty() => ShopState(
        failure: '',
        success: '',
        isLoading: false,
        cart: [],
        products: [],
        filteredProducts: [],
        saFirstName: '',
        saLastName: '',
        saAddress: '',
        saCity: '',
        saState: '',
        saZipCode: '',
        saPhone: '',
        pmCardName: '',
        pmCardNumber: '',
        pmExpMonth: '',
        pmExpDate: '',
        pmCVV: '',
        selectedProduct: Product.empty(), selectedShippingAddress: ShippingAddress.empty(),
        selectedPaymentMethod: PaymentMethod.empty()
      );
  
}
