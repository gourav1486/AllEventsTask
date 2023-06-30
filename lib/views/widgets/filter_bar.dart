import 'package:all_events_project/business_logic/filter_index/cubit/filter_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBar extends StatelessWidget {
  final String selectedCategory;
  final VoidCallback categoryPressed;
  final String selectedDate;
  FilterBar({
    Key? key,
    required this.categoryPressed,
    required this.selectedCategory,
    required this.selectedDate,
  }) : super(key: key);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.06 * MediaQuery.of(context).size.height,
      width: 0.9 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius:
              BorderRadius.circular(0.03 * MediaQuery.of(context).size.height)),
      child: BlocBuilder<FilterIndexCubit, FilterIndexState>(
        builder: (context, state) {
          state is FilterIndexChanged ? selectedIndex = state.index : null;
          return Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<FilterIndexCubit>(context)
                        .changeFilterIndex(0);
                    categoryPressed();
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.category,
                          color: selectedIndex == 0
                              ? Theme.of(context).highlightColor
                              : Theme.of(context).disabledColor,
                        ),
                        Text(selectedCategory,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == 0
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).disabledColor))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<FilterIndexCubit>(context)
                        .changeFilterIndex(1);
                    selectedDate;
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: selectedIndex == 1
                              ? Theme.of(context).highlightColor
                              : Theme.of(context).disabledColor,
                        ),
                        Text(selectedDate,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == 1
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).disabledColor))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<FilterIndexCubit>(context)
                        .changeFilterIndex(2);
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sort,
                          color: selectedIndex == 2
                              ? Theme.of(context).highlightColor
                              : Theme.of(context).disabledColor,
                        ),
                        Text('Sort',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == 2
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).disabledColor))
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
  
}
