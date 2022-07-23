import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final int postId;
  const Comments({ Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('I am comments '));
  }
}
