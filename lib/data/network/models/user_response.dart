class UserResponse {
  UserResponse({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.countryCode,
    required this.isApproved,
    required this.userType,
    required this.companyId,
    required this.otpRequestCount,
    required this.resetPasswordToken,
    required this.resetPasswordExpires,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
  });

  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final int? countryCode;
  final bool? isApproved;
  final String? userType;
  final int? companyId;
  final dynamic otpRequestCount;
  final dynamic resetPasswordToken;
  final dynamic resetPasswordExpires;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? accessToken;

  factory UserResponse.fromJson(Map<String, dynamic> json){
    return UserResponse(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      countryCode: json["countryCode"],
      isApproved: json["isApproved"],
      userType: json["userType"],
      companyId: json["companyId"],
      otpRequestCount: json["otpRequestCount"],
      resetPasswordToken: json["resetPasswordToken"],
      resetPasswordExpires: json["resetPasswordExpires"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      accessToken: json["accessToken"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "countryCode": countryCode,
    "isApproved": isApproved,
    "userType": userType,
    "companyId": companyId,
    "otpRequestCount": otpRequestCount,
    "resetPasswordToken": resetPasswordToken,
    "resetPasswordExpires": resetPasswordExpires,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "accessToken": accessToken,
  };

  @override
  String toString(){
    return "$id, $name, $phone, $email, $countryCode, $isApproved, $userType, $companyId, $otpRequestCount, $resetPasswordToken, $resetPasswordExpires, $createdAt, $updatedAt, $accessToken, ";
  }
}
