import 'package:flutter/material.dart';
import 'package:flutter_demo/src/theme/colors.dart';

/// Displays detailed information about a Post when a post is clicked.
class PostDetailsView extends StatelessWidget {
  const PostDetailsView({Key? key}) : super(key: key);

  static const routeName = '/post_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: (Theme.of(context).brightness == Brightness.dark)
            ? const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: FractionalOffset.centerRight,
                  colors: [AppColors.primary, AppColors.gradientLight],
                  stops: [0, 1],
                ),
              )
            : null,
        child: const Center(
          child: Text('More Info'),
        ),
      ),
    );
  }
}
