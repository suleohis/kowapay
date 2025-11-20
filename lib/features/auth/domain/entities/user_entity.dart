class UserEntity {
  final String id;
  final String fullName;
  final String phone;
  final bool isKycComplete;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.phone,
    this.isKycComplete = false,
  });
}