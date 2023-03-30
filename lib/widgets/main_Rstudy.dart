import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/palette.dart';

class Main_Rstudy extends StatefulWidget {
  const Main_Rstudy({super.key});

  @override
  State<Main_Rstudy> createState() => _Main_RstudyState();
}

class _Main_RstudyState extends State<Main_Rstudy> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "Recent Study",
              style: TextStyle(
                  color: Palette.blue5,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Avenir',
                  fontSize: 30),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(22, 5, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Recent study shortcuts",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Palette.blue2,
                ),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const Divider(
            color: Palette.blue2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            children: [
              SizedBox(
                width: 3,
              ),
              SizedBox(
                width: _width * 0.17,
                child: Text(
                  "Not Yet",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: Palette.blue2,
                width: 1.5,
                height: 44,
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: _width * 0.52,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "There are no Studys.",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          color: Palette.blue5,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /**값 있는 버전 */
        // Padding(
        //     padding: const EdgeInsets.fromLTRB(22, 5, 20, 0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Text(
        //           "Recent study shortcuts",
        //           style: TextStyle(
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500),
        //         ),
        //         Icon(
        //           Icons.chevron_right,
        //           color: Palette.blue2,
        //         ),
        //       ],
        //     )),
        // SizedBox(
        //   height: 10,
        // ),
        // /**여기 스터디 파트 시작 VerticalDivider*/
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        //   child: const Divider(
        //     color: Palette.blue2,
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.more,
        //         color: Palette.blue2,
        //         size: 20,
        //       ),
        //       SizedBox(
        //         width: 3,
        //       ),
        //       SizedBox(
        //         width: _width * 0.17,
        //         child: Text(
        //           "Etc..",
        //           overflow: TextOverflow.ellipsis,
        //           style: TextStyle(fontSize: 15),
        //         ),
        //       ),
        //       SizedBox(
        //         width: 10,
        //       ),
        //       Container(
        //         color: Palette.blue2,
        //         width: 1.5,
        //         height: 44,
        //       ),
        //       SizedBox(
        //         width: 20,
        //       ),
        //       SizedBox(
        //         width: _width * 0.52,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "How to make study?",
        //               overflow: TextOverflow.ellipsis,
        //               style: TextStyle(
        //                   fontSize: 15,
        //                   color: Palette.blue5,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //             Text(
        //               "yaho0919",
        //               style: TextStyle(
        //                   fontSize: 14,
        //                   color: Palette.black,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const Divider(
            color: Palette.blue2,
          ),
        ),
      ],
    );
  }
}
