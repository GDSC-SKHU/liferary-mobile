import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/palette.dart';

class Prevoius_Next_Button extends StatefulWidget {
  const Prevoius_Next_Button({super.key});

  @override
  State<Prevoius_Next_Button> createState() => _Prevoius_Next_ButtonState();
}

class _Prevoius_Next_ButtonState extends State<Prevoius_Next_Button> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: _width * 0.34,
              height: 40,
              decoration: BoxDecoration(
                  color: Palette.blue, borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                  ),
                  Text(
                    'Prevoius Page',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            onTap: () {
              //   setState(() {
              //     if (postNumber != 0) {
              //       postNumber = postNumber - 1;
              //       postListView = listPost(postNumber);

              //       print('$postNumber');
              //     } else {
              //       FToast().showToast(
              //           child: Container(
              //               alignment: Alignment.center,
              //               width: 200,
              //               decoration: BoxDecoration(
              //                   borderRadius:
              //                       BorderRadius
              //                           .circular(25),
              //                   color: ColorStyle
              //                       .mainColor),
              //               child: Text(
              //                 '처음 페이지 입니다.',
              //                 style: TextStyle(
              //                     color: Colors.white),
              //               )));
              //     }
              //   });
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: _width * 0.34,
              height: 40,
              decoration: BoxDecoration(
                  color: Palette.blue, borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next Page',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            onTap: () {
              // setState(() {
              //   if (snapshot.data!.last == false) {
              //     postNumber = postNumber + 1;
              //     postListView = listPost(postNumber);

              //     print('$postNumber');
              //   } else {
              //     FToast().showToast(
              //         child: Container(
              //             alignment: Alignment.center,
              //             width: 200,
              //             decoration: BoxDecoration(
              //                 borderRadius:
              //                     BorderRadius
              //                         .circular(25),
              //                 color: ColorStyle
              //                     .mainColor),
              //             child: Text(
              //               '마지막 페이지 입니다.',
              //               style: TextStyle(
              //                   color: Colors.white),
              //             )));
              //   }
              // });
            },
          ),
        ],
      ),
    ); //하단 페이지 이동 버튼들 끝
  }
}
