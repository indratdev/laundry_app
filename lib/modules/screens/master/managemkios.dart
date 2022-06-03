import 'package:flutter/material.dart';

class ManageMasterKios extends StatelessWidget {
  ManageMasterKios({Key? key}) : super(key: key);

  final _keyForm = GlobalKey<FormState>();

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
              TextFormField(
                controller: _kiosNameController,
                decoration: InputDecoration(
                  hintText: "Nama Kios",
                  labelText: "Nama Kios Laundry",
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
              // kios address
              TextFormField(
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
              // kios phone
              TextFormField(
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
              // kios description
              TextFormField(
                controller: _descriptionKiosController,
                decoration: InputDecoration(
                  hintText: "Keterangan Kios",
                  labelText: "Keterangan Kios Laundry",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    print('validate success');
                  }
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
