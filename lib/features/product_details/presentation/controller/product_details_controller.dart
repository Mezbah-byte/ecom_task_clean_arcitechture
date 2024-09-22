import 'package:ecom_task/core/usecases/usecase.dart';
import 'package:ecom_task/features/home/domain/usecases/get_sliders.dart';
import 'package:ecom_task/features/product_details/domain/entites/product_details.dart';
import 'package:ecom_task/features/product_details/domain/usecases/get_product_details.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final GetProductDetails getProductDetails;
  final int productId;

  var productDetails = Rxn<ProductDetailsEntity>();
  RxBool isLoading = true.obs;
  RxString thumb = "".obs;

  ProductDetailsController({
    required this.getProductDetails,
    required this.productId,
  });

  @override
  void onInit() {
    print(productId.toString());
    super.onInit();
    fetchProductDetails();
  }

  void fetchProductDetails() async {
    isLoading(true);
    final result = await getProductDetails(productId);
    result.fold(
      (failure) => Get.snackbar("Error", failure.toString()),
      (data) {
        if (data != null) {
          productDetails(data);
          thumb.value = productDetails.value!.thumbnailImage;
        } else {
          Get.snackbar("Error", "Product details are empty");
        }
      },
    );
    isLoading(false);
  }
}
