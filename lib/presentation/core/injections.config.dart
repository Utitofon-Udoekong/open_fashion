// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/cart_repository.dart' as _i6;
import '../../data/local/cart_dao.dart' as _i4;
import '../../data/product_repository.dart' as _i3;
import '../../domain/usecase/cart_use_case.dart' as _i7;
import '../../domain/usecase/product_use_case.dart' as _i5;
import '../pages/cubit/shop_cubit.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ProductRepository>(() => _i3.ProductRepository());
    gh.lazySingleton<_i4.CartDao>(() => _i4.CartDao());
    gh.lazySingleton<_i5.ProductUseCase>(
        () => _i5.ProductUseCase(gh<_i3.ProductRepository>()));
    gh.singleton<_i6.CartRepository>(
        () => _i6.CartRepository(gh<_i4.CartDao>()));
    gh.lazySingleton<_i7.CartUseCase>(
        () => _i7.CartUseCase(gh<_i6.CartRepository>()));
    gh.lazySingleton<_i8.ShopCubit>(() => _i8.ShopCubit(
          gh<_i5.ProductUseCase>(),
          gh<_i7.CartUseCase>(),
        ));
    return this;
  }
}
