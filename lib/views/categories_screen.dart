import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/utils/app_colors.dart';
import 'package:imdb_movies_app/controllers/utils/constants.dart';
import 'package:imdb_movies_app/models/key_value_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            padding: const EdgeInsets.fromLTRB(
              30.0,
              60.0,
              30.0,
              20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Browse categories",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20.0,
                40.0,
                20.0,
                0.0,
              ),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 3.5),
                ),
                itemCount: Constants.categories.length,
                itemBuilder: (context, index) {
                  KeyValueModel keyValue = Constants.categories[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            keyValue.value,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          bottom: 20.0,
                          left: 20.0,
                          child: Text(
                            keyValue.key,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
