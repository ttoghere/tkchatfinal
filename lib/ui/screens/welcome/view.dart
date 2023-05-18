import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/welcome/controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: 360.w,
          height: 780.w,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                onPageChanged: (index) {
                  controller.changePage(index);
                },
                controller: PageController(
                  initialPage: 0,
                  keepPage: false,
                  viewportFraction: 1,
                ),
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/banner1.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/banner2.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/banner3.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 100.w,
                          left: 140.w,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.handleSignIn();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text("Login"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 70,
                child: DotsIndicator(
                  position: controller.state.index.value.toDouble(),
                  dotsCount: 3,
                  reversed: false,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: const Size.square(9),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    activeSize: const Size(18.0, 9.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
