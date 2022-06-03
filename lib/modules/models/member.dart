class Member {
  String idKios, name, address, phoneNumber, description;

  Member({
    this.idKios = '',
    required this.name,
    required this.address,
    this.phoneNumber = '',
    this.description = '',
  });

  Map<String, dynamic> toJson() => {
        "id": idKios,
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "description": description,
      };
}
