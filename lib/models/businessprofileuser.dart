// add firebase right here later and dart.

class BusinessUser {
  final String businessimagePath;
  final String businessName;
  final String businessAddress;
  final String businessBio;
  final String businessEmail;
  final String businessPhoneNumber; // can change into int later

  const BusinessUser({
    required this.businessimagePath,
    required this.businessName,
    required this.businessAddress,
    required this.businessBio,
    required this.businessEmail,
    required this.businessPhoneNumber,
  });

  BusinessUser copybusinessprofile({
    String? businessimagePath,
    String? businessName,
    String? businessAddress,
    String? businessBio,
    String? businessEmail,
    String? businessPhoneNumber,
  }) {
    return BusinessUser(
      businessimagePath: businessimagePath ?? this.businessimagePath,
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      businessBio: businessBio ?? this.businessBio,
      businessEmail: businessEmail ?? this.businessEmail,
      businessPhoneNumber: businessPhoneNumber ?? this.businessPhoneNumber,
    );
  }

  static BusinessUser fromJson(Map<String, dynamic> json) => BusinessUser(
        businessimagePath: json['businessimagePath'],
        businessName: json['businessName'],
        businessAddress: json['businessAddress'],
        businessBio: json['businessBio'],
        businessEmail: json['businessEmail'],
        businessPhoneNumber: json['businessPhoneNumber'],
      );

  Map<String, dynamic> toJson() => {
        'businessimagePath': businessimagePath,
        'businessName': businessName,
        'businessAddress': businessAddress,
        'businessBio': businessBio,
        'businessEmail': businessEmail,
        'businessPhoneNumber': businessPhoneNumber,
      };
}

