import 'package:flutter/material.dart';
import 'package:pood_home/model/MagazineModel.dart';

class MegazineScreen extends StatelessWidget {
  MegazineScreen({required this.magazineList, Key? key}) : super(key: key);
  List<MagazineModel> magazineList;

  @override
  Widget build(BuildContext context) {
    print('magazineList - $magazineList');
    return Container(
      child: Center(
        child: Text('메거진'),
      ),
    );
  }
}
