import 'package:flutter/material.dart';
import 'package:laundry_app/core/auth/fireauth.dart';
import 'package:laundry_app/modules/models/member.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class ManageMasterKios extends StatelessWidget {
  ManageMasterKios({Key? key}) : super(key: key);

  final _keyForm = GlobalKey<FormState>();
  final fireAuth = FireAuth();

  final _kiosNameController = TextEditingController();
  final _addressKiosController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _descriptionKiosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Kios"),
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
                    fireAuth.createMemberKios(
                        member: Member(
                      name: _kiosNameController.text,
                      address: _addressKiosController.text,
                      description: _descriptionKiosController.text,
                      phoneNumber: _phoneNumberController.text,
                    ));
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
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
