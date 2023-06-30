import 'package:all_events_project/business_logic/get_categories_bloc/bloc/get_categoreis_bloc.dart';
import 'package:all_events_project/business_logic/search_category_boc/bloc/search_category_bloc.dart';
import 'package:all_events_project/constants/constants.dart';
import 'package:all_events_project/views/screens/list_screen.dart';
import 'package:all_events_project/views/widgets/app_bar.dart';
import 'package:all_events_project/views/widgets/custome_bottom_navigationbar.dart';
import 'package:all_events_project/views/widgets/filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetCategoreisBloc>(context).add(FetchCategories());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectCategory();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          child: CustomAppSearchBar(),
        ),
        Positioned(
          top: 0.1 * MediaQuery.of(context).size.height,
          child: Container(
            height: 0.9 * MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Stack(children: [
              Positioned(
                  top: 0.025 * MediaQuery.of(context).size.height,
                  left: 0.05 * MediaQuery.of(context).size.width,
                  child: FilterBar(
                    selectedCategory: 'Category',
                    categoryPressed: () {
                      selectCategory();
                    },
                    selectedDate: 'Date & Time',
                  ))
            ]),
          ),
        ),
        Positioned(
          top: 0.25 * MediaQuery.of(context).size.height,
          child: Container(
            height: 0.6 * MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<SearchCategoryBloc, SearchCategoryState>(
              builder: (context, state) {
                return state is SearchLoaded
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).canvasColor,
                          ),
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing:
                                    0.0, // Spacing between each row
                                crossAxisSpacing:
                                    0.0, // Spacing between each column
                                childAspectRatio:
                                    2.0, // Ratio between the width and height of each item
                              ),
                              itemCount: state.categories.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var categoriesDetails = state.categories[index];
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => ListScreen(
                                                    category:
                                                        categoriesDetails)));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .buttonColor),
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12.0,
                                              left: 20,
                                              right: 20,
                                              bottom: 12),
                                          child: Text(
                                            categoriesDetails.category,
                                            style: GoogleFonts.poppins(
                                                color: Theme.of(context)
                                                    .buttonColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    : SizedBox.shrink();
              },
            ),
          ),
        ),
        Positioned(bottom: 0, left: 0, child: CustomNavigationBar())
      ]),
    );
  }

  selectCategory() {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        builder: (context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                BlocBuilder<GetCategoreisBloc, GetCategoreisState>(
                  builder: (context, state) {
                    return state is CategoriesLoaded
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 0.0, // Spacing between each row
                              crossAxisSpacing:
                                  0.0, // Spacing between each column
                              childAspectRatio:
                                  2.0, // Ratio between the width and height of each item
                            ),
                            itemCount: state.categories.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var categoriesDetails = state.categories[index];
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => ListScreen(
                                                  category:
                                                      categoriesDetails)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12.0,
                                            left: 20,
                                            right: 20,
                                            bottom: 12),
                                        child: Text(
                                          categoriesDetails.category,
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Text(
                            'No Categories Found',
                            style: GoogleFonts.poppins(),
                          );
                  },
                )
              ],
            ),
          );
        });
  }
}
