import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/home.dart';
import 'package:liferary/utilities/palette.dart';

import '../../API/postController.dart';
import '../../Styles/Styles.dart';
import '../../category/choosehere_category.dart';
import '../../screens/MyPage.dart';
import '../../screens/login.dart';
import '../../widgets/createstudy_modal.dart';

class PostUpdateScreen extends StatefulWidget {
  const PostUpdateScreen({super.key, required this.id});
  final id;
  @override
  State<PostUpdateScreen> createState() => _PostUpdateScreenState();
}

class _PostUpdateScreenState extends State<PostUpdateScreen> {
  void getFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      print("post_u_screen파트 getFile함수 실행한 result.names 출력 : ${result.names}");
      print("post_u_screen파트 getFile함수 실행한 result 출력 : ${result}");
      MainPost_UpdateController.updateselectedFile = result;
      // 파일 사용하기
    } else {
      // 취소 버튼을 눌렀을 때 처리할 코드 작성
    }
  }
  // void getFile() async {
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(allowMultiple: true);
  //   String empty = "";

  //   if (result != null) {
  //     print(result.names);
  //     MainPost_UpdateController.selectedFile = result;
  //     // 파일 사용하기
  //   } else {
  //     // MainPost_UpdateController.mainupdateimagesController =
  //     //     empty as TextEditingController;
  //     // 취소 버튼을 눌렀을 때 처리할 코드 작성
  //   }
  // }

  final SearchController = TextEditingController();

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
      body: FutureBuilder(
        future: LiferaryPost(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
                child: SingleChildScrollView(
                    child: Container(
              child: Column(children: [
                Row(children: [
                  Column(children: [
                    //logo
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 20, 0),
                          child: Container(
                            width: _width * 0.4,
                            height: _height * 0.04,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                            ),
                          ),
                        ),
                        //welcome write
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            "Welcome,\n ${snapshot.data!.nickname}!",
                            style: TextStyle(
                              fontSize: 13,
                              color: Palette.blue,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: _width * 0.74,
                      height: _height * 0.05,
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Palette.blue, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                        child: TextField(
                          controller: SearchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            iconColor: Palette.white,
                            labelText: 'Search',
                            labelStyle: TextStyle(color: Palette.blue),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.blue3,
                          ),
                          child: Icon(
                            Icons.person,
                            size: _width * 0.135,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyPage()),
                            );
                          },
                        ),
                      ),

                      //Logout button
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: InkWell(
                          child: Center(
                              child: Container(
                                  width: _width * 0.2,
                                  height: _height * 0.03,
                                  decoration: BoxDecoration(
                                    color: Palette.blue3,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          fontSize: 15, color: Palette.white),
                                    ),
                                  ))),

                          //Logout 버튼 클릭시 네비게이션 작동
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ]),
                Column(children: [
                  //박스 시작
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tag : ",
                        style: TextStyle(
                          color: Palette.blue4,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ChooseCategory(),
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
                        controller:
                            MainPost_UpdateController.mainupdatetitleController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '${snapshot.data!.title}',
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
                        controller: MainPost_UpdateController
                            .mainupdatecontextController,
                        textAlign: TextAlign.left,
                        autofocus: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '${snapshot.data!.context}',
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 25, 60),
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
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              alignment: Alignment.center,
                              //comment
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
                                    "youtube",
                                    style: TextStyle(
                                        fontSize: 17, color: Palette.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      /**여기부터는 수정안해도됨 */
                      GestureDetector(
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
                                "Update",
                                style: TextStyle(
                                    fontSize: 17, color: Palette.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          MainPost_UpdateController.mainPostPath(
                              widget.id, snapshot.data!.author);
                          print(
                              "postuscreen 파트 widget.id : ${widget.id}, author : ${snapshot.data!.author}");
                          // listPost(0);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HomeScreen())));
                        },
                      )
                    ],
                  ),
                ]),
              ]),
            )));
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Palette.blue,
              ),
            );
          }
        },
      ),
    );
  }
}
