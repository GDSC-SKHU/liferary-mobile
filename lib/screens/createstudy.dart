import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/MyPage.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';

import '../API/postController.dart';
import 'home.dart';

class CreateStudyScreen extends StatefulWidget {
  const CreateStudyScreen({super.key});

  @override
  State<CreateStudyScreen> createState() => _CreateStudyScreenState();
}

class _CreateStudyScreenState extends State<CreateStudyScreen> {
  final SearchController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
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
        resizeToAvoidBottomInset: true,
        backgroundColor: Palette.white,
        // appBar: AppBar(automaticallyImplyLeading: false),
        body: SafeArea(child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Container(
                        height: _height * 0.62,
                        width: _width * 0.89,
                        decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: []),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Icon(
                                    Icons.close,
                                    size: _width * 0.09,
                                    color: Palette.blue4,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Container(
                                width: _width * 0.9,
                                decoration: BoxDecoration(
                                  color: Palette.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Palette.blue, width: 1),
                                ),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          '  Please enter your study title.',
                                      labelStyle:
                                          TextStyle(color: Palette.blue2)),
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
                                  border:
                                      Border.all(color: Palette.blue, width: 1),
                                ),
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14),
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          '  Please write your tips contents.',
                                      labelStyle:
                                          TextStyle(color: Palette.blue2)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ),
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  //files
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: _width * 0.23,
                                      height: _height * 0.05,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Palette.blue2, width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                fontSize: 14,
                                                color: Palette.blue2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Container(
                                    width: _width * 0.4,
                                    height: _height * 0.05,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Palette.blue2, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Registration",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Palette.blue2),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}
