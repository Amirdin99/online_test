import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool cliked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Card(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Fizika',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  cliked
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.question_mark,
                            color: Colors.red,
                          ))
                      : IconButton(onPressed: () {}, icon: Icon(Icons.star))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: const [
                  Icon(Icons.vpn_key_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Testlar soni:"),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "3",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: const [
                  Icon(Icons.watch_later_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Berilgan vaqt:"),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "20 daqiqa",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {

                    });
                    cliked = true;
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: const [
                        Text("Boshlash"),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
