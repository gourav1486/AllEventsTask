import 'package:all_events_project/providers/dark_theme_provider.dart';
import 'package:all_events_project/views/screens/home_screen.dart';
import 'package:all_events_project/views/widgets/app_bar.dart';
import 'package:all_events_project/views/widgets/custome_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: CustomAppBar(
              onBackPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              title: 'Profile',
              toggle: false,
            ),
          ),
          Positioned(
            top: 0.1 * MediaQuery.of(context).size.height,
            child: Container(
              height: 0.9 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Dark Mode',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Switch(
                        value: themeChange.darkTheme,
                        onChanged: (value) {
                          themeChange.darkTheme = value;
                        }),
                  )
                ],
              ),
            ),
          ),
          Positioned(bottom: 0, left: 0, child: CustomNavigationBar())
        ],
      ),
    );
  }
}
