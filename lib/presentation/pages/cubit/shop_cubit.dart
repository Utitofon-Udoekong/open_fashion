import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/domain/entities/payment_method.dart';
import 'package:open_fashion/domain/entities/product.dart';
import 'package:open_fashion/domain/entities/shipping_address.dart';
import 'package:open_fashion/domain/usecase/cart_use_case.dart';
import 'package:open_fashion/domain/usecase/product_use_case.dart';

part 'shop_cubit.freezed.dart';
part 'shop_state.dart';

@lazySingleton
class ShopCubit extends Cubit<ShopState> {
  final ProductUseCase productUseCase;
  final CartUseCase cartUseCase;
  ShopCubit(this.productUseCase, this.cartUseCase) : super(ShopState.empty()) {
    getProducts();
  }

  void updatesaFirstName(String value) =>
      emit(state.copyWith(saFirstName: value));
  void updatesaLastName(String value) =>
      emit(state.copyWith(saLastName: value));
  void updatesaAddress(String value) => emit(state.copyWith(saAddress: value));
  void updatesaCity(String value) => emit(state.copyWith(saCity: value));
  void updatesaState(String value) => emit(state.copyWith(saState: value));
  void updatesaZipCode(String value) => emit(state.copyWith(saZipCode: value));
  void updatesaPhone(String value) => emit(state.copyWith(saPhone: value));

  void updatepmCardName(String value) =>
      emit(state.copyWith(pmCardName: value));
  void updatepmCardNumber(String value) =>
      emit(state.copyWith(pmCardNumber: value));
  void updatepmExpMonth(String value) =>
      emit(state.copyWith(pmExpMonth: value));
  void updatepmExpDate(String value) => emit(state.copyWith(pmExpDate: value));
  void updatepmCVV(String value) => emit(state.copyWith(pmCVV: value));

  void selectProduct(Product product) {
    emit(state.copyWith(selectedProduct: product));
  }

  void selectShippingAddress(ShippingAddress address) {
    emit(state.copyWith(selectedShippingAddress: address));
  }

  void selectPaymentMethod(PaymentMethod method) {
    emit(state.copyWith(selectedPaymentMethod: method));
  }

  void addToCart(CartItem cartItem) async {
    load();
    final response = await cartUseCase.addToCart(cartItem);
    response.fold((l) => fail(l), (r) => pass(r));
  }

  void removeFromCart(int id) async {
    load();
    final response = await cartUseCase.removeFromCart(id);
    response.fold((l) => fail(l), (r) => pass(r));
  }

  void getProducts() async {
    load();
    final response = await productUseCase.getProducts();
    response.fold((l) => fail(l), (r) {
      emit(state.copyWith(products: r, isLoading: false));
    });
  }

  void addPaymentMethod() async {
    load();
    final id = Random().nextInt(10000000) + 10000000;
    PaymentMethod paymentMethod = PaymentMethod(
      nameOnCard: state.pmCardName,
      cardNumber: state.pmCardNumber,
      expMonth: state.pmExpMonth,
      expDate: state.pmExpDate,
      cvv: state.pmCVV,
      id: id,
    );
    if (paymentMethod != PaymentMethod.empty()) {
      final response = await cartUseCase.addPaymentMethod(paymentMethod);
      response.fold((l) => fail(l), (r) => pass(r));
    }
  }

  void addShippingAddress() async {
    load();
    final id = Random().nextInt(10000000) + 10000000;
    ShippingAddress shippingAddress = ShippingAddress(
      firstName: state.saFirstName,
      lastName: state.saLastName,
      address: state.saAddress,
      city: state.saCity,
      state: state.saState,
      zipCode: state.saZipCode,
      phone: state.saPhone,
      id: id,
    );
    if (shippingAddress != ShippingAddress.empty()) {
      final response = await cartUseCase.addShippingAddress(shippingAddress);
      response.fold((l) => fail(l), (r) => pass(r));
    }
  }

  void clearCart() => cartUseCase.clearCart();

  /// HELPER FUNCTION TO SAVE SUCCESS STATES
  void pass(String success) =>
      emit(state.copyWith(success: success, isLoading: false));

  /// HELPER FUNCTION TO SAVE FAILURE STATES
  void fail(String failure) =>
      emit(state.copyWith(failure: failure, isLoading: false));

  /// HELPER FUNCTION TO SET LOADING STATE
  void load() =>
      emit(state.copyWith(success: '', failure: '', isLoading: true));

  /// HELPER FUNCTION TO RESET LOADING STATE
  void reset() => emit(ShopState.empty());
}
