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
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nationalgeographic.com%2Fanimals%2Fmammals%2Ffacts%2Fproboscis-monkey&psig=AOvVaw2pGv-RtLA-SB59RAPyUMYo&ust=1675004064835000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKDK9cjC6vwCFQAAAAAdAAAAABAQ'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //PICTURE PART NOW
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fimages%2Fanimals%2Fmonkey&psig=AOvVaw1uPAi2SVqzCWxVs1s6YEZI&ust=1675064600211000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPDg84Wk7PwCFQAAAAAdAAAAABAe'),
          ),

          //Likes,comments etc.
          Row(
            children: [
              //LIKE
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.red,
                ),
              ),
              //COMMENT
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_rounded,
                ),
              ),
              //SHARE
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
