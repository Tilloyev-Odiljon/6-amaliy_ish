import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const _MyAppState(),
    );
  }
}

class _MyAppState extends StatefulWidget {
  const _MyAppState({Key? key}) : super(key: key);

  @override
  __MyAppStateState createState() => __MyAppStateState();
}

class __MyAppStateState extends State<_MyAppState> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int currentIndex = 0;
  bool showOnlyText = false;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      if (currentIndex == 0) {
        showOnlyText = false;
      } else if (currentIndex == 1) {
        showOnlyText = true; // Faqat matn ko'rsatiladi
      } else if (currentIndex == 2) {
        showOnlyText = true;
      } else if (currentIndex == 3) {
        showOnlyText = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KIRISH'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: !showOnlyText ? //true bajarilish qismi
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ismingiz nima?', textScaleFactor: 2), //matnni kattalashtirish foizda hozir 200% kattalashtirilgan
          CircleAvatar(
            backgroundImage: AssetImage("images/1.jpg"),
            radius: 40,
          ),
          SizedBox(height: 12),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.green, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3),
              ),
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              setState(() {
                String text = controller.text;
                controller2.text = 'Xush kelibsiz ' + text;
              });
            },
            child: Text("Yuborish"),
          ),
          SizedBox(height: 12),
          TextField(
            controller: controller2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.green, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3),
              ),
            ),
          ),
        ],
      ): // else bajarilish joyi
        Center(
          child: Text('Bu ${currentIndex+1}-sahifa', style: TextStyle(fontSize: 24),
          ),
        ),

      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.black12,
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF1F1F1F),
          fixedColor: Colors.red,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 24,
          currentIndex: currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0xFF9DB2CE),

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Biznes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: "Jadval",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: "Hamyon",
            ),
          ],
        ),
      ),
    );
  }
}
