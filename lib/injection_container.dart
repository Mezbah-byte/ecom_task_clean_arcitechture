import 'package:ecom_task/features/home/domain/usecases/get_featured_products.dart';
import 'package:ecom_task/features/home/domain/usecases/get_todays_deal.dart';
import 'package:get/get.dart';
import 'features/authentication/data/datasources/auth_remote_data_source.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';
import 'features/authentication/domain/repositories/auth_repository.dart';
import 'features/authentication/domain/usecases/login.dart';
import 'features/authentication/domain/usecases/signup.dart';
import 'features/authentication/presentation/controllers/auth_controller.dart';
import 'core/network/api_client.dart';
import 'package:dio/dio.dart';

import 'features/home/data/datasources/home_remote_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_featured_categories.dart';
import 'features/home/domain/usecases/get_sliders.dart';
import 'features/home/presentation/controllers/home_controller.dart';
import 'features/product_details/data/datasources/product_details_remote_data_source.dart';
import 'features/product_details/data/repositories/product_details_repository_impl.dart';
import 'features/product_details/domain/repositories/product_details_repository.dart';
import 'features/product_details/domain/usecases/get_product_details.dart';
import 'features/product_details/presentation/controller/product_details_controller.dart';

void init() {
  Get.put<Dio>(Dio());
  Get.lazyPut(() => ApiClient(Dio()));
  Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(Get.find()));
  Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find(), Get.find()));
  Get.lazyPut(() => Login(Get.find()));
  Get.lazyPut(() => Signup(Get.find()));
  Get.lazyPut(() =>
      AuthController(loginUseCase: Get.find(), signupUseCase: Get.find()));
  Get.lazyPut<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(Get.find()));
  Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(Get.find()));
  Get.lazyPut(() => GetSliders(Get.find()));
  Get.lazyPut(() => GetFeaturedCategories(Get.find()));
  Get.lazyPut(() => GetTodaysDeal(Get.find()));
  Get.lazyPut(() => GetFeaturedProducts(Get.find()));
  Get.lazyPut(() => HomeController(
        getSlidersUseCase: Get.find(),
        getFeaturedCategoriesUseCase: Get.find(),
        getTodaysDealUseCase: Get.find(),
        getFeaturedProductsUseCase: Get.find(),
      ));

  Get.lazyPut<ProductDetailsRemoteDataSource>(
      () => ProductDetailsRemoteDataSourceImpl(dio: Get.find()),
      fenix: true);
  Get.lazyPut<ProductDetailsRepository>(
      () => ProductDetailsImpl(Get.find<ProductDetailsRemoteDataSource>()),
      fenix: true);
  Get.lazyPut(() => GetProductDetails(Get.find<ProductDetailsRepository>()),
      fenix: true);
  Get.lazyPut(
      () => ProductDetailsController(
            getProductDetails: Get.find(),
            productId: Get.arguments['id'],
          ),
      fenix: true);
}
