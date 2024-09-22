import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_task/core/utils/appColor.dart';
import 'package:ecom_task/features/widget/shimmerLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../home/domain/entities/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onclick; // Callback for full product click
  final VoidCallback addCartClick; // Callback for "Add to Cart" click

  const ProductWidget({
    super.key,
    required this.product,
    required this.onclick,
    required this.addCartClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick, // Trigger full product click functionality
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          margin: const EdgeInsets.only(left: 0, right: 0),
          decoration: BoxDecoration(
              color: ColorResources.grey777.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorResources.badgeBg.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          height: 180.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: product.thumbnailImage,
                          placeholder: (context, url) => Center(
                              child: ShimmerLoader(
                            height: 180,
                            width: MediaQuery.of(context).size.width - 20,
                          )),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name ?? "",
                          maxLines: 3,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: ColorResources.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.buttonColor,
                              size: 15,
                            ),
                            Text(
                              ' ${product.rating}',
                              style: TextStyle(
                                color: ColorResources.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${product.sales} sales',
                              style: TextStyle(
                                  color: ColorResources.black, fontSize: 10.sp),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              ' ৳ ${product.mainPrice}',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorResources.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorResources.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          child: Text('Add to cart',
                              style: TextStyle(
                                  color: ColorResources.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
