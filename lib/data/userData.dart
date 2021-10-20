import 'package:payuca_case_study/models/reader.dart';
import 'package:payuca_case_study/models/userData.dart';
import 'package:payuca_case_study/models/userParkingData.dart';

UserData currentUserData = UserData(
  name: 'John Smith',
  email: 'js@personal.com',
  phoneNr: '+43 677 12345678',
  licensePlate: 'W 123123',
  parkingData: UserParkingData(
    level: '-1 UG',
    number: 100,
    name: 'Garage Wilhelminenstrasse Im Hof die Strasse',
    address: 'Neustiftgasse 13, 1010 Vienna - Austria',
    validFrom: '14. Apr. 2020 00:00',
    validUntil: '14. Apr. 2020 00:20',
    readersList: <Reader>[
      Reader(
        title: 'Garage entry',
        information: 'i1',
        location: 'l1',
        id: 0,
      ),
      Reader(
        title: 'Garage exit',
        id: 1,
      ),
      Reader(
        title: 'Intermediate door',
        information: 'i3',
        location: 'l3',
        id: 2,
      ),
      Reader(
        title: 'Barrier entry',
        information: 'i4',
        location: 'l4',
        id: 3,
      ),
      Reader(
        title: 'Barrier exit',
        information: 'i5',
        location: 'l5',
        id: 4,
      ),
      Reader(
        title: 'Backdoor entry',
        id: 5,
      ),
    ],
  ),
);
