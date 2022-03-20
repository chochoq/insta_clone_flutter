import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_insta/src/pages/search/search_focus.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // 이미지가 보이는 영역을 만들기 위함(직사각형모양을 만들기위함)
  List<List<int>> groupBox = [[], [], []];

  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      // groupBox[i % 3].add(1);

      var greedIndex = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;

      if (greedIndex != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }

      groupBox[greedIndex].add(size);
      groupIndex[greedIndex] += size;
    }

    // print(groupBox);
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Get.to(SearchFocus());
              // 검색 페이지에 네비게이터를 넣는 방식
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchFocus(),
                  ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff838383),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            groupBox.length,
            (index) => Expanded(
              child: Column(
                children: List.generate(
                    groupBox[index].length,
                    (idx) => Container(
                          height: Get.width * 0.33 * groupBox[index][idx],
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://i.ytimg.com/vi/ChM7Fw0QMUI/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLA9rd9Rma0wRxtuslEzMYzhD27nlw',
                            fit: BoxFit.cover,
                          ),
                        )).toList(),
              ),
            ),
          ).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            Expanded(
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }
}
