import 'package:all_events_project/business_logic/get_categories_bloc/bloc/get_categoreis_bloc.dart';
import 'package:all_events_project/business_logic/list_grid_cubit.dart/cubit/list_grid_cubit.dart';
import 'package:all_events_project/business_logic/search_category_boc/bloc/search_category_bloc.dart';
import 'package:all_events_project/views/widgets/custom_toggel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppSearchBar extends StatelessWidget {
  CustomAppSearchBar({Key? key}) : super(key: key);
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 0.1 * MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            const Positioned(
              top: 30,
              left: 10,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.blueAccent,
              ),
            ),
            Positioned(
              top: 20,
              left: 40,
              child: BlocBuilder<GetCategoreisBloc, GetCategoreisState>(
                builder: (context, state) {
                  return Container(
                    height: 40,
                    width: 0.8 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: TextField(
                        onChanged: (value) {
                          BlocProvider.of<SearchCategoryBloc>(context).add(
                              Search(
                                  categories: state is CategoriesLoaded
                                      ? state.categories
                                      : [],
                                  searchText: value));
                        },
                        controller: _searchController,
                        style: GoogleFonts.poppins(fontSize: 14),
                        decoration: InputDecoration(
                            focusColor: Theme.of(context).hintColor,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 0.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Theme.of(context).backgroundColor),
                            ),
                            hintText: 'Search',
                            hintStyle: GoogleFonts.poppins(
                                color: Theme.of(context).hintColor,
                                fontSize: 16),
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.search_outlined),
                            ),
                            iconColor: Theme.of(context).hintColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Theme.of(context).backgroundColor),
                            ),
                            fillColor: Theme.of(context).backgroundColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;
  final bool toggle;
  CustomAppBar(
      {Key? key,
      required this.onBackPressed,
      required this.title,
      required this.toggle})
      : super(key: key);

  @override
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  Widget build(BuildContext context) {
    bool _isListView = true;
    return Container(
      height: 0.1 * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: toggle
                          ? Icon(
                              Icons.arrow_back_ios,
                              color: Colors.blueAccent,
                            )
                          : SizedBox.shrink(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  toggle
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Row(
                            children: [
                              Icon(
                                Icons.grid_view,
                                color: Theme.of(context).buttonColor,
                              ),
                              BlocBuilder<ListGridCubit, ListGridState>(
                                builder: (context, state) {
                                  state is Toggle
                                      ? _isListView = state.listView
                                      : null;
                                  return Switch(
                                      value: _isListView,
                                      onChanged: (bool value) {
                                        BlocProvider.of<ListGridCubit>(context)
                                            .toggleView(value);
                                      });
                                },
                              ),
                              Icon(
                                Icons.list_alt_outlined,
                                color: Theme.of(context).buttonColor,
                              )
                            ],
                          )),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
