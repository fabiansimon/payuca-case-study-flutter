import 'package:payuca_case_study/models/reader.dart';

class UserParkingData {
  UserParkingData({
    required this.number,
    required this.level,
    required this.readersList,
    required this.address,
    required this.name,
    required this.validFrom,
    required this.validUntil,
  });
  String name;
  String address;
  String validFrom;
  String validUntil;
  int number;
  String level;
  List<Reader> readersList;
}
