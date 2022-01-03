import 'package:cloud_firestore/cloud_firestore.dart';

class BUserService{


  final CollectionReference businessUserCollection=
  FirebaseFirestore.instance.collection('businessUsers');



}

