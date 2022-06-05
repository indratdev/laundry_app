import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_app/modules/bloc/bloc_master/master_bloc.dart';
import 'package:laundry_app/modules/screens/master/kios/managemkios.dart';

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
          Navigator.pushNamed(context, '/masterkios/operation');
        },
        child: const Text("+"),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('member-kios').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (snapshots.hasData) {
            final datas = snapshots.data?.docs;
            return ListView.builder(
              itemCount: datas?.length ?? 0,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshots.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    // var data = datas[index];
                    // print(documentSnapshot.id);
                    // Navigator.pushNamed(context, '/masterkios/operation',
                    //     arguments: {'type': 'update'});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageMasterKios(
                            type: 'update',
                            idDocs: documentSnapshot.id.toString(),
                          ),
                        ));
                    // BlocProvider.of<MasterBloc>(context)
                    //     .add(EditMasterKiosEvent(
                    //   idDoc: datas[index].id,
                    //   type: 'update',
                    //   data: datas[index],
                    // ));
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.shade200,
                    ),
                    child: ListTile(
                      title: Text(datas?[index]["name"] ?? ''),
                      subtitle: Text(datas?[index]["address"] ?? ''),
                    ),
                  ),
                );
              },
            );
          } else if (snapshots.hasError) {
            return Text('Error');
          } else {
            return Text('No Data');
          }
        },
      ),
    );
  }
}
