import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_task/core/utils/appColor.dart';
import 'package:ecom_task/features/home/presentation/controllers/home_controller.dart';
import 'package:ecom_task/features/home/presentation/pages/category_widget.dart';
import 'package:ecom_task/features/widget/appBar.dart';
import 'package:ecom_task/features/widget/shimmerLoading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: appbarWithoutBackbutton(
          context: context, title: "Categories", actions: []),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Adjust height based on need
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1,
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];

                      return Container(
                        decoration: BoxDecoration(
                            color: ColorResources.newBg.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
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
                                height: 10,
                              ),
                              Expanded(
                                child: Text(
                                  category.name,
                                  style: const TextStyle(
                                      color: ColorResources.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow
                                      .ellipsis, // Handle text overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
