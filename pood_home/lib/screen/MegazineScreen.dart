import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pood_home/model/MagazineModel.dart';

class MegazineScreen extends StatelessWidget {
  MegazineScreen({required this.magazineList, Key? key}) : super(key: key);
  List<MagazineModel> magazineList;

  @override
  Widget build(BuildContext context) {
    // print('magazineList - $magazineList');
    return ListView.builder(
      itemBuilder: (context, index) {
        return CachedNetworkImage(imageUrl: magazineList[index].url.toString());
      },
      itemCount: magazineList.length,
    );
  }
}
