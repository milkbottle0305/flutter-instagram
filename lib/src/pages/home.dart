import 'package:flutter/material.dart';
import 'package:instagram/src/components/avatar_widget.dart';
import 'package:instagram/src/components/image_data.dart';
import 'package:instagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          "https://src.hidoc.co.kr/image/lib/2022/11/15/1668491763670_0.jpg",
          AvatarType.TYPE2,
          size: 70,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          _myStory(),
          const SizedBox(width: 5),
          ...List.generate(
            10,
            (index) => AvatarWidget(
              "https://taegon.kim/wp-content/uploads/2018/05/image-5.png",
              AvatarType.TYPE1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => const PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: ImageData(IconsPath.logo, width: 270),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ImageData(
                  IconsPath.directMessage,
                  width: 50,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            _storyBoardList(),
            _postList(),
          ],
        ));
  }
}
