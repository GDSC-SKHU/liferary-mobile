import 'package:flutter/material.dart';
import 'package:liferary/category/cat_firstfloor.dart';
import 'package:liferary/category/cat_secondfloor.dart';
import 'package:liferary/category/cat_thirdfloor.dart';
import 'package:liferary/category/select_value.dart';
import 'package:liferary/utilities/palette.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({super.key});

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: _height * 0.4, // 모달 높이 크기
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 200,
                  ), // 모달 좌우하단 여백 크기
                  decoration: const BoxDecoration(
                    color: Palette.blue,
                    //배경색
                    borderRadius: BorderRadius.all(
                      Radius.circular(10), // 모달 전체 라운딩 처리
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: _width * 0.5,
                            height: _height * 0.04,
                            decoration: BoxDecoration(
                              color: Palette.blue3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Choose your category!",
                                style: TextStyle(
                                    fontSize: 13, color: Palette.white),
                              ),
                            )),
                      ),
                      Container(
                        width: _width * 0.87,
                        height: _height * 0.255,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Palette.white),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: Column(
                            children: [
                              Category_firstfloor(),
                              cat_secondfloor(),
                              cat_thirdfloor(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ), // 모달 내부 디자인 영역
                );
              },
              backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
            );
          },
          child: Container(
            alignment: Alignment.center,
            width: _width * 0.5,
            height: _height * 0.045,
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Palette.blue, width: 2),
            ),
            child: Text(
              //왜 안바뀌는거야~
              "${ValueManager.selectedValue}",
              // textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Palette.blue3,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
