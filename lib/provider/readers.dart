import 'dart:core';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payuca_case_study/models/reader.dart';
import 'package:provider/provider.dart';

class Readers with ChangeNotifier {
  List<Reader> _items = <Reader>[];

  List<Reader> get items {
    return <Reader>[...items];
  }

  Future<void> fetchReadersData() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final List<Reader> readersList = <Reader>[];

    try {
      final QuerySnapshot<Map<String, dynamic>> data = await db
          .collection('users')
          .doc('wMDM68wLVShcQz6E8Vsd')
          .collection('user-garage')
          .doc('06wy0CbQnzXAHVNjyzhr')
          .collection('readers')
          .get();

      for (final QueryDocumentSnapshot<Map<String, dynamic>> item
          in data.docs) {
        readersList.add(
          Reader(
            title: item.data()['name'] as String,
            information: item.data()['information'] as String?,
            location: item.data()['location'] as String?,
            id: item.data()['id'] as int,
            isOpen: item.data()['is-open'] as bool,
            isLoading: false,
          ),
        );
      }
      _items = readersList;
      notifyListeners();

      print(_items);
    } on FirebaseException catch (e) {
      throw e.message!;
    }
  }
}
