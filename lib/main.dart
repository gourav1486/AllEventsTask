import 'package:all_events_project/business_logic/bottom_navigation_bar_cubit/cubit/bottom_navigation_bar_cubit.dart';
import 'package:all_events_project/business_logic/filter_index/cubit/filter_index_cubit.dart';
import 'package:all_events_project/business_logic/get_categories_bloc/bloc/get_categoreis_bloc.dart';
import 'package:all_events_project/business_logic/get_list_bloc/bloc/get_list_bloc.dart';
import 'package:all_events_project/business_logic/list_grid_cubit.dart/cubit/list_grid_cubit.dart';
import 'package:all_events_project/business_logic/search_category_boc/bloc/search_category_bloc.dart';
import 'package:all_events_project/constants/constants.dart';
import 'package:all_events_project/providers/dark_theme_provider.dart';
import 'package:all_events_project/utils/theme_style.dart';
import 'package:all_events_project/views/screens/home_screen.dart';
import 'package:all_events_project/views/screens/list_screen.dart';
import 'package:all_events_project/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DarkThemeProvider>(
        create: (context) => DarkThemeProvider(),
      ),
      BlocProvider<FilterIndexCubit>(
        create: (context) => FilterIndexCubit(),
      ),
      BlocProvider<GetCategoreisBloc>(
        create: (context) => GetCategoreisBloc(),
      ),
      BlocProvider<GetListBloc>(
        create: (context) => GetListBloc(),
      ),
      BlocProvider<ListGridCubit>(
        create: (context) => ListGridCubit(),
      ),
      BlocProvider<SearchCategoryBloc>(
        create: (context) => SearchCategoryBloc(),
      ),
      BlocProvider<BottomNavigationBarCubit>(
        create: (context) => BottomNavigationBarCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(builder: (context, value, child)  {
        return MaterialApp(
          title: 'All Events',
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          home: const HomePage(),
          routes: <String, WidgetBuilder>{
            LOGIN: (BuildContext context) => Login(),
            HOME_SCREEN: (BuildContext context) => HomePage(),
          },
        );
      }),
    );
  }
}
