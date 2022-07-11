class AddressModel {
  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String _address;
  late String _latitude;
  late String _longitude;
  late String? _contactPersonNumber;

  AddressModel({
    id,
    required addressType,
    contactPersonName,
    address,
    latitude,
    longitude,
    contactPersonNumber,
  }) {
    id = _id;
    addressType = _addressType;
    contactPersonName = _contactPersonName;
    address = _address;
    latitude = _latitude;
    longitude = _longitude;
    contactPersonNumber = _contactPersonNumber;
  }

  String get address => _address;
  String get addressType => _addressType;
  String? get contactPersonName => _contactPersonName!;
  String? get contactPersonNumber => _contactPersonNumber!;
  String get latitude => _latitude;
  String get longitude => _longitude;

  AddressModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addressType = json['address_type'] ?? '';
    _address = json['address'];
    _contactPersonName = json['contact_person_name'] ?? '';
    _contactPersonNumber = json['contact_person_number'] ?? '';
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
}
