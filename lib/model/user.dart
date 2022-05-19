class User {
  int userId;
  String hospitalName;
  String hospitalAddress;
  String hospitalContactNumber;
  int gasQuantity;

  User({
    required this.userId,
    required this.hospitalName,
    required this.hospitalAddress,
    required this.hospitalContactNumber,
    required this.gasQuantity,
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      userId: responseData['id'],
      hospitalName: responseData['hospitalName'],
      hospitalAddress: responseData['hospitalAddress'],
      hospitalContactNumber: responseData['hospitalContactNumber'],
      gasQuantity: responseData['gasQuantity'],
    );
  }
}
