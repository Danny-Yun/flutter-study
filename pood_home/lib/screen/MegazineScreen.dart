import 'package:flutter/material.dart';

class MegazineScreen extends StatefulWidget {
  const MegazineScreen({Key? key}) : super(key: key);

  @override
  _MegazineScreenState createState() => _MegazineScreenState();
}

class _MegazineScreenState extends State<MegazineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('메거진'),
      ),
    );
  }
}
