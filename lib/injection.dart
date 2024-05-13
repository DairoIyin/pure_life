import 'package:get_it/get_it.dart';
import 'package:pure_life/core/data/data.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/data/purelife_repository_impl.dart';
import 'package:pure_life/core/network/api_client.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void init() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerFactory<ProductProvider>(() => ProductProvider());
  getIt.registerLazySingleton<TokenRepository>(
      () => TokenRepositoryImpl(sharedPreferences: getIt()));
  getIt.registerLazySingleton<ApiClient>(
      () => ApiClient(tokenRepository: getIt()));
  getIt.registerLazySingleton<PureLifeRepository>(
      () => PureLifeRepositoryImpl(client: getIt()));
}
