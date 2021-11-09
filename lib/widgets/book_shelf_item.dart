import 'package:flutter/material.dart';

// 书架上 item
class BookShelfItem extends StatefulWidget {
  BookShelfItem({Key? key}) : super(key: key);

  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookShelfItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.network(
              "https://img1.doubanio.com/view/subject/l/public/s2241708.jpg",
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("钢铁是怎么样炼成的", maxLines: 1),
                  Text("作者：列夫司机", maxLines: 1),
                  Text("状态：完结", maxLines: 1),
                  Text("最后更新时间：2021-10-23", maxLines: 1),
                  Text("最后更新章节：第二十四章", maxLines: 1),
                  Text(
                    "简介：生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。",
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
