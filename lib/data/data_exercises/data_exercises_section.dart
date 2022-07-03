
class Exercise {
  final String name;
  final String page;
  final String img;

  Exercise({
    required this.name,
    required this.page,
    required this.img,
  });
}

var exercisesList = <Exercise>[
  Exercise(
    name: "ABS",
    page: "/abs_page",
    img: "assets/images/abs.png",
  ),
  Exercise(
    name: "CHEST",
    page: "/back_page",
    img: "assets/images/chest.png",
  ),
  Exercise(
    name: "LEGS",
    page: "/chest_page",
    img: "assets/images/leg.png",
  ),
  Exercise(
    name: "BACK",
    page: "/legs_page",
    img: "assets/images/back.png",
  ),
];
