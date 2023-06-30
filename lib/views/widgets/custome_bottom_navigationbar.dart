import 'package:all_events_project/business_logic/bottom_navigation_bar_cubit/cubit/bottom_navigation_bar_cubit.dart';
import 'package:all_events_project/views/screens/home_screen.dart';
import 'package:all_events_project/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({Key? key}) : super(key: key);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          state is IndexChanged ? index = state.index : null;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<BottomNavigationBarCubit>(context)
                      .changeIndex(0);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: index == 0
                          ? Theme.of(context).highlightColor
                          : Theme.of(context).buttonColor,
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: index == 0
                              ? Theme.of(context).highlightColor
                              : Theme.of(context).buttonColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<BottomNavigationBarCubit>(context)
                      .changeIndex(1);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 30,
                      color: index == 1
                          ? Theme.of(context).highlightColor
                          : Theme.of(context).buttonColor,
                    ),
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: index == 1
                              ? Theme.of(context).highlightColor
                              : Theme.of(context).buttonColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
