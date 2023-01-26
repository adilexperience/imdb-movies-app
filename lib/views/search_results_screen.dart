import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/search_controller.dart';
import 'package:imdb_movies_app/controllers/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../controllers/utils/constants.dart';
import '../models/key_value_model.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SearchController>(
        builder: (context, controller, child) => Column(
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
                children: [
                  InkWell(
                    onTap: () => controller.changeState(IMDB.nonSearchingState),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: TextFormField(
                        controller: controller.searchController,
                        autocorrect: false,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: "TV Shows, movies and more",
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: AppColors.black.withOpacity(0.65),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () => controller.clearSearch(),
                                child: Icon(
                                  Icons.close,
                                  size: 26.0,
                                  color: AppColors.unSelectedIcon
                                      .withOpacity(0.55),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                            ],
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(width: 20.0),
                              Icon(
                                Icons.search,
                                size: 24.0,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                          fillColor: AppColors.unSelectedIcon.withOpacity(0.15),
                        ),
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    "Top results",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: Constants.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  KeyValueModel keyValue = Constants.categories[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          keyValue.value,
                          fit: BoxFit.fill,
                          width: 180.0,
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                keyValue.key,
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              const Text(
                                "Movie genre",
                                style: TextStyle(
                                  color: AppColors.unSelectedIcon,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
