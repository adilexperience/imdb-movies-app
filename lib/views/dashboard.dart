import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/dashboard_controller.dart';
import 'package:imdb_movies_app/controllers/utils/app_colors.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Consumer<DashboardController>(
        builder: (context, controller, child) =>
            controller.screens[controller.activeIndex],
      ),
      bottomNavigationBar: Consumer<DashboardController>(
        builder: (context, controller, child) => Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(
            40.0,
            20.0,
            40.0,
            25.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => controller.changeScreen(newIndex: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.search_circle_fill,
                      color: controller.getColor(
                        itemIndex: 0,
                        currentIndex: controller.activeIndex,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Search",
                      style: TextStyle(
                        color: controller.getColor(
                          itemIndex: 0,
                          currentIndex: controller.activeIndex,
                        ),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.changeScreen(newIndex: 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.play_circle,
                      color: controller.getColor(
                        itemIndex: 1,
                        currentIndex: controller.activeIndex,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Watch",
                      style: TextStyle(
                        color: controller.getColor(
                          itemIndex: 1,
                          currentIndex: controller.activeIndex,
                        ),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.changeScreen(newIndex: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.folder_fill,
                      color: controller.getColor(
                        itemIndex: 2,
                        currentIndex: controller.activeIndex,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Media Library",
                      style: TextStyle(
                        color: controller.getColor(
                          itemIndex: 2,
                          currentIndex: controller.activeIndex,
                        ),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.changeScreen(newIndex: 3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.line_weight_sharp,
                      color: controller.getColor(
                        itemIndex: 3,
                        currentIndex: controller.activeIndex,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Categories",
                      style: TextStyle(
                        color: controller.getColor(
                          itemIndex: 3,
                          currentIndex: controller.activeIndex,
                        ),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
