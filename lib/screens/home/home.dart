import 'package:flutter/material.dart';
import 'package:quizapp/screens/quiz/quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      appBar: AppBar(
        title: Text("Home"),
        elevation: 1.0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 80.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: [
                buildCourseCard('Flutter', 'assets/images/flutter.png'),
                buildCourseCard(
                    'React Native', 'assets/images/reactnative.png'),
                buildCourseCard('NodeJS', 'assets/images/nodejs.png'),
                buildCourseCard('NextJS', 'assets/images/nextjs.webp'),
                buildCourseCard('Java', 'assets/images/java.png'),
                buildCourseCard('Python', 'assets/images/python.png'),
                buildCourseCard('Laravel', 'assets/images/laravel.png'),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  Widget buildCourseCard(String name, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QuizScreen()));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                    tag: imgPath,
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath), fit: BoxFit.contain)),
                    )),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                name,
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
