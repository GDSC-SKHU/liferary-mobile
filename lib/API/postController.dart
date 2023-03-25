import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../category/select_value.dart';
import 'authController.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**post 리스트 조회 */
class getPostList {
  Future getPost() async {
    const url = 'http://api-liferary.duckdns.org/api/main';

    String? token = await storage.read(key: 'accessToken');

    var response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer ${token}'},
    );
    if (response.statusCode == 200) {
      print(token);
      print(response.body);
    } else {
      print(response.body);
    }
  }
}

/**메인포스트 create */
class WritePostController {
  static TextEditingController titleController =
      TextEditingController(); //titleController
  static TextEditingController categoryController =
      TextEditingController(); //categoryController
  static TextEditingController contextController =
      TextEditingController(); //contextController
  static TextEditingController imagesController =
      TextEditingController(); //imagesController
  static TextEditingController videoController =
      TextEditingController(); //videoController
  static FilePickerResult selectedFile = new FilePickerResult([]);
  // static ImagePicker _picker = ImagePicker();

  // static Imagepicker() async {
  //   final List<XFile>? images = await _picker.pickMultiImage();
  // }

  static postWrite() async {
    const url = 'http://api-liferary.duckdns.org/api/main/new';
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "accept": "application/json",
      'Authorization': 'Bearer ${prefs.getString('accessToken')}',
      "Content-Type": "multipart/form-data",
    };
    Map<String, String> data = {
      "title": titleController.text,
      "category": ValueManager.selectedValue,
      "context": contextController.text,
      "video": "videoController.text"
    };

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields.addAll(data);

    for (var i = 0; i < selectedFile.count; i++) {
      var file = await http.MultipartFile.fromPath(
          'images', selectedFile.files[i].path!,
          contentType: MediaType('image', 'png'));
      request.files.add(file);
      // print(file.contentType);
    }

    // Send the request
    http.StreamedResponse response = await request.send();

    // Handle the response
    if (response.statusCode == 200) {
      // Request successful
      print(await response.stream.bytesToString());
      print(request.fields);
    } else {
      // Request failed
      print(response.statusCode);
    }
  }
}

/**!!!메인게시글 수정!!! */
class MainPost_UpdateController {
  static TextEditingController mainupdatetitleController =
      TextEditingController(); //titleController
  static TextEditingController mainupdatecategoryController =
      TextEditingController(); //categoryController
  static TextEditingController mainupdatecontextController =
      TextEditingController(); //contextController
  static TextEditingController mainupdateimagesController =
      TextEditingController(); //imagesController
  static TextEditingController mainupdatevideoController =
      TextEditingController(); //videoController
  static TextEditingController mainupdateimageController =
      TextEditingController(); //videoController
  static FilePickerResult updateselectedFile = new FilePickerResult([]);
  static Future mainPostPath(id, author) async {
    var url = 'http://api-liferary.duckdns.org/api/main/post?id=${id}';
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? "";
    Map<String, String> headers = {
      "accept": "application/json",
      'Authorization': 'Bearer ${prefs.getString('accessToken')}',
      "Content-Type": "multipart/form-data",
    };
    Map<String, String> data = {
      "title": mainupdatetitleController.text,
      "category": ValueManager.selectedValue,
      "context": mainupdatecontextController.text,
      "video": "videoController.text"
    };
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields.addAll(data);

    for (var i = 0; i < updateselectedFile.count; i++) {
      var file = await http.MultipartFile.fromPath(
          'images', updateselectedFile.files[i].path!,
          contentType: MediaType('image', 'png'));
      request.files.add(file);
      // print("지금 여기 : ${file.contentType}");
      //ex image/png 와 같은 것을 출력
    }

    // Send the request
    http.StreamedResponse response = await request.send();

    // Handle the response
    if (response.statusCode == 200) {
      // Request successful
      print("await response 시작 : ");
      print(await response.stream.bytesToString());
      print("현재 body : ${request.fields}");
    } else {
      // Request failed
      print("수정실패 : ");
      print(response.statusCode);
    }
  }
}

// /**게시글 상세 정보 */
class PostController {
  static Future<PostModel> getUserPost(int id) async {
    print("id = ${id}");
    var prefs = await SharedPreferences.getInstance();
    final url =
        Uri.parse('http://api-liferary.duckdns.org/api/main/post?id=${id}');

    PostModel postModel;

    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${prefs.getString('accessToken')}',
        "Content-Type": "application/json",
        'Charset': 'utf-8',
      },
    );

    print('게시글 단건조회 post컨트롤러 : ${response.body}');
    if (response.statusCode == 200) {
      // Request successful
      print("성공");
    } else {
      // Request failed
      print("실패");
      print(response.statusCode);
    }
    var data = json.decode(utf8.decode(response.bodyBytes));
    postModel = PostModel(
      title: data['title'],
      nickname: data['nickname'],
      category: data['category'],
      context: data['context'],
      images: data['images'],
      video: data['video'],
      modifiedDate: data['modifiedDate'],
    );
    return postModel;
  }
}

/**게시글 상세 정보 모델 클래스 */
class PostModel {
  int? id;
  String? title;
  String? author;
  String? nickname;
  String? category;
  String? context;
  List<dynamic>? images;
  String? video;
  String? modifiedDate;

  PostModel(
      {this.id,
      this.title,
      this.author,
      this.nickname,
      this.category,
      this.context,
      this.images,
      this.video,
      this.modifiedDate});
}

/**게시글 리스트 */
Future<PostList> listPost(number) async {
  var url = 'http://api-liferary.duckdns.org/api/main/page/all';

  String? token = await storage.read(key: 'Token');

  var response = await http.get(
    Uri.parse(url + "?page=${number}"),
    headers: {'Authorization': 'Bearer ${token}'},
  );
  if (response.statusCode == 200) {
    print(token);
    print('게시글 목록${utf8.decode(response.bodyBytes)}');
  } else {
    print(response.body);
  }

  final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

  return new PostList.fromJson(jsonResponse);
}

/**게시글 리스트 모델 클래스 */
class PostList {
  //게시물 리스트 모델 클래스
  List<Content>? content;
  bool? last;

  PostList({this.content, this.last});

  PostList.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['postList'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['last'] = this.last;
    return data;
  }
}

/**댓글 */
class Content {
  String? title;
  String? nickname;
  String? category;
  String? context;
  String? images;
  String? video;
  String? modifiedDate;

  late int id;

  Content({
    this.title,
    this.nickname,
    this.category,
    this.context,
    this.images,
    this.video,
    this.modifiedDate,
  });
  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    nickname = json['nickname'];
    category = json['category'];
    context = json['context'];
    images = json['images'];
    video = json['video'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['nickname'] = this.nickname;
    data['category'] = this.category;
    data['context'] = this.context;
    data['images'] = this.images;
    data['video'] = this.video;
    data['modifiedDate'] = this.modifiedDate;

    return data;
  }
}

////여기부터 다시하자!
/**댓글 조회, 등록 클래스 */
class PostComment {
  static TextEditingController commentController =
      TextEditingController(); //commentController
  static Future commentWrite(id) async {
    /**댓글 등록 */
    var url = 'http://moida-skhu.duckdns.org/post/${id}/comments/new';

    String? token = await storage.read(key: 'Token');
    String? userID = await storage.read(key: 'userID');

    var response = await http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json",
          'Charset': 'utf-8',
        },
        body: jsonEncode({
          "postId": id,
          "writer": userID,
          "context": commentController.text
        }));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }

  static Future<CommentList?> commentRead(id) async {
    /**댓글 조회 */
    var url = 'http://moida-skhu.duckdns.org/post/${id}/comments';

    String? token = await storage.read(key: 'Token');
    String? userID = await storage.read(key: 'userID');

    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${token}',
        "Content-Type": "application/json",
        'Charset': 'utf-8',
      },
    );
    print('댓글 목록 ${response.body}');
    CommentList? commentList;
    final jsonResponse =
        json.decode(utf8.decode(response.bodyBytes)); //받은 정보를 json형태로 decode
    if (response.statusCode == 200) {
      commentList = CommentList.fromJson(jsonResponse);
    } else {
      commentList = null;
    }

    return commentList;
  }
}

/**댓글 리스트 모델 */
class CommentList {
  List<userComment> comments;

  CommentList({
    required this.comments,
  });

  factory CommentList.fromJson(List<dynamic> json) {
    List<userComment> commentsList = <userComment>[];
    commentsList = json.map((i) => userComment.fromJson(i)).toList();

    return new CommentList(comments: commentsList);
  }
}
// class CommentList{
//   List<userComment> comments;
//   CommentList({
//     required this.comments,
//   });

//   factory CommentList.fromJson(Map<String, dynamic> json) {
//     this.comments = json['comments'].entries.map((e) => userComment.fromJson(e.value)).toList();
//   }
// }

/**댓글 구성 요소 모델 */
class userComment {
  String? writer;
  String? context;
  String? nickname;
  int? id;
  List<ChildComments>? childComments;
  String? createdDate;

  userComment(
      {this.writer, this.context, this.id, this.childComments, this.nickname});
  // factory userComment.fromJson(Map<String, dynamic> json) {
  //   return new userComment(
  //       writer: json['writer'], context: json['context'], id: json['id']);
  // }
  userComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];

    writer = json['writer'];
    context = json['context'];
    createdDate = json['createdDate'];

    if (json['childComments'] != null) {
      childComments = <ChildComments>[];
      json['childComments'].forEach((v) {
        childComments!.add(new ChildComments.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['writer'] = this.writer;
    data['context'] = this.context;

    if (this.childComments != null) {
      data['childComments'] =
          this.childComments!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;

    return data;
  }
}

class ChildComments {
  int? id;
  int? postId;
  String? writer;
  String? context;
  String? nickname;
  int? parentCommentId;

  String? createdDate;
  String? modifiedDate;

  ChildComments(
      {this.id,
      this.postId,
      this.writer,
      this.context,
      this.parentCommentId,
      this.createdDate,
      this.modifiedDate,
      this.nickname});

  ChildComments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    writer = json['writer'];
    context = json['context'];
    parentCommentId = json['parentCommentId'];
    nickname = json['nickname'];

    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['postId'] = this.postId;
    data['writer'] = this.writer;
    data['context'] = this.context;
    data['parentCommentId'] = this.parentCommentId;
    data['nickname'] = this.nickname;
    data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    return data;
  }
}

class PostChildComment {
  static TextEditingController childCommentController =
      TextEditingController(); //commentController
  static Future childCommentWrite(postId, index) async {
    /**댓글 등록 */
    var url = 'http://moida-skhu.duckdns.org/post/${postId}/comments/new';

    String? token = await storage.read(key: 'Token');
    String? userID = await storage.read(key: 'userID');

    var response = await http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json",
          'Charset': 'utf-8',
        },
        body: jsonEncode({
          "postId": postId,
          "writer": userID,
          "context": childCommentController.text,
          "parentCommentId": index
        }));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }
}

/**게시글 타입 별 */
Future<PostList> listTypePost(ctg, postNum) async {
  var url = 'http://moida-skhu.duckdns.org/post/type/${ctg}/${postNum}';

  String? token = await storage.read(key: 'Token');

  var response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer ${token}'},
  );
  if (response.statusCode == 200) {
    print(token);
    print('타입별 게시글 목록${response.body}');
  } else {
    print(response.body);
  }

  final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

  return new PostList.fromJson(jsonResponse);
}

/**게시글 삭제 */
Future<void> deletePost(id) async {
  var url = 'http://api-liferary.duckdns.org/api/main/post?id=${id}';
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken') ?? "";

  // String? token = await storage.read(key: 'Token');

  var response = await http.delete(
    Uri.parse(url),
    headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer ${accessToken}'
    },
  );
  if (response.statusCode == 200) {
    print('삭제 성공 : ${response.body}');
  } else {
    print("삭제 실패 : ${response.body}");
  }
}

/**게시글 수정 get파트 */
Future<MainPostModel_Update> LiferaryPost(id) async {
  var url = 'http://api-liferary.duckdns.org/api/main/post?id=${id}';
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken') ?? "";
  MainPostModel_Update mainPostModel_Update;

  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer ${prefs.getString('accessToken')}',
      "Content-Type": "application/json",
      'Charset': 'utf-8',
    },
  );

  var data = json.decode(utf8.decode(response.bodyBytes));
  mainPostModel_Update = MainPostModel_Update(
      id: data['id'],
      title: data['title'],
      author: data['author'],
      nickname: data['nickname'],
      category: data['category'],
      context: data['context'],
      images: data['images'],
      video: data['video'],
      modifiedDate: data['modifiedDate']);
  print('게시글 수정 후 get 파트 : ${mainPostModel_Update}');
  return mainPostModel_Update;
}

class MainPostModel_Update {
  int? id;
  String? title;
  String? author;
  String? nickname;
  String? category;
  String? context;
  List<dynamic>? images;
  String? video;
  String? modifiedDate;

  MainPostModel_Update(
      {this.id,
      this.title,
      this.author,
      this.nickname,
      this.category,
      this.context,
      this.images,
      this.video,
      this.modifiedDate});
}

/**댓글 수정 */
class modifyCommentsClass {
  static TextEditingController modyCommentsController =
      TextEditingController(); //modyCommentsController
  static Future modifyComments(postId, commentId) async {
    var url =
        'http://moida-skhu.duckdns.org/post/${postId}/comments/${commentId}';

    String? token = await storage.read(key: 'Token');
    MainPostModel_Update modiPostModel;

    var response = await http.patch(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json",
          'Charset': 'utf-8',
        },
        body: jsonEncode({"context": modyCommentsController.text}));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }
}

/**댓글 삭제 */
Future<void> deleteComments(postId, commentId) async {
  var url =
      'http://moida-skhu.duckdns.org/post/${postId}/comments/${commentId}';

  String? token = await storage.read(key: 'Token');

  var response = await http.delete(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer ${token}'},
  );
  print(response.body);
}
