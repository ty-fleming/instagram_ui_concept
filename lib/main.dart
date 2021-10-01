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
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget _buildButton(String buttonText, double buttonWidth) {
      return Container(
        height: 42,
        width: buttonWidth,
        child: Center(
          child: Text(
            buttonText,
            style: textTheme.bodyText1!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: [COLOR_BLUE, COLOR_PURPLE]),
        ),
      );
    }

    Widget _buildGridItem(String image) {
      return Container(
        margin: const EdgeInsets.all(4),
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
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
            // Container(
            //   width: width,
            //   height: 85,
            //   child: ListView(
            //     // This next line does the trick.
            //     scrollDirection: Axis.horizontal,

            //     children: <Widget>[
            //       CircleAvatar(),

            //     ],
            //   ),
            // ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
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
