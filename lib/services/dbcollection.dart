import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oppknocksapp/models/athleteprofileuser.dart';



class DatabaseCollectionService{
  final String uid;

  DatabaseCollectionService({required this.uid});


  //collection ref
  final CollectionReference athletecollection = FirebaseFirestore.instance.collection("athleteUserCollection");

  // I don't think this is used but it could be used later?
  Future updateUserData(String name,String username, String college,String sports,String bio) async {
    return await athletecollection.doc(uid).set({
      'name':name,
      'username':username,
      'college':college,
      'sports':sports,
      'bio':bio,
    });
  }

  // get user doc
  Stream<AthleteUser> get userData {
    return athletecollection.doc(uid).snapshots()
      .map(_athleteDataFromSnapshot);
  }
  
  // convert user data from snapshots
  AthleteUser _athleteDataFromSnapshot(DocumentSnapshot snapshot) {
    return AthleteUser(
      name: snapshot['name'],
      imagePath: snapshot['image'],
      college: snapshot['college'],
      sports: snapshot['sports'],
      username: snapshot['username'],
      bio: snapshot['bio'],
    );
  }
}