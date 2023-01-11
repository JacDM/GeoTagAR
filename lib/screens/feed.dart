import 'dart:js';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});
  final _samplePic =
      'https://cdn.britannica.com/63/211663-050-A674D74C/Jonny-Bairstow-batting-semifinal-match-England-Australia-2019.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Page"),
      ),
      body: Center(
        child: _postsListView(),
      ),
    );
  }

  Widget _postAuthor() {
    const double avatarD = 44;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: avatarD,
            height: avatarD,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarD / 2),
                child: CachedNetworkImage(
                  imageUrl: _samplePic,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Text(
          'username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    );
  }

  Widget _postPic() {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: _samplePic,
      ),
    );
  }

  Widget _postCaption() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text('hello world'),
    );
  }

  Widget _postView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_postAuthor()],
    );
  }

  Widget _postsListView() {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return _postView();
        });
  }
}
