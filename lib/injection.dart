import 'package:get_it/get_it.dart';
import 'package:pure_life/core/providers/product_provider.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory<ProductProvider>(() => ProductProvider());
}
