import 'dart:convert';

import 'package:all_events_project/models/event_list_model.dart';
import 'package:http/http.dart' as http;

class GetEventListRepo {
  Future<EventListModel> getEventList(String url) async {
    late EventListModel eventList;
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = json.decode(res.body);     
      eventList = await EventListModel.fromJson(data);
    }

    return eventList;
  }
}
