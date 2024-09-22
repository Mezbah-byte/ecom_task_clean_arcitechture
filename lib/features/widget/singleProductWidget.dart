import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_task/core/utils/appColor.dart';
import 'package:ecom_task/core/utils/route_helper.dart';
import 'package:ecom_task/features/home/domain/entities/product.dart';
import 'package:ecom_task/features/product_details/presentation/pages/product_details_page.dart';
import 'package:ecom_task/features/widget/shimmerLoading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProductWidget extends StatelessWidget {
  Product product;
  SingleProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            onTap: () {
              Get.toNamed(RouteHelper.productDetails,
                  arguments: {'id': product.id});
            },
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                  color: ColorResources.grey9AA.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            height: 150,
                            width: 120,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => ShimmerLoader(
                                  width: 120,
                                  height: 150,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageUrl: product.thumbnailImage),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorResources.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      product.mainPrice,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorResources.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorResources.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.add_shopping_cart_outlined,
                  size: 20,
                  color: ColorResources.white,
                ),
              ),
            ))
      ],
    );
  }
}
