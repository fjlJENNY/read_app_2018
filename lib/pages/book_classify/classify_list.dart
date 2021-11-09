import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:read_app_2018/models/classify_models/classify_model.dart';

// 分类列表
class ClassifyList extends StatefulWidget {
  ClassifyList({Key? key}) : super(key: key);

  @override
  _ClassifyListState createState() => _ClassifyListState();
}

class _ClassifyListState extends State<ClassifyList> {
  List<ClassifyModel> _classifyList = [];

  Map<String, dynamic> _classifySelected = {};

  @override
  void initState() {
    super.initState();
    _classifyList = [
      ClassifyModel(label: '全部', type: "state"),
      ClassifyModel(label: '连载', type: "state"),
      ClassifyModel(label: '完结', type: "state"),
    ];

    _classifySelected["state"] = '全部';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext innerContext, int innerIndex) {
          return ClassifyItem(
            checked:
                _classifySelected["state"] == _classifyList[innerIndex], // bool
            item: _classifyList[innerIndex],
          );
        },
        itemCount: _classifyList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

// 分类 item
class ClassifyItem extends StatefulWidget {
  ClassifyItem({
    Key? key,
    required this.item,
    required this.checked,
  }) : super(key: key);

  final ClassifyModel item;
  final bool checked;

  @override
  _ClassifyItemState createState() => _ClassifyItemState();
}

class _ClassifyItemState extends State<ClassifyItem> {
  // #
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(20, 100),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        child: Text(
          widget.item.label,
        ),
        style: flatButtonStyle,
      ),
    );
  }
}
