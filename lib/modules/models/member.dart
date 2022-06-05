class Member {
  String idKios, name, address, phoneNumber, description;

  Member({
    this.idKios = '',
    required this.name,
    required this.address,
    this.phoneNumber = '',
    this.description = '',
  });

  factory Member.fromJson(Map json) {
    return Member(
      name: json["name"] ?? '',
      address: json["address"] ?? '',
      description: json["description"] ?? '',
      idKios: json["idkios"] ?? '',
      phoneNumber: json["phoneNumber"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": idKios,
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "description": description,
      };
}
