import 'package:flutter/material.dart';
import 'package:flutter_clone_insta/src/components/avatar_widget.dart';
import 'package:flutter_clone_insta/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          thumbPath:
              'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
          type: AvatarType.TYPE2,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: const Center(
                  child: Text('+',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        height: 1.1,
                      )))),
        )
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
                100,
                (index) => AvatarWidget(
                      type: AvatarType.TYPE1,
                      thumbPath:
                          'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
                    )),
          ],
        ));
  }

// Widget _postList() {
//   return
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ImageData(IconsPath.directMessage, width: 50),
              ))
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          // _postList(),
        ],
      ),
    );
  }
}
