import 'package:flutter/material.dart';
import 'package:plantdiseasedetections/chatbot/mains.dart';
import 'Braintumour/Braintumour.dart';
import 'Tuberculosis/Tuberculosis.dart';
import 'Lung_cancer/Lung_cancer.dart';
import 'Heart_disease/Heart_disease.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      color: Color.fromARGB(255, 238, 72, 141),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int inde = 0;
  void indes() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const chat()));
  }

  // List of image paths
  final List<String> imagePaths = [
    "assets/Braintumour.jpeg",
    "assets/tuberculosis.jpeg",
    "assets/lungcancer.jpeg",
    "assets/Heartdisease.jpeg",
  ];

  // List of text for each grid item
  final List<String> itemTexts = [
    'Brain Tumour',
    'Tuberculosis',
    'Lung Cancer',
    'Heart Disease',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 210, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 162, 193),
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        title: const Center(
          child: Text(
            " Disease Detection",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: buildScrollableGridView(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: inde,
        onTap: (int Index) {
          inde = Index;
          setState(() {
            if (inde == 0) {
              indes();
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded), label: "ChatBot"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        backgroundColor: Color.fromARGB(255, 234, 210, 224),
        selectedFontSize: 20,
        selectedItemColor: Colors.black,
      ),
    );
  }

  Widget buildScrollableGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            navigateToPage(context, index);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 227, 162, 193),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 165, 9, 103),
                      spreadRadius: 0,
                      blurRadius: 4),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      imagePaths[index],
                      width: 80.0,
                      height: 80.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(itemTexts[index]),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Braintumour(
                      itemText: '',
                    )));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Tuberculosis(
                      itemText: '',
                    )));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Lungcancer(
                      itemText: '',
                    )));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const heart(
                      itemText: '',
                    )));
        break;
      default:
        break;
    }
  }
}
