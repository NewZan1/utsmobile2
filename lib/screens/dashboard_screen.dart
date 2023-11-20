import 'package:flutter/material.dart';
import 'package:uts_21552011130_fauzanazmifadhilah/screens/grid_screen.dart';
import 'package:uts_21552011130_fauzanazmifadhilah/screens/profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Card makeDashboardItem(String title, String img, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(3.0, -1.0),
              colors: [
                Color(0xFF004B8D),
                Color(0xFFFFFFFF),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 3,
                offset: Offset(2, 2),
              )
            ]),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => GridScreen())));
            }
            if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Profile())));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  img,
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(title,
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4)
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(2),
              children: [
                makeDashboardItem("Grid", "images/grid.png", 0),
                makeDashboardItem("Profile", "images/profile.png", 1)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
