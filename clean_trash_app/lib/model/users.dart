class User{
  late final String? uid;
  late final int? cardboard;
  late final int? glass;
  late final int? metal;
  late final int? paper;
  late final int? plastic;

  User(
      {this.uid,
      this.cardboard,
      this.glass,
      this.metal,
      this.paper,
      this.plastic});

  factory User.fromJson(Map<String, dynamic> json) =>
      _userFromJson(json);
  Map<String, dynamic> toJson() => _userToJson(this);


}

User _userFromJson(Map<String, dynamic> json) {
  return User(
    uid: ['uid'] as String,
    cardboard: json['cardboard'] as int,
    glass: json['glass'] as int,
    metal: json['metal'] as int,
    paper: json['paper'] as int,
    plastic: json['plastic'] as int
  );
}
// 2
Map<String, dynamic> _userToJson(User instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'cardboard': instance.cardboard,
      'glass': instance.glass,
      'metal': instance.metal,
      'paper': instance.paper,
      'plastic': instance.plastic,
    };

class UserData {
  final String? uid;
  final int? cardboard;
  final int? glass;
  final int? metal;
  final int? paper;
  final int? plastic;

  UserData(
      {this.uid,
      this.cardboard,
      this.glass,
      this.metal,
      this.paper,
      this.plastic});
}
