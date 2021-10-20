import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/data/userData.dart';
import 'package:payuca_case_study/models/reader.dart';
import 'package:payuca_case_study/models/userData.dart';
import 'package:payuca_case_study/models/userParkingData.dart';
import 'package:payuca_case_study/screens/ReaderDetail.dart';
import 'package:payuca_case_study/widgets/CustomSnackBar.dart';
import 'package:payuca_case_study/widgets/ParkingSpaceTile.dart';
import 'package:payuca_case_study/widgets/ReaderTile.dart';
import '../models/userData.dart';

class GarageScreen extends StatefulWidget {
  @override
  GarageScreenState createState() => GarageScreenState();
}

class GarageScreenState extends State<GarageScreen> {
  bool _isLoading = false;
  bool _isInit = false;

  // async function updateReader(id) {
  //   const db = firestore().collection('users').doc('wMDM68wLVShcQz6E8Vsd');
  //   const readerData = await db
  //     .collection('user-garage')
  //     .doc('06wy0CbQnzXAHVNjyzhr')
  //     .collection('readers')
  //     .where('id', '==', id)
  //     .get();

  //   const readerId = readerData.docs[0].id;

  //   try {
  //     await db
  //       .collection('user-garage')
  //       .doc('06wy0CbQnzXAHVNjyzhr')
  //       .collection('readers')
  //       .doc(readerId)
  //       .update({
  //         'is-open': true,
  //       });

  //     console.log('finished');
  //   } catch (error) {
  //     onToggleSnackBar();
  //     console.error(error);
  //   }
  // }

  Future<void> updateReader(int id) async {
    final DocumentReference<Map<String, dynamic>> db = FirebaseFirestore
        .instance
        .collection('users')
        .doc('wMDM68wLVShcQz6E8Vsd');

    try {
      final QuerySnapshot<Map<String, dynamic>> readerData = await db
          .collection('user-garage')
          .doc('06wy0CbQnzXAHVNjyzhr')
          .collection('readers')
          .where('id', isEqualTo: id)
          .get();

      final String readerId = readerData.docs[0].id;

      await db
          .collection('user-garage')
          .doc('06wy0CbQnzXAHVNjyzhr')
          .collection('readers')
          .doc(readerId)
          .update(
        <String, dynamic>{
          'is-open': true,
        },
      );

      print('finished');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: CustomSnackBar(
            string: e.toString(),
            type: 'error',
          ),
        ),
      );
      print(e);
    }
  }

  Future<void> fetchData() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    List<Reader> readersList = <Reader>[];

    setState(() {
      _isLoading = true;
    });

    try {
      final DocumentSnapshot<Map<String, dynamic>> personalInfo =
          await db.collection('users').doc('wMDM68wLVShcQz6E8Vsd').get();

      final QuerySnapshot<Map<String, dynamic>> parkingData = await db
          .collection('users')
          .doc('wMDM68wLVShcQz6E8Vsd')
          .collection('user-garage')
          .get();

      final QuerySnapshot<Map<String, dynamic>> readersData = await db
          .collection('users')
          .doc('wMDM68wLVShcQz6E8Vsd')
          .collection('user-garage')
          .doc('06wy0CbQnzXAHVNjyzhr')
          .collection('readers')
          .get();

      // add each doc to readers
      for (final QueryDocumentSnapshot<Map<String, dynamic>> item
          in readersData.docs) {
        readersList.add(
          Reader(
            title: item.data()['name'] as String,
            information: item.data()['information'] as String?,
            location: item.data()['location'] as String?,
            id: item.data()['id'] as int,
          ),
        );
      }

      currentUserData = UserData(
        name: personalInfo.data()!['name'] as String,
        email: personalInfo.data()!['email'] as String,
        phoneNr: personalInfo.data()!['phone-nr'] as String,
        licensePlate: personalInfo.data()!['license_plate'] as String,
        parkingData: UserParkingData(
          level: parkingData.docs[0].data()['location']!['level'] as String,
          number: parkingData.docs[0].data()['location']!['number'] as int,
          name: parkingData.docs[0].data()['title'] as String,
          address: parkingData.docs[0].data()['address'] as String,
          validFrom: parkingData.docs[0].data()['times']['from'].toString(),
          validUntil: parkingData.docs[0].data()['times']['until'].toString(),
          readersList: readersList,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    if (!_isInit) {
      fetchData();
      setState(() {
        _isInit = true;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return Material(
      color: screenBackground,
      child: !_isLoading
          ? RefreshIndicator(
              onRefresh: () => fetchData(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 32.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Icon(CupertinoIcons.gear_alt_fill),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        currentUserData.parkingData.name,
                        style: _textTheme.headline2!.merge(
                          const TextStyle(color: black),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'My parking space',
                        style: _textTheme.headline4!.merge(
                          const TextStyle(color: black),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ParkingSpaceTile(
                        level: currentUserData.parkingData.level,
                        number: currentUserData.parkingData.number.toString(),
                        onTap: () =>
                            Navigator.pushNamed(context, 'DetailScreen'),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Readers',
                        style: _textTheme.headline4!.merge(
                          const TextStyle(color: black),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Flexible(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                currentUserData.parkingData.readersList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Reader reader = currentUserData
                                  .parkingData.readersList[index];
                              return ReaderTile(
                                title: reader.title,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ReaderDetail(
                                      reader: reader,
                                    ),
                                  ),
                                ),
                                onTapButton: () => updateReader(reader.id),
                              );
                            },
                            separatorBuilder: (_, int index) {
                              return const Divider(
                                color: lightGrey,
                                thickness: 1,
                                height: 0,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}
