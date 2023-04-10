    import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>  getGorkhapatra() async{
  QuerySnapshot<Map<String, dynamic>>  querySnapshot = await  db.collection("gorkhapatra").get();

  return Future.value(querySnapshot.docs);
  

    
  }
}
