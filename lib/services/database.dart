import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oppknocksapp/models/business.dart';

class DatabaseService {
  /*
  final String uid;
  DatabaseService({required this.uid});
  */

  // collection reference for businesses
  final CollectionReference businessCollection =
      FirebaseFirestore.instance.collection('businesses');

  // business list from snapshot
  List<Business> _businessListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Business(
        name: doc['name'] ?? '',
        discount: doc['discount'] ?? '',
        imageURL: doc['imageURL'] ?? '',
      );
    }).toList();
  }

  // get businesses stream
  Stream<List<Business>> get businesses {
    return businessCollection.snapshots().map(_businessListFromSnapshot);
  }

  /*
  Future updateUserData(String name, String discount, String signupDate) async {
    return await businessCollection.doc(uid).set({
      'Name': name,
      'Discount': discount,
      'Sign Up Date': signupDate,
    });
  }
  */

}
