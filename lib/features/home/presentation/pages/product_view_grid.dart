import 'package:ecom_task/core/utils/route_helper.dart';
import 'package:ecom_task/features/home/domain/entities/product.dart';
import 'package:ecom_task/features/home/presentation/controllers/home_controller.dart';
import 'package:ecom_task/features/widget/productWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StaggeredGridView extends StatelessWidget {
  HomeController homeController;

  StaggeredGridView({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildColumns(context),
        ),
      ),
    );
  }

  List<Widget> _buildColumns(BuildContext context) {
    List<Widget> columns = [];
    int itemCount = homeController.featuredProducts.length;
    int rowCount = (itemCount / 2).ceil();

    for (int i = 0; i < 2; i++) {
      List<Widget> columnChildren = [];
      for (int j = 0; j < rowCount; j++) {
        int index = i + j * 2;
        if (index < itemCount) {
          Product product = homeController.featuredProducts[index];
          columnChildren.add(ProductWidget(
              product: product,
              onclick: () {
                Get.toNamed(RouteHelper.productDetails,
                    arguments: {'id': product.id});
              },
              addCartClick: () {
                // cartManagerController.addCart(
                //     context, product.productUniqueId, 1);
              }));
          if (j < rowCount - 1) {
            columnChildren.add(SizedBox(
              height: 5.h,
            ));
          }
        } else {
          columnChildren.add(SizedBox(width: 0, height: 0));
        }
      }
      if (i == 1) {
        columns.add(SizedBox(width: 5.w));
      }
      columns.add(Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnChildren,
        ),
      ));
    }

    return columns;
  }
}
