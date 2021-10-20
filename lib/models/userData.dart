import 'package:payuca_case_study/models/reader.dart';
import 'package:payuca_case_study/models/userParkingData.dart';

class UserData {
  UserData({
    this.name,
    this.email,
    this.phoneNr,
    this.licensePlate,
    required this.parkingData,
  });
  String? name;
  String? email;
  String? phoneNr;
  String? licensePlate;
  UserParkingData parkingData;
}
