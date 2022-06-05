import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_app/core/auth/fireauth.dart';
import 'package:laundry_app/modules/bloc/bloc_master/master_bloc.dart';
import 'package:laundry_app/modules/models/member.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:laundry_app/widgets/simplewidget.dart';

class ManageMasterKios extends StatefulWidget {
  String type, idDocs;
  // QueryDocumentSnapshot<Object?> data;

  ManageMasterKios({
    Key? key,
    required this.type,
    this.idDocs = '',
  }) : super(key: key);

  @override
  State<ManageMasterKios> createState() => _ManageMasterKiosState();
}

class _ManageMasterKiosState extends State<ManageMasterKios> {
  final _keyForm = GlobalKey<FormState>();

  final fireAuth = FireAuth();

  final _kiosNameController = TextEditingController();

  final _addressKiosController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _descriptionKiosController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkDefaultValue();
  }

  _checkDefaultValue() {
    if (widget.idDocs != '') {
      final doc = FireAuth.fireCollMKios.doc(widget.idDocs);
      doc.get().then((value) => {
            _kiosNameController.text = value['name'].toString(),
            _addressKiosController.text = value['address'].toString(),
            _descriptionKiosController.text = value['description'].toString(),
            _phoneNumberController.text = value['phoneNumber'].toString(),
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterBloc, MasterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: (widget.type == 'add')
                ? const Text("Tambah Kios")
                : const Text("Perbaharui Kios"),
            actions: (widget.type == 'add')
                ? null
                : <Widget>[
                    IconButton(
                        onPressed: () {
                          // _confirmDelete();
                          SimpleWidget.showDialog2Action(
                            context,
                            'Konfirmasi',
                            'Apakah Anda Yakin Menghapus Data ini ?',
                            () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(false);
                            },
                            () {
                              fireAuth
                                  .deleteMemberKios(idDocs: widget.idDocs)
                                  .then((value) => {
                                        Navigator.popUntil(context,
                                            ModalRoute.withName('/masterkios'))
                                      });
                            },
                          );
                        },
                        icon: Icon(Icons.delete, color: Colors.red))
                  ],
          ),
          body: Form(
            key: _keyForm,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  // kios name
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: TextFormField(
                      controller: _kiosNameController,
                      decoration: InputDecoration(
                        hintText: "Nama Kios",
                        labelText: "Nama Kios Laundry",
                        // contentPadding: EdgeInsets.symmetric(vertical: 30),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama Kios Tidak Boleh Kosong";
                        }
                        return null;
                      },
                    ),
                  ),

                  // kios address
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: TextFormField(
                      controller: _addressKiosController,
                      decoration: InputDecoration(
                        hintText: "Alamat Kios",
                        labelText: "Alamat Kios Laundry",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Alamat Kios Tidak Boleh Kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  // kios phone
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "0813123xxx",
                        labelText: "No. Telepon Kios Laundry",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "No. Telepon Kios Tidak Boleh Kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  // kios description
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: TextFormField(
                      controller: _descriptionKiosController,
                      decoration: InputDecoration(
                        hintText: "Keterangan Kios",
                        labelText: "Keterangan Kios Laundry",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (_keyForm.currentState!.validate()) {
                        Member data = Member(
                          name: _kiosNameController.text,
                          address: _addressKiosController.text,
                          description: _descriptionKiosController.text,
                          phoneNumber: _phoneNumberController.text,
                        );

                        // kalau create baru
                        if (widget.idDocs != '') {
                          fireAuth.updateMemberKios(
                              member: data, idDocs: widget.idDocs);
                        } else if (widget.idDocs == '') {
                          fireAuth.createMemberKios(member: data);
                        }
                      }
                      // final user = FireAuth.auth.currentUser;
                      // final uid = user;
                      // print(uid);

                      // var userDocRef = FirebaseFirestore.instance
                      //     .collection('collection_name')
                      //     .doc('doc_id');
                      // var doc = await userDocRef.get();
                      // if (!doc.exists) {
                      //   print('No such document exista!');
                      // } else {
                      //   print(
                      //     'Document data: $doc.data() ',
                      //   );
                      // }
                    },
                    child: (widget.type == 'add')
                        ? const Text("Simpan")
                        : const Text("Perbarui"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
