import 'package:flutter/material.dart';

enum TYPE { header, item, divider, subTitle }

class BaseModel {
  TYPE type;
  BaseModel(this.type);
}

class HeaderModel extends BaseModel {
  HeaderModel(this.widget) : super(TYPE.header);

  Widget widget;
}

class ItemModel extends BaseModel {
  ItemModel(this.widget) : super(TYPE.item);
  Widget widget;
}

class SubTitleModel extends BaseModel {
  SubTitleModel(this.widget) : super(TYPE.subTitle);
  Widget widget;
}

class DividerModel extends BaseModel {
  DividerModel() : super(TYPE.divider);
  Widget widget =
      Divider(height: 20, thickness: 1, color: Colors.grey.shade400);
}
