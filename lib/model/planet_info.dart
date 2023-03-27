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
      name: 'Mercury',
      iconImage: 'assets/images/mercury.png',
      category: "etc..",
      category_icon: "more",
      description:
          "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
      images: [
        'https://scx1.b-cdn.net/csz/news/800a/2015/whatsimporta.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Mercury_in_true_color.jpg/640px-Mercury_in_true_color.jpg',
        'https://earthsky.org/upl/2018/09/PIA16853-800x450.jpg'
      ]),
  PlanetInfo(2,
      name: 'Venus',
      category_icon: "more",
      category: "etc..",
      iconImage: 'assets/images/venus.png',
      description:
          "The second planet from the sun, Venus is Earth's twin in size. Radar images beneath its atmosphere reveal that its surface has various mountains and volcanoes. But beyond that, the two planets couldn't be more different. Because of its thick, toxic atmosphere that's made of sulfuric acid clouds, Venus is an extreme example of the greenhouse effect. It's scorching-hot, even hotter than Mercury. The average temperature on Venus' surface is 900 F (465 C). At 92 bar, the pressure at the surface would crush and kill you. And oddly, Venus spins slowly from east to west, the opposite direction of most of the other planets.",
      images: [
        'https://www.universetoday.com/wp-content/uploads/2008/10/Venus-e1489179310371.jpg',
        'https://cdn.mos.cms.futurecdn.net/kaPwBjHiUKax8syodHNPmF.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Venus_from_Mariner_10.jpg/640px-Venus_from_Mariner_10.jpg',
        'https://earthhow.com/wp-content/uploads/2018/08/Venus-850x850.jpg'
      ]),
  PlanetInfo(3,
      name: 'Earth',
      category_icon: "more",
      category: "etc..",
      iconImage: 'assets/images/earth.png',
      description:
          "The third planet from the sun, Earth is a waterworld, with two-thirds of the planet covered by ocean. It's the only world known to harbor life. Earth's atmosphere is rich in nitrogen and oxygen. Earth's surface rotates about its axis at 1,532 feet per second (467 meters per second) — slightly more than 1,000 mph (1,600 kph) — at the equator. The planet zips around the sun at more than 18 miles per second (29 km per second).",
      images: [
        'https://cdn.mos.cms.futurecdn.net/yCPyoZDQBBcXikqxkeW2jJ.jpg',
        'https://astronomy.com/-/media/Images/Magazine%20Articles/2017/10/ASYSK1017_01.jpg?mw=600',
        'https://1.bp.blogspot.com/-j4ngrD_P4Gs/Wna4uMOvbHI/AAAAAAAACjI/_PaUVlLTsFgjy2PpuVeOXaTxp_AH9u-UQCLcBGAs/s640/mhmh.jpg',
        'https://www.worldatlas.com/r/w1200/upload/07/10/e5/8980150253-4ac1b9cc30-z.jpg',
      ]),
  PlanetInfo(4,
      name: 'Mars',
      category_icon: "more",
      category: "etc..",
      iconImage: 'assets/images/mars.png',
      description:
          "The fourth planet from the sun is Mars, and it's a cold, desert-like place covered in dust. This dust is made of iron oxides, giving the planet its iconic red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. ",
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/OSIRIS_Mars_true_color.jpg/640px-OSIRIS_Mars_true_color.jpg',
        'https://media.nature.com/w700/magazine-assets/d41586-020-01792-w/d41586-020-01792-w_18083440.jpg',
        'https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Fsundaytimes%2Fprod%2Fweb%2Fbin%2Faee2f6f6-d190-11ea-867d-b1ae14c05a8c.jpg?crop=1500%2C1500%2C0%2C0&resize=618',
      ]),
  PlanetInfo(5,
      name: 'Jupiter',
      category_icon: "more",
      category: "etc..",
      iconImage: 'assets/images/jupiter.png',
      description:
          "The fifth planet from the sun, Jupiter is a giant gas world that is the most massive planet in our solar system — more than twice as massive as all the other planets combined, according to NASA. Its swirling clouds are colorful due to different types of trace gases. And a major feature in its swirling clouds is the Great Red Spot, a giant storm more than 10,000 miles wide. It has raged at more than 400 mph for the last 150 years, at least. Jupiter has a strong magnetic field, and with 75 moons, it looks a bit like a miniature solar system.",
      images: [
        'https://cdn.britannica.com/66/155966-131-17B5B518/Jupiter.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg/640px-Jupiter_and_its_shrunken_Great_Red_Spot.jpg',
        'https://earthhow.com/wp-content/uploads/2018/08/Jupiter-850x850.jpg'
      ]),
];
