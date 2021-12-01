import 'dart:convert';
class FunctionUserMngtModel {
 String User1stName;
 String UserLastName;
 String UserContactNo;
 String UserEmailAddress;
 String UserPosition;
  FunctionUserMngtModel({
    required this.User1stName,
    required this.UserLastName,
    required this.UserContactNo,
    required this.UserEmailAddress,
    required this.UserPosition,
  });

  FunctionUserMngtModel copyWith({
    String? User1stName,
    String? UserLastName,
    String? UserContactNo,
    String? UserEmailAddress,
    String? UserPosition,
  }) {
    return FunctionUserMngtModel(
      User1stName: User1stName ?? this.User1stName,
      UserLastName: UserLastName ?? this.UserLastName,
      UserContactNo: UserContactNo ?? this.UserContactNo,
      UserEmailAddress: UserEmailAddress ?? this.UserEmailAddress,
      UserPosition: UserPosition ?? this.UserPosition,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'User1stName': User1stName,
      'UserLastName': UserLastName,
      'UserContactNo': UserContactNo,
      'UserEmailAddress': UserEmailAddress,
      'UserPosition': UserPosition,
    };
  }

  factory FunctionUserMngtModel.fromMap(Map<String, dynamic> map) {
    return FunctionUserMngtModel(
      User1stName: map['User1stName'],
      UserLastName: map['UserLastName'],
      UserContactNo: map['UserContactNo'],
      UserEmailAddress: map['UserEmailAddress'],
      UserPosition: map['UserPosition'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FunctionUserMngtModel.fromJson(String source) => FunctionUserMngtModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FunctionUserMngtModel(User1stName: $User1stName, UserLastName: $UserLastName, UserContactNo: $UserContactNo, UserEmailAddress: $UserEmailAddress, UserPosition: $UserPosition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FunctionUserMngtModel &&
      other.User1stName == User1stName &&
      other.UserLastName == UserLastName &&
      other.UserContactNo == UserContactNo &&
      other.UserEmailAddress == UserEmailAddress &&
      other.UserPosition == UserPosition;
  }

  @override
  int get hashCode {
    return User1stName.hashCode ^
      UserLastName.hashCode ^
      UserContactNo.hashCode ^
      UserEmailAddress.hashCode ^
      UserPosition.hashCode;
  }
}
