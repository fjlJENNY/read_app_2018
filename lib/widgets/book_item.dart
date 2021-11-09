import 'package:flutter/material.dart';

// 书架上
class BookItem extends StatefulWidget {
  BookItem({Key? key}) : super(key: key);

  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.primaries[10].shade100,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.primaries[12].shade100,
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
                  Text(
                    "简介：生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。生死看淡，不服来干。",
                    maxLines: 5,
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
