import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:liferary/screens/dummy/feelings_search.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/main_Rstudy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../model/planet_info.dart';
import '../pages/details_page.dart';
import '../widgets/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static bool hasAccessToken = false;
  final SearchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _logintoggle();
  }

  int _selectedIndex = 0;
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
        if (hasAccessToken == true) {
          Navigator.pushNamed(context, '/share_write');
          break;
        } else {
          Navigator.pushNamed(context, '/plzlogin');
          break;
        }

      case 3:
        Navigator.pushNamed(context, '/mypage');
        break;
      case 4:
        Navigator.pushNamed(context, '/settings');
        break;
      default:
    }
  }

  Future<void> _logintoggle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hasAccessToken = prefs.getBool('hasAccessToken') ?? false;
      var nickname = prefs.getString('nickname') ?? "";
    });
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
    });
    print(hasAccessToken);
  }

  TextEditingController inputController = TextEditingController();
  String inputText = '';
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        return Future(() => false); //뒤로가기 막음
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            actions: [
              hasAccessToken == true
                  ? Row(
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
                            _logout(),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Feelings_Search()),
                            )
                          },
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 14,
                              color: Palette.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            )
                          },
                        ),
                      ],
                    )
            ],
          ),
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
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero, // 여백은 필요 없다.
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("yaho0919"),
                  accountEmail: Text("yaho0919@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                  otherAccountsPictures: [
                    //중복 동그라미 생성 테스트
                    // CircleAvatar(
                    //   backgroundColor: Colors.black,
                    //   backgroundImage: AssetImage('assets/images/logo.png'),
                    // ),
                  ],
                  onDetailsPressed: () => {
                    // 더보기 화살표를 구현
                    print("clicked")
                  },
                  decoration: BoxDecoration(
                      color: Palette.blue2,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                      )), // 빨간 부분을 꾸미기 위한 기능
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Choose a category",
                          style: TextStyle(
                              fontSize: 18,
                              color: Palette.blue,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.task_alt,
                          color: Palette.blue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   height: 1,
                    //   color: Palette.blue,
                    // ),
                  ],
                ),

                ListTile(
                  leading: Icon(
                    Icons.soup_kitchen,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Cooking"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                ListTile(
                  leading: Icon(
                    Icons.fitness_center,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Fitness"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                ListTile(
                  leading: Icon(
                    Icons.mood,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Nonsense"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                //여기까지 3개
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Relationship"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                ListTile(
                  leading: Icon(
                    Icons.terminal,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Programming"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Language"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                //6개
                ListTile(
                  leading: Icon(
                    Icons.brush,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Makeup"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                ListTile(
                  leading: Icon(
                    Icons.headphones,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Music"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                ListTile(
                  leading: Icon(
                    Icons.checkroom,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Fashion"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                //9개
                ListTile(
                  leading: Icon(
                    Icons.sports_esports,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Leisure"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                ListTile(
                  leading: Icon(
                    Icons.flight_takeoff,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Travel"),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
                ListTile(
                  leading: Icon(
                    Icons.more,
                    color: Colors.grey[850],
                  ), // 화면의 첫 부분
                  title: Text("Etc.."),
                  onTap: () => {print("home!!")},
                  // trailing: Icon(Icons.add), // 화면의 끝 부분
                ),
              ],
            ),
          ),
          resizeToAvoidBottomInset: true,
          backgroundColor: Palette.white,
          // appBar: AppBar(automaticallyImplyLeading: false),
          body: SafeArea(child: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      IndexedStack(
                        index: _selectedIndex,
                        // children: listWidgets,
                      ),
                      // listWidgets[_selectedIndex],
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          /**프리뷰 파트 */
                          //파란 컨테이너
                          Container(
                            width: _width * 1,
                            height: _height * 0.55,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 148, 156, 176),
                                      Palette.blue2
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: const [0.3, 0.9])),
                            child: Column(children: [
                              Column(
                                children: <Widget>[
                                  InkWell(
                                    child: SizedBox(
                                      //썸네일 사진과는 상관x
                                      height: _height * 0.55,
                                      width: _width * 0.9, //1번
                                      child: Swiper(
                                        // autoplay: true,
                                        itemCount: planetInfo.length,
                                        itemWidth:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        itemHeight:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        layout: SwiperLayout.TINDER,
                                        pagination: SwiperPagination(
                                            builder: DotSwiperPaginationBuilder(
                                                color: Colors.lightBlueAccent,
                                                activeColor: Colors.white,
                                                activeSize: 12,
                                                space: 4)),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsPage(
                                                          planetInfo:
                                                              planetInfo[
                                                                  index]),
                                                ),
                                              );
                                            },
                                            child: Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    CustomCard(
                                                      name: planetInfo[index]
                                                          .name,
                                                      category:
                                                          planetInfo[index]
                                                              .category,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 25),
                                                  //여기가 카드 섹션 이미지 크기
                                                  child: Hero(
                                                      tag: planetInfo[index]
                                                          .position,
                                                      child: SizedBox(
                                                        width: _width * 0.5,
                                                        height: _height * 0.28,
                                                        child: Image.asset(
                                                            planetInfo[index]
                                                                .iconImage),
                                                      )),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  // Text(data)
                                ],
                              ),
                            ]),
                          ), //Main post cardslider end

                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "More",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Palette.blue5,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                " knowledge with,",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "More",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Palette.blue5,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                " people to share",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            //여백 눌렀을 때 키보드 사라지게 하기.
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: SingleChildScrollView(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: SizedBox(
                                      width: _width * 0.93,
                                      height: _height * 0.05,
                                      child: TextField(
                                        controller: inputController,
                                        decoration: InputDecoration(
                                          hintText: 'Search what you want!',
                                          labelStyle:
                                              TextStyle(color: Palette.blue),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                width: 1, color: Palette.blue),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                width: 1, color: Palette.blue),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                        ),
                                        keyboardType: TextInputType.multiline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          /**여기 스터디 파트 시작 */
                          Main_Rstudy(),

                          /**Recent BorderPost 더미데이터 */
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Recent Feelings Post",
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
                                    "Recent Feelings shortcuts",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                          /**여기 스터디 파트 시작 VerticalDivider*/
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
                                    "이은지",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "What should I do to get in the correct position?",
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: const Divider(
                              color: Palette.blue2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              );
            },
          ))),
    );
  }
}
