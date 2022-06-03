import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MasterKios extends StatelessWidget {
  const MasterKios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Master Kios"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/masterkios/add');
        },
        child: const Text("+"),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('member-kios').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (snapshots.hasData) {
            final datas = snapshots.data!.docs;
            return ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(datas[index]["name"]),
                  subtitle: Text(datas[index]["address"]),
                );
              },
            );
          } else {
            return Text('No Data');
          }
        },
      ),
    );
  }
}
