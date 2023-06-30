import 'package:all_events_project/business_logic/get_list_bloc/bloc/get_list_bloc.dart';
import 'package:all_events_project/business_logic/list_grid_cubit.dart/cubit/list_grid_cubit.dart';
import 'package:all_events_project/constants/constants.dart';
import 'package:all_events_project/models/categories_model.dart';
import 'package:all_events_project/views/screens/event_web_view.dart';
import 'package:all_events_project/views/screens/home_screen.dart';
import 'package:all_events_project/views/widgets/app_bar.dart';
import 'package:all_events_project/views/widgets/custom_list_tile.dart';
import 'package:all_events_project/views/widgets/filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatefulWidget {
  final CategoriesModel category;
  ListScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetListBloc>(context)
        .add(FetchEventList(url: widget.category.data));
  }

  bool _isListView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: CustomAppBar(
              onBackPressed: () {
                Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
              },
              title: widget.category.category,
              toggle: true,
            ),
          ),
          Positioned(
            top: 0.1 * MediaQuery.of(context).size.height,
            child: Container(
              height: 0.9 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: Stack(children: [
                Positioned(
                    top: 0.025 * MediaQuery.of(context).size.height,
                    left: 0.05 * MediaQuery.of(context).size.width,
                    child: FilterBar(
                      selectedCategory: widget.category.category,
                      categoryPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage()));
                        ;
                      },
                      selectedDate: 'Date & Time',
                    ))
              ]),
            ),
          ),
          Positioned(
            top: 0.2 * MediaQuery.of(context).size.height,
            child: Container(
              height: 0.9 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: BlocBuilder<GetListBloc, GetListState>(
                builder: (context, state) {
                  return state is ListLoaded
                      ? state.eventList.item.length > 0
                          ? BlocBuilder<ListGridCubit, ListGridState>(
                              builder: (context, cubitState) {
                                cubitState is Toggle
                                    ? _isListView = !cubitState.listView
                                    : null;
                                return _isListView
                                    ? GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisExtent: 325),
                                        itemCount: state.eventList.item.length,
                                        itemBuilder: (context, index) {
                                          var evnetData =
                                              state.eventList.item[index];
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EventWebView(
                                                              eventUrl:
                                                                  evnetData
                                                                      .eventUrl,
                                                              title: evnetData
                                                                  .eventname)));
                                            },
                                            child: CustomGridTile(
                                              eventName: evnetData.eventname,
                                              eventDate:
                                                  evnetData.startTimeDisplay,
                                              eventVenue: evnetData.venue,
                                              thumbnailUrl: evnetData.bannerUrl,
                                            ),
                                          );
                                        })
                                    : ListView.builder(
                                        itemCount: state.eventList.item.length,
                                        itemBuilder: (context, index) {
                                          var evnetData =
                                              state.eventList.item[index];
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EventWebView(
                                                              eventUrl:
                                                                  evnetData
                                                                      .eventUrl,
                                                              title: evnetData
                                                                  .eventname)));
                                            },
                                            child: ListViewTile(
                                              eventName: evnetData.eventname,
                                              eventDate:
                                                  evnetData.startTimeDisplay,
                                              eventVenue: evnetData.venue,
                                              thumbnailUrl: evnetData.bannerUrl,
                                            ),
                                          );
                                        });
                              },
                            )
                          : Center(child: Text('No Events Found'))
                      : SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
