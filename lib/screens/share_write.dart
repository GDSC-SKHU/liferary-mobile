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
    "cooking",
    "fitness",
    "nonsense",
    "relationship",
    "programming",
    "language",
    "makeup",
    "music",
    "fashion",
    "leisure",
    "travel",
    "etc.."
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

  void test() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final hasAccessToken = prefs.getBool('hasAccessToken') ?? false;
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
        Navigator.pushNamed(context, '/share_post');
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
    WritePostController.titleController.text;
    //_writePostController.contextController.text;
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
            TabItem(icon: Icons.format_list_bulleted, title: 'Full View'),
            TabItem(icon: Icons.add, title: 'publish'),
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
                                color: Palette.blue4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
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
                                        color: Palette.white,
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
                                            color: Colors.lightGreenAccent,
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
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
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
                                      borderRadius: BorderRadius.circular(14),
                                      // border: Border.all(
                                      //   color: Colors.black26,
                                      // ),
                                      color: Palette.blue2,
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                    iconSize: 30,
                                    iconEnabledColor: Colors.lightGreenAccent,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 200,
                                    padding: null,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Palette.blue3,
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                          child: Container(
                            width: _width * 0.9,
                            decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Palette.blue, width: 2),
                            ),
                            child: TextField(
                              controller: WritePostController.titleController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter your title.',
                                  labelStyle: TextStyle(color: Palette.blue2)),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: _width * 0.9,
                            height: _height * 0.3,
                            decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Palette.blue, width: 2),
                            ),
                            child: TextField(
                              controller: WritePostController.contextController,
                              textAlign: TextAlign.left,
                              autofocus: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write your tips contents',
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
                              child: Container(
                                //comment
                                width: _width * 0.23,
                                height: _height * 0.05,
                                decoration: BoxDecoration(
                                  color: Palette.blue5,
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
                                          color: Palette.white,
                                        )),
                                    Text(
                                      "Files",
                                      style: TextStyle(
                                          fontSize: 14, color: Palette.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    //comment
                                    width: _width * 0.4,
                                    height: _height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Palette.blue,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Palette.blue4)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "youtube",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Palette.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: GestureDetector(
                                child: Container(
                                  width: _width * 0.4,
                                  height: _height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Palette.blue,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Palette.blue4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "registration",
                                        style: TextStyle(
                                            fontSize: 17, color: Palette.white),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
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
