import 'dart:async';

import 'package:ecom_task/features/home/presentation/controllers/home_controller.dart';
import 'package:ecom_task/features/home/presentation/pages/product_view_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidersWidgets extends StatefulWidget {
  HomeController controller;
  SlidersWidgets({super.key, required this.controller});

  @override
  State<SlidersWidgets> createState() => _SlidersWidgetsState();
}

class _SlidersWidgetsState extends State<SlidersWidgets> {
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    Timer? timer;

    // Auto-scroll every 3 seconds
    void startAutoScroll() {
      timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (pageController.hasClients) {
          int nextPage = pageController.page!.round() + 1;
          if (nextPage == widget.controller.sliders.length) {
            nextPage = 0; // Go back to the first slider if it's the last one
          }
          pageController.animateToPage(
            nextPage,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      });
    }

    @override
    void dispose() {
      timer?.cancel(); // Cancel the timer when the widget is disposed
      pageController.dispose();
    }

    // Start the auto-scroll when the widget is initialized
    startAutoScroll();

    return SizedBox(
      height: 150.h,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.controller.sliders.length,
        itemBuilder: (context, index) {
          final slider = widget.controller.sliders[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  height: 150.h, slider.imageUrl, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
