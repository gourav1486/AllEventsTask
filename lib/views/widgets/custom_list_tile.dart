import 'package:all_events_project/models/event_list_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewTile extends StatelessWidget {
  String thumbnailUrl;
  String eventName;
  String eventDate;
  Venue eventVenue;
  ListViewTile(
      {Key? key,
      required this.eventDate,
      required this.eventName,
      required this.eventVenue,
      required this.thumbnailUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 0.21 * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 0.21 * MediaQuery.of(context).size.height,
                width: 0.35 * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    thumbnailUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 0.45 * MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventName,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).cardColor),
                    ),
                    Text(
                      eventDate,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Theme.of(context).buttonColor),
                    ),
                    Text(
                      '${eventVenue.city == null ? '' : eventVenue.city!.name}, ${eventVenue.state == null ? '' : eventVenue.state!.name}, ${eventVenue.country == null ? '' : eventVenue.country!.name}',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Theme.of(context).buttonColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomGridTile extends StatelessWidget {
  String thumbnailUrl;
  String eventName;
  String eventDate;
  Venue eventVenue;

  CustomGridTile(
      {Key? key,
      required this.eventName,
      required this.eventDate,
      required this.eventVenue,
      required this.thumbnailUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 0.3 * MediaQuery.of(context).size.width,
        height: 0.35 * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 0.2 * MediaQuery.of(context).size.height,
                width: 0.45 * MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    thumbnailUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                eventName,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).cardColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                eventDate,
                style: GoogleFonts.poppins(
                    fontSize: 12, color: Theme.of(context).buttonColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                '${eventVenue.city == null ? '' : eventVenue.city!.name}, ${eventVenue.state == null ? '' : eventVenue.state!.name}, ${eventVenue.country == null ? '' : eventVenue.country!.name}',
                style: GoogleFonts.poppins(
                    fontSize: 12, color: Theme.of(context).buttonColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
