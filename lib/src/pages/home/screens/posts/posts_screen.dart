import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/home/screens/posts/posts_tabs.dart';
import 'package:flutter_demo/src/pages/home/screens/posts/posts_top_button_row.dart';

/// this is the main screen for displaying posts.
/// it combines top buttons, post tabs and the posts into one widget.
Widget getPostsScreen(BuildContext context) {
  return Column(
    children: [
      getTopButtonRow(context),
      const Expanded(child: Center(child: PostScreenTabs())),
    ],
  );
}
