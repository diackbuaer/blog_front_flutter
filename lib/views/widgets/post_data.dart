import 'package:api_news/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostData extends StatelessWidget {
  const PostData({
    Key? key, required this.post,
  }) : super(key: key);

  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://picsum.photos/100?image=9'),
          Text(
            post.user!.name!,
            style: GoogleFonts.inter(fontWeight: FontWeight.bold),
          ),
          Text(
            post.user!.email!,
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              post.body!,
              style: GoogleFonts.inter(fontWeight: FontWeight.normal)),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
              IconButton(onPressed: () {}, icon: Icon(Icons.message))
            ],
          )
        ],
      ),
    );
  }
}
