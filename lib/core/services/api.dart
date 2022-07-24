import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_provider_architecture/core/models/comment.dart';
import 'package:mvvm_provider_architecture/core/models/post.dart';
import 'package:mvvm_provider_architecture/core/models/user.dart';
import 'package:mvvm_provider_architecture/ui/shared/endpoints.dart';

/// The service responsible for networking requests
class Api {
  var client = http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    final response = await client.get(Uri.parse('$baseUrl/users/$userId'));

    // Convert and return
    return userFromJson(response);
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = <Post>[];
    // Get user posts for id

    var response = await client.get(Uri.parse('$baseUrl/posts?userId=$userId'));

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = <Comment>[];

    // Get comments for post
    var response = await client.get(Uri.parse('$baseUrl/comments?postId=$postId'));

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}