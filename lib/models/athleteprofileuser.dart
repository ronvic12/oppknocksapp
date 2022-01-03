class AthleteUser
{
  final String imagePath;
  //final String firstname;
  //final String lastname;
  final String name;
  final String college;
  final String sports;
  final String username;
  final String bio;

  const AthleteUser({
    required this.imagePath,
    required this.name,
    //required this.firstname,
    //required this.lastname,
    required this.college,
    required this.sports,
    required this.username,
    required this.bio,
  });
  
  AthleteUser copy({
    String ?imagePath,
    
    String ?name,
    //String ?firstname,
    //String ?lastname,
    String ?college,
    String ?sports,
    String ?username,
    String ?bio,
  })=>
    AthleteUser(
      imagePath: imagePath ?? this.imagePath,
      name:name??this.name,
      //firstname: firstname ?? this.firstname,
      //lastname: lastname ?? this.lastname,
      college: college ?? this.college,
      sports: sports ?? this.sports,
      username: username ?? this.username,
      bio: bio ?? this.bio,
    );
 // for updating the user into profile, loading it?
    static AthleteUser fromJson(Map<String,dynamic>json)=>AthleteUser(
        imagePath:json['imagePath'],
        name:json['name'],
        //firstname:json['firstname'],
        //lastname:json['lastname'],
        college:json['college'],
        sports:json['sports'],
        username:json['username'],
        bio:json['bio'],
    );
  Map<String,dynamic> toJson() =>{
    'imagePath':imagePath,
    'name':name,
    //'firstname':firstname,
    //'lastname':lastname,
    'college':college,
    'sports':sports,
    'username':username,
    'bio':bio,
  };
}