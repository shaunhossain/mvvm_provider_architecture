class User {
  final int id;
  final String name;
  final String username;
  User({ required this.id, required this.name, required this.username});

  User.initial()
      : id = 0,
        name = '',
        username = '';

  factory User.fromJson(Map<String, dynamic> json) => User(
    id : json['id'],
    name : json['name'],
    username : json['username']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username
  };
}