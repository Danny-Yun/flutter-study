import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pood_home/model/EventModel.dart';

class EventScreen extends StatelessWidget {
  EventScreen({required this.eventList, Key? key}) : super(key: key);
  List<EventModel> eventList;

  @override
  Widget build(BuildContext context) {
    // print('eventList - ${eventList}');

    return _listView(size: MediaQuery.of(context).size.width);
  }

  Widget _listView({required double size}) {
    return ListView.builder(
      itemBuilder: (context, index) {
        // print(eventList[index].url.toString());
        return CachedNetworkImage(
          width: size,
          height: size,
          imageUrl: eventList[index].url.toString(),
          filterQuality: FilterQuality.high,
          fit: BoxFit.fitWidth,
          fadeOutDuration: Duration(seconds: 1),
          fadeInDuration: Duration(seconds: 2),
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      },
      itemCount: eventList.length,
    );
  }

  // Widget _listItem({required String imageUrl) {
  //   return
  // }
}
