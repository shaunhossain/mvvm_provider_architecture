class Comment {
  Comment({required this.postId,required this.id,required this.name,required this.email,required this.body});
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

 factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    postId : json['postId'],
    id : json['id'],
    name : json['name'],
    email : json['email'],
    body : json['body']
  );

  Map<String, dynamic> toJson()  => {
    'postId' : postId,
    'id' : id,
    'name' : name,
    'email' : email,
    'body' : body
  };
}