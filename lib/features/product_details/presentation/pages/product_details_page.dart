import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_task/core/utils/appColor.dart';
import 'package:ecom_task/features/product_details/domain/usecases/get_product_details.dart';
import 'package:ecom_task/features/product_details/presentation/controller/product_details_controller.dart';
import 'package:ecom_task/features/widget/appBar.dart';
import 'package:ecom_task/features/widget/shimmerLoading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsPage extends StatefulWidget {
  final int id;
  ProductDetailsPage({super.key, required this.id});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late final ProductDetailsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProductDetailsController(
      getProductDetails: Get.find<GetProductDetails>(),
      productId: widget.id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProductDetailsController(
    //   getProductDetails: Get.find<GetProductDetails>(),
    //   productId: widget.id,
    // ));
    print(widget.id.toString());
    Get.snackbar('Error', widget.id.toString());
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: commonAppbar(context: context, title: "Details", actions: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.add_shopping_cart,
                  color: ColorResources.white,
                ),
              )
            ]),
            body: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.productDetails.value == null) {
                return const Center(child: Text("No product details found"));
              }

              final product = controller.productDetails.value!;
              return Stack(
                children: [
                  Scaffold(
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 350.h,
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => ShimmerLoader(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageUrl: controller.thumb.value),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            if (controller
                                .productDetails.value!.photos.isNotEmpty) ...[
                              // Build your UI using controller.products, controller.productMedia, and controller.recommendations
                              SizedBox(
                                height: 90,
                                width: MediaQuery.of(context).size.width - 40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller
                                      .productDetails.value!.photos.length,
                                  itemBuilder: (context, index) {
                                    final item = controller
                                        .productDetails.value!.photos[index];
                                    return InkWell(
                                      onTap: () {
                                        controller.thumb.value = item.path;
                                      },
                                      child: Container(
                                        width: 70,
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: ColorResources.badgeBg
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              padding: const EdgeInsets.all(8),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                height: 50,
                                                width: 50,
                                                imageUrl: item.path,
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child: ShimmerLoader(
                                                    width: 50,
                                                    height: 50,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Align text to the left
                                          children: [
                                            Text(
                                              product.name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines:
                                                  2, // Limit name to 2 lines to prevent overflow
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  height: 20,
                                                  width: 20,
                                                  imageUrl: product.shopLogo,
                                                  placeholder: (context, url) =>
                                                      Center(
                                                    child: ShimmerLoader(
                                                      width: 20,
                                                      height: 20,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  product.shopName,
                                                  style: const TextStyle(
                                                      color: ColorResources
                                                          .grey777,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            if (product.brand.name != "") ...[
                                              Row(
                                                children: [
                                                  CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    height: 20,
                                                    width: 20,
                                                    imageUrl:
                                                        product.brand.logo,
                                                    placeholder:
                                                        (context, url) =>
                                                            Center(
                                                      child: ShimmerLoader(
                                                        width: 20,
                                                        height: 20,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    product.brand.name,
                                                    style: const TextStyle(
                                                        color: ColorResources
                                                            .grey777,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                              8), // Add spacing between the price and text
                                      Text(
                                        product.mainPrice,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 8),
                            Text(product.description,
                                style: const TextStyle(fontSize: 16)),
                            // Add more fields as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ColorResources.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Total Price'),
                                Text(
                                  controller.productDetails.value!.mainPrice
                                      .toString()
                                      .toString(),
                                  style: const TextStyle(
                                      color: ColorResources.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                // cartManagerController.addCart(
                                //     context,
                                //     product.productUniqueId,
                                //     productDetailsController.qty.value);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorResources.green,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.shopping_bag,
                                          color: ColorResources.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Add to cart',
                                          style: TextStyle(
                                              color: ColorResources.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
