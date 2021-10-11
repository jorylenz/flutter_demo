import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/home/screens/posts/posts_list.dart';
import 'package:flutter_demo/src/theme/colors.dart';


/// this builds a widget that displays tabs on the homepage above the posts
class PostScreenTabs extends StatelessWidget {
  const PostScreenTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          decoration: (Theme.of(context).brightness == Brightness.dark) ? const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: FractionalOffset.centerRight,
              colors: [AppColors.primary, AppColors.gradientLight],
              stops: [0, 1],
            ),
          ): null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: AppColors.accent,
                indicatorColor: AppColors.accent,
                tabs: [
                  Tab(icon: Icon(Icons.edit)),
                  Tab(icon: Icon(Icons.ondemand_video_outlined)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Posts(),
                    Icon(Icons.ondemand_video_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
