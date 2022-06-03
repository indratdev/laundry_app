import 'package:flutter/material.dart';

class LaundryApp extends StatelessWidget {
  const LaundryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> menus = {
      "Transaksi": {
        "title": "Transaksi",
        "route": '/transaksi',
        "icon": Icon(Icons.menu),
      },
      "Pengambilan": {
        "title": "Pengambilan",
        "route": '/pengambilan',
        "icon": Icon(Icons.menu),
      },
      "Status": {
        "title": "Status",
        "route": '/status',
        "icon": Icon(Icons.start),
      },
      "Master": {
        "title": "Master",
        "route": '/master',
        "icon": Icon(Icons.start),
      },
      "Add Member": {
        "title": "Add Member",
        "route": '/addmember',
        "icon": Icon(Icons.menu),
      },
    };
    return Scaffold(
        appBar: AppBar(
          title: Text('Owner Laundry'),
        ),
        body: GridView.builder(
          // physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 10.0,

            // mainAxisExtent: 10.0,
          ),
          scrollDirection: Axis.vertical,
          itemCount: menus.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                String routes = menus.entries.elementAt(index).value['route'];
                Navigator.pushNamed(context, routes);
                // print(menus.entries.elementAt(index).value['route']);
              },
              child: Container(
                color: Colors.blue,
                child: Column(children: <Widget>[
                  menus.entries.elementAt(index).value['icon'],
                  Text(
                    menus.entries.elementAt(index).key,
                  ),
                ]),
              ),
            );
          },
        ));
  }
}
