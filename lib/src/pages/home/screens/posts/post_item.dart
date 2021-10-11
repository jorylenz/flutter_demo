import 'package:flutter/material.dart';
import 'package:flutter_demo/src/theme/colors.dart';

/// This is a single post item that will be displayed in a list of posts
///  imageUrl - The URL for where to get the image to display
///  username - post username
///  text - post text
///  likes - number of likes for this post
///  comments - number of comments for this post
///  dollars - dollars for this post
class UserPost extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String text;
  final String likes;
  final String comments;
  final String dollars;
  static const double edge = 20.0;

  const UserPost(
      {Key? key,
      required this.imageUrl,
      required this.username,
      required this.text,
      required this.likes,
      required this.comments,
      required this.dollars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            _buildBody(),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(
              bottom: 0, top: 15, left: edge, right: edge),
          child: const Divider(
            color: AppColors.iconColor,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 0, top: 15, left: edge, right: edge),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          imageUrl,
          height: 65.0,
          width: 65.0,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildText(),
          _buildButtons(),
        ],
      ),
    );
  }

  // builds the header for the post
  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15.0, right: 5.0),
          child: Text(
            username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // this is the main text for the post
  Widget _buildText() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: edge),
      child: Text(
        text,
        overflow: TextOverflow.clip,
        style: const TextStyle(
            //fontSize: 10,
            ),
      ),
    );
  }

  // build the buttons at the bottom of the post with counts
  Widget _buildButtons() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(Icons.favorite_border, likes),
          _buildIconButton(Icons.chat_bubble_outline, comments),
          _buildIconButton(Icons.attach_money, dollars),
          _buildIconButton(Icons.file_upload, ''),
        ],
      ),
    );
  }

  // helper to make building buttons at the bottom easier
  Widget _buildIconButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.0,
          color: AppColors.iconColor,
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          child: Text(
            text,
            style: const TextStyle(
              //color: Colors.black45,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
