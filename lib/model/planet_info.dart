class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String category;
  final String category_icon;
  final String description;
  final List<String> images;

  PlanetInfo(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.category,
    required this.category_icon,
    required this.description,
    required this.images,
  });
}

List<PlanetInfo> planetInfo = [
  PlanetInfo(1,
      name: 'How to use Liferary?',
      iconImage: 'assets/images/logo.png',
      category: "Etc..",
      category_icon: "not yet",
      description:
          " Liferary allows users to first enter the content they want to share with others and, "
          "if they want to create a study related to the topic(knowledge) they are posting, "
          "they can register a Google Meet link in the Study section. Additionally, "
          "users can attach useful YouTube videos or images that readers can refer to when viewing the post, "
          "and then register the post using these features.\n"
          " After reading this, users can use the BorderPost function to express their own thoughts related to the post in"
          " a new post within the posting, and there is also a comment function available on BorderPost "
          "postings where users can share their thoughts.\n"
          " If users utilize all of these functions of Liferary,"
          "they can enjoy a networking system that is like an infinite library without limitations such as location, time, or money.",
      images: [
        'assets/images/MainScreen.png',
        'assets/images/WriteScreen.png',
        'assets/images/Icon.png',
      ]),
  PlanetInfo(2,
      name: 'How to use Google Meet? - Host',
      iconImage: 'assets/images/googlemeet.png',
      category: "Etc..",
      category_icon: "not yet",
      description:
          "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
      images: [
        'https://scx1.b-cdn.net/csz/news/800a/2015/whatsimporta.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Mercury_in_true_color.jpg/640px-Mercury_in_true_color.jpg',
        'https://earthsky.org/upl/2018/09/PIA16853-800x450.jpg'
      ]),
  PlanetInfo(3,
      name: 'How to cook delicious Korean food, Bulgogi!',
      iconImage: 'assets/images/bulgogi.png',
      category: "Cooking",
      category_icon: "not yet",
      description:
          "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
      images: [
        'https://scx1.b-cdn.net/csz/news/800a/2015/whatsimporta.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Mercury_in_true_color.jpg/640px-Mercury_in_true_color.jpg',
        'https://earthsky.org/upl/2018/09/PIA16853-800x450.jpg'
      ]),
  PlanetInfo(4,
      name: 'Java! Powerful programming language.',
      iconImage: 'assets/images/java.png',
      category: "Programming",
      category_icon: "not yet",
      description:
          "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
      images: [
        'https://scx1.b-cdn.net/csz/news/800a/2015/whatsimporta.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Mercury_in_true_color.jpg/640px-Mercury_in_true_color.jpg',
        'https://earthsky.org/upl/2018/09/PIA16853-800x450.jpg'
      ]),
  PlanetInfo(5,
      name: 'What is OOP?',
      iconImage: 'assets/images/oop.png',
      category: "Programming",
      category_icon: "",
      description:
          "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
      images: [
        'https://scx1.b-cdn.net/csz/news/800a/2015/whatsimporta.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Mercury_in_true_color.jpg/640px-Mercury_in_true_color.jpg',
        'https://earthsky.org/upl/2018/09/PIA16853-800x450.jpg'
      ]),
];
