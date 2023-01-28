import 'package:flutter/material.dart';

class postCard extends StatelessWidget {
  const postCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nationalgeographic.com%2Fanimals%2Fmammals%2Ffacts%2Fproboscis-monkey&psig=AOvVaw2pGv-RtLA-SB59RAPyUMYo&ust=1675004064835000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKDK9cjC6vwCFQAAAAAdAAAAABAQ'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
