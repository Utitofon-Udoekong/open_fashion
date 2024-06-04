import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/domain/entities/product.dart';
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

  void selectProduct(Product product) {
    emit(state.copyWith(selectedProduct: product));
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
