import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/palette.dart';

class FullView_firstline extends StatefulWidget {
  const FullView_firstline({super.key});

  @override
  State<FullView_firstline> createState() => _FullView_firstlineState();
}

class _FullView_firstlineState extends State<FullView_firstline> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('cooking',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 30),
            Text('fitness',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 30),
            Text('nonsense',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

// Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Column(
//                                                   children: [
//                                                     Row(
//                                                       //food category
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .fromLTRB(
//                                                                   8, 8, 8, 3),
//                                                           child: Column(
//                                                             children: [
//                                                               Text("Food",
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           12,
//                                                                       color: Palette
//                                                                           .blue4,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold)),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),

//                                                     //menu, cook
//                                                     Row(
//                                                       children: [
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ),
//                                                         Container(
//                                                             width:
//                                                                 _width * 0.13,
//                                                             height:
//                                                                 _height * 0.02,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Palette.blue5,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "cook",
//                                                                 style: TextStyle(
//                                                                     fontSize: 9,
//                                                                     color: Palette
//                                                                         .white),
//                                                               ),
//                                                             )),
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ),
//                                                         Container(
//                                                             width:
//                                                                 _width * 0.12,
//                                                             height:
//                                                                 _height * 0.02,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Palette.blue5,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "menu",
//                                                                 style: TextStyle(
//                                                                     fontSize: 9,
//                                                                     color: Palette
//                                                                         .white),
//                                                               ),
//                                                             )),
//                                                       ],
//                                                     ),

//                                                     //realationship category
//                                                     Row(
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .fromLTRB(
//                                                                   8, 8, 8, 3),
//                                                           child: Text(
//                                                               "Relationship",
//                                                               style: TextStyle(
//                                                                   fontSize: 12,
//                                                                   color: Palette
//                                                                       .blue4,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold)),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       children: [
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ),
//                                                         Container(
//                                                             width:
//                                                                 _width * 0.12,
//                                                             height:
//                                                                 _height * 0.02,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Palette.blue5,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "letter",
//                                                                 style: TextStyle(
//                                                                     fontSize: 9,
//                                                                     color: Palette
//                                                                         .white),
//                                                               ),
//                                                             )), //happy end
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ), //간격

//                                                         Container(
//                                                             //comment
//                                                             width:
//                                                                 _width * 0.12,
//                                                             height:
//                                                                 _height * 0.02,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Palette.blue5,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "comment",
//                                                                 style: TextStyle(
//                                                                     fontSize: 9,
//                                                                     color: Palette
//                                                                         .white),
//                                                               ),
//                                                             )),
//                                                       ],
//                                                     ),

//                                                     Row(
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .fromLTRB(
//                                                                   8, 8, 8, 3),
//                                                           child: Text("Health",
//                                                               style: TextStyle(
//                                                                   fontSize: 12,
//                                                                   color: Palette
//                                                                       .blue4,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold)),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       children: [
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ),
//                                                         Container(
//                                                             width:
//                                                                 _width * 0.12,
//                                                             height:
//                                                                 _height * 0.02,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Palette.blue5,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "hospital",
//                                                                 style: TextStyle(
//                                                                     fontSize: 9,
//                                                                     color: Palette
//                                                                         .white),
//                                                               ),
//                                                             )), //hospital end
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ), //간격

//                                                         Container(
//                                                             //exercise
//                                                             width:
//                                                                 _width * 0.12,
//                                                             height:
//                                                                 _height * 0.02,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Palette.blue5,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "exercise",
//                                                                 style: TextStyle(
//                                                                     fontSize: 9,
//                                                                     color: Palette
//                                                                         .white),
//                                                               ),
//                                                             )),
//                                                       ],
//                                                     ),

//                                                     Row(
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .fromLTRB(
//                                                                   8, 8, 8, 3),
//                                                           child: Text(
//                                                               "Nonesense",
//                                                               style: TextStyle(
//                                                                   fontSize: 12,
//                                                                   color: Palette
//                                                                       .blue4,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold)),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       children: [
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ),
//                                                         Container(
//                                                             width:
//                                                                 _width * 0.12,
//                                                             height:
//                                                                 _height * 0.02,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Palette.blue5,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "laugh",
//                                                                 style: TextStyle(
//                                                                     fontSize: 9,
//                                                                     color: Palette
//                                                                         .white),
//                                                               ),
//                                                             )),
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ), //간격

//                                                         Container(
//                                                             //happy
//                                                             width:
//                                                                 _width * 0.12,
//                                                             height:
//                                                                 _height * 0.02,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Palette.blue5,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "happy",
//                                                                 style: TextStyle(
//                                                                     fontSize: 9,
//                                                                     color: Palette
//                                                                         .white),
//                                                               ),
//                                                             )),
//                                                       ],
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                             /**dddd */
//                                             /*여기로 이동*/
//                                             //click here
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 Column(
//                                                   children: [
//                                                     Container(
//                                                       width: _width * 0.3,
//                                                       height: _height * 0.03,
//                                                       decoration: BoxDecoration(
//                                                         color: Palette.blue3,
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10),
//                                                       ),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           Icon(
//                                                             Icons.south,
//                                                             color: Colors.white,
//                                                             size: 16,
//                                                           ),
//                                                           Text(
//                                                             "click here!",
//                                                             style: TextStyle(
//                                                                 fontSize: 16,
//                                                                 color: Palette
//                                                                     .white),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     FullView_Modal(),
//                                                   ],
//                                                 ),
//                                               ],
//                                             )