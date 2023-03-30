import 'dart:ffi';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:liferary/API/postController.dart';
import 'package:liferary/category/choosehere_category.dart';
import 'package:liferary/screens/MyPage.dart';
import 'package:liferary/screens/home.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/createstudy_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Share_writeScreen extends StatefulWidget {
  const Share_writeScreen({super.key});

  @override
  State<Share_writeScreen> createState() => _Share_writeScreenState();
}

class _Share_writeScreenState extends State<Share_writeScreen> {
  final SearchController = TextEditingController();
  final List<String> items = [
    "Cooking",
    "Fitness",
    "Nonsense",
    "Relationship",
    "Programming",
    "Language",
    "Makeup",
    "Music",
    "Fashion",
    "Leisure",
    "Travel",
    "Etc.."
  ];
  String? selectedValue;

  void getFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      print(result.names);
      WritePostController.selectedFile = result;
      // 파일 사용하기
    } else {
      // 취소 버튼을 눌렀을 때 처리할 코드 작성
    }
  }

  int _selectedIndex = 2;
  void _bottomnavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/postlist');
        break;
      case 2:
        Navigator.pushNamed(context, '/share_write');
        break;
      case 3:
        Navigator.pushNamed(context, '/mypage');
        break;
      case 4:
        Navigator.pushNamed(context, '/settings');
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    // 최초 1 회 실행 메소드
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Palette.white,
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Palette.blue,
          items: const <TabItem>[
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.format_list_bulleted, title: 'Posts'),
            TabItem(icon: Icons.add, title: 'Publish'),
            TabItem(icon: Icons.person, title: 'My Page'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: _selectedIndex,
          onTap: _bottomnavigation,
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0.0,
          title: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
          actions: [
            Row(
              children: [
                Text(
                  "yaho0919",
                  style: TextStyle(
                      fontSize: 14,
                      color: Palette.blue,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.login),
                  onPressed: () => {
                    // HomeScreen _l
                    // _logout(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    )
                  },
                ),
              ],
            )
          ],
        ),
        body: SafeArea(child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        //박스 시작
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Tag   :   ",
                              style: TextStyle(
                                color: Palette.blue5,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Palette.blue2,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select Category',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Palette.blue2,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: items
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Palette.blue2,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: _height * 0.05,
                                    width: _width * 0.5,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Palette.blue2, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                    iconSize: 28,
                                    iconEnabledColor: Colors.lightBlueAccent,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 200,
                                    padding: null,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Palette.white,
                                    ),
                                    elevation: 8,
                                    offset: const Offset(30, -5),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(40),
                                      thickness:
                                          MaterialStateProperty.all<double>(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all<bool>(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              width: _width * 0.6,
                              child: TextField(
                                controller: WritePostController.titleController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.blue3),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Palette.blue5, width: 2),
                                  ),
                                  hintText: 'Please enter the title.',
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Container(
                            width: _width * 0.9,
                            height: _height * 0.3,
                            decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Palette.blue2, width: 1),
                            ),
                            child: TextField(
                              controller: WritePostController.contextController,
                              textAlign: TextAlign.left,
                              autofocus: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ' Write your tips contents',
                                  labelStyle: TextStyle(color: Palette.blue2)),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          ),
                        ),

                        Row(
                          //files
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: _width * 0.23,
                              height: _height * 0.05,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Palette.blue2, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: getFile,
                                      icon: Icon(
                                        Icons.upload_file,
                                        size: _width * 0.075,
                                        color: Palette.blue2,
                                      )),
                                  Text(
                                    "Files",
                                    style: TextStyle(
                                        fontSize: 14, color: Palette.blue2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CreateModal(),
                                SizedBox(
                                  width: _width * 0.09,
                                ),
                                Container(
                                  // alignment: Alignment.center,
                                  //comment
                                  width: _width * 0.4,
                                  height: _height * 0.05,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Palette.blue2, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 25,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen()),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.play_circle_outline,
                                            size: _width * 0.07,
                                            color: Palette.blue2,
                                          )),
                                      Text(
                                        "Youtube",
                                        style: TextStyle(
                                            fontSize: 15, color: Palette.blue2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: _width * 0.4,
                              height: _height * 0.05,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Palette.blue2, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        WritePostController.postWrite();
                                        print(WritePostController
                                            .contextController.text
                                            .toString());
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    HomeScreen())));
                                      },
                                      icon: Icon(
                                        Icons.menu_book,
                                        size: _width * 0.07,
                                        color: Palette.blue2,
                                      )),
                                  Text(
                                    "Registration",
                                    style: TextStyle(
                                        fontSize: 15, color: Palette.blue2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 100,
                    // ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}
