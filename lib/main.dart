import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          textTheme: GoogleFonts.latoTextTheme()),
      home: ProfileScreen(),
    );
  }
}

//424 posts
//10.5m followers
//3 following

const Color COLOR_PURPLE = Color.fromRGBO(141, 106, 236, 1);
const Color COLOR_BLUE = Color.fromRGBO(78, 125, 225, 1);
const Color COLOR_BACKGROUND_WHITE = Color.fromRGBO(237, 238, 236, 1);
const Color COLOR_BUTTON_PRIMARY = Color.fromRGBO(202, 43, 125, 1);
const Color COLOR_BUTTON_SECONDARY = Color.fromRGBO(249, 157, 74, 1);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var images = [
    "spacex (1).jpg",
    "spacex (2).jpg",
    "spacex (3).jpg",
    "spacex (4).jpg",
    "spacex (5).jpg",
    "spacex (6).jpg",
    "spacex (7).jpg",
    "spacex (8).jpg",
    "spacex (9).jpg",
    "spacex (10).jpg"
  ];

  List<Color> colorList = [
    COLOR_PURPLE,
    COLOR_BLUE,
  ];

  int index = 0;
  Color bottomColor = COLOR_BLUE;
  Color topColor = COLOR_PURPLE;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        bottomColor = COLOR_PURPLE;
        topColor = COLOR_BLUE;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget _buildButton(String buttonText, double buttonWidth) {
      return AnimatedContainer(
        duration: Duration(seconds: 2),
        height: 42,
        width: buttonWidth,
        child: Center(
          child: Text(
            buttonText,
            style: textTheme.bodyText1!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        onEnd: () {
          setState(() {
            index = index + 1;
            // animate the color
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];

            //// animate the alignment
            // begin = alignmentList[index % alignmentList.length];
            // end = alignmentList[(index + 2) % alignmentList.length];
          });
        },
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                begin: begin, end: end, colors: [bottomColor, topColor])),
      );
    }

    Widget _buildGridItem(String image) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ViewPhotoScreen(
                  imageHero: image,
                );
              },
            ),
          );
        },
        child: Hero(
          tag: image,
          child: Container(
            margin: const EdgeInsets.all(4),
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
        ),
      );
    }

    Widget _buildHighlightCircle(String imagePath) {
      return Container(
        margin: const EdgeInsets.only(right: 25),
        height: 85,
        width: 85,
        decoration: BoxDecoration(
          border: Border.all(color: COLOR_BLUE, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(9, 12),
            ),
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
      );
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2.0,
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
            size: 40,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [COLOR_BUTTON_SECONDARY, COLOR_BUTTON_PRIMARY])),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 65,
          width: 200,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Icon(Icons.home),
              ),
              Container(
                child: Icon(Icons.search),
              ),
              Container(
                child: Icon(Icons.notifications_none),
              ),
              Container(
                child: Icon(Icons.person_outline),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
      backgroundColor: COLOR_BACKGROUND_WHITE,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text(
          "spacex",
          style: textTheme.bodyText1!.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: COLOR_BACKGROUND_WHITE,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                height: 145,
                width: width * 0.80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 25),
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/spacex.jpg"),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "spacex",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .9,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Aerospace",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "spacex.com",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.blue[500],
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 100,
                width: width * 0.90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "490",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          "Posts",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "120k",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          "Followers",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "3",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          "Following",
                          style: textTheme.bodyText1!.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width * .85,
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton("Follow", 200),
                  Icon(Icons.mail_outline_outlined)
                ],
              ),
            ),
            Container(
              width: width,
              height: 150,
              margin: const EdgeInsets.only(top: 25, bottom: 25),
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  _buildHighlightCircle("assets/spacex (1).jpg"),
                  _buildHighlightCircle("assets/spacex (2).jpg"),
                  _buildHighlightCircle("assets/spacex (3).jpg"),
                  _buildHighlightCircle("assets/spacex (4).jpg"),
                  _buildHighlightCircle("assets/spacex (5).jpg"),
                  _buildHighlightCircle("assets/spacex (6).jpg"),
                  _buildHighlightCircle("assets/spacex (7).jpg"),
                ],
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: images.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return _buildGridItem("assets/" + images[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ViewPhotoScreen extends StatelessWidget {
  final String imageHero;
  const ViewPhotoScreen({Key? key, required this.imageHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND_WHITE,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: CircleAvatar(
          radius: 21,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/spacex.jpg"),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: width,
          height: height,
          color: Colors.black87,
          child: Column(
            children: [
              Container(
                width: width,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: COLOR_BACKGROUND_WHITE,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Hero(
                      tag: imageHero,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        height: 350,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 15,
                              offset: Offset(9, 12),
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            image: AssetImage(imageHero),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          height: 25,
                          width: 85,
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "2,255",
                                style: textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 85,
                          child: Row(
                            children: [
                              Icon(
                                Icons.comment_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "129",
                                style: textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.bookmark_add_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Spacer(),
              _buildComment(
                width: width,
                textTheme: textTheme,
                comment: "Love this picture!",
                commentAuthor: "Elon Musk",
                profilePic: "assets/spacex.jpg",
              ),
              _buildComment(
                width: width,
                textTheme: textTheme,
                comment: "Wow...",
                commentAuthor: "Jeff Spaceos",
                profilePic: "assets/amazonlogo.png",
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: COLOR_BACKGROUND_WHITE,
                    filled: true,
                    hintStyle:
                        textTheme.bodyText1!.copyWith(color: Colors.black45),
                    hintText: "Add a comment...",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundImage: AssetImage("assets/spacex.jpg"),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _buildComment extends StatelessWidget {
  const _buildComment({
    Key? key,
    required this.width,
    required this.textTheme,
    required this.comment,
    required this.commentAuthor,
    required this.profilePic,
  }) : super(key: key);

  final double width;
  final TextTheme textTheme;
  final String comment;
  final String commentAuthor;
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: width,
      height: 65,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(profilePic),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                commentAuthor,
                style: textTheme.bodyText1!.copyWith(
                    color: Colors.white30,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
              Text(
                comment,
                style: textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.favorite_outline,
            color: Colors.white38,
            size: 20,
          )
        ],
      ),
    );
  }
}
