import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_task/core/utils/appColor.dart';
import 'package:ecom_task/features/home/presentation/controllers/home_controller.dart';
import 'package:ecom_task/features/widget/shimmerLoading.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';

class CategoryWidget extends StatelessWidget {
  HomeController controller;

  CategoryWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];

            return Container(
              decoration: BoxDecoration(
                  color: ColorResources.newBg.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10)),
              width: 150,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      height: 35,
                      width: 35,
                      placeholder: (context, url) => ShimmerLoader(
                        width: 35,
                        height: 35,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: category.banner,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    category.name,
                    style: const TextStyle(
                        color: ColorResources.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
