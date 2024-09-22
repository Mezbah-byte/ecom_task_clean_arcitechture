import 'package:ecom_task/features/home/presentation/pages/home_page.dart';
import 'package:ecom_task/features/mainScreen/mainScreen.dart';
import 'package:ecom_task/features/product_details/presentation/pages/product_details_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/mainScreen';
  static const String productDetails = '/productDetailsPage';

  static String getInitialRoute() => initial;
  static String getReferListRoute(int id) => '$productDetails?type=$id';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainScreen()),
    GetPage(
      name: productDetails,
      page: () {
        int productId = int.tryParse(Get.parameters['id'] ?? '0') ?? 0;
        return ProductDetailsPage(id: productId);
      },
    ),
  ];
}
