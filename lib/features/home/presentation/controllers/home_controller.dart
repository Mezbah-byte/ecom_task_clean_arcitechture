import 'package:ecom_task/features/home/domain/entities/product.dart';
import 'package:ecom_task/features/home/domain/usecases/get_featured_products.dart';
import 'package:ecom_task/features/home/domain/usecases/get_todays_deal.dart';
import 'package:get/get.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/slider.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_sliders.dart';
import '../../domain/usecases/get_featured_categories.dart';

class HomeController extends GetxController {
  final GetSliders getSlidersUseCase;
  final GetFeaturedCategories getFeaturedCategoriesUseCase;
  final GetTodaysDeal getTodaysDealUseCase;
  final GetFeaturedProducts getFeaturedProductsUseCase;

  var sliders = <Slider>[].obs;
  var categories = <Category>[].obs;
  var todaysDeal = <Product>[].obs;
  var featuredProducts = <Product>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  HomeController({
    required this.getSlidersUseCase,
    required this.getFeaturedCategoriesUseCase,
    required this.getTodaysDealUseCase,
    required this.getFeaturedProductsUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  void fetchHomeData() async {
    isLoading(true);
    final slidersResult = await getSlidersUseCase(NoParams());
    final categoriesResult = await getFeaturedCategoriesUseCase(NoParams());
    final todaysDealResult = await getTodaysDealUseCase(NoParams());
    final featuredProductsResult = await getFeaturedProductsUseCase(NoParams());

    slidersResult.fold(
      (failure) => Get.snackbar("Error", failure.toString()),
      (data) => sliders(data),
    );

    categoriesResult.fold(
      (failure) => error('Failed to fetch categories $failure'),
      (data) => categories(data),
    );

    todaysDealResult.fold(
      (failure) => Get.snackbar("Error", failure.toString()),
      (data) => todaysDeal(data),
    );

    featuredProductsResult.fold(
      (failure) => error('Failed to fetch categories $failure'),
      (data) => featuredProducts(data),
    );

    isLoading(false);
  }
}
