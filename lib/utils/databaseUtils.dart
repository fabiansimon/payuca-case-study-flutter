import 'package:firebase_core/firebase_core.dart';

class DatabaseUtils {
  DatabaseUtils._();

  static Future<void> updateReader(String id) async {}

  // static Future<bool> validLobby(BuildContext context, String lobbyId) async {
  //   final FirebaseFirestore db = FirebaseFirestore.instance;

  //   try {
  //     if (lobbyId.isEmpty) return false;

  //     final DocumentSnapshot<Map<String, dynamic>> data =
  //         await db.collection('lobbies').doc(lobbyId.toUpperCase()).get();

  //     if (data.exists && data.data()!['state'] == 'lobby') return true;
  //   } catch (e) {
  //     showOkAlertDialog(
  //       context: context,
  //       message: e.toString(),
  //     );
  //   }

  //   return false;
  // }
}
