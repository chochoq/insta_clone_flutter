import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallback;
  final Function()? cancelCallback;
  const MessagePopup({
    Key? key,
    this.title,
    required this.message,
    required this.okCallback,
    this.cancelCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: Get.width * 0.7,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  Text(title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      )),
                  Text(message!,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: cancelCallback,
                        child: Text('취소'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300],
                          elevation: 0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: okCallback,
                        child: Text('확인'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[300],
                          elevation: 0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
