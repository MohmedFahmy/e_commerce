import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => UserComment(),
      separatorBuilder: (context, index) => Divider(),
      itemCount: 5,
    );
  }
}

class UserComment extends StatelessWidget {
  const UserComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('User name', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(children: [Text('comment...')]),

        Row(
          children: [
            SizedBox(width: 10),
            Text('Reply', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(children: [SizedBox(width: 10), Text('reply...')]),
      ],
    );
  }
}
