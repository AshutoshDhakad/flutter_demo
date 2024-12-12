import 'package:flutter/material.dart';
import 'package:your_project_name/thirdpage.dart';

class SecondPageTest extends StatefulWidget {
  final String title; // Change to String to match the selected box

  const SecondPageTest({Key? key, required this.title}) : super(key: key);

  @override
  State<SecondPageTest> createState() => _SecondPageTestState();
}

class _SecondPageTestState extends State<SecondPageTest> {
  final List<String> countries = [
    'Australia',
    'Canada',
    'Cuba',
    'Greenland',
    'India',
    'Jamaica',
    'Maxico',
    'Usa',
  ];

  final List<String> countryImages = [
    'assets/secondpage/Australia.png',
    'assets/secondpage/canada.png',
    'assets/secondpage/cuba.png',
    'assets/secondpage/Greenland.png',
    'assets/secondpage/india.png',
    'assets/secondpage/jamaica.png',
    'assets/secondpage/maxico.png',
    'assets/secondpage/Usa.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const LinearProgressIndicator(value: 0.7, color: Colors.white, backgroundColor: Colors.white54,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 25),
                  onPressed: () {
                    Navigator.of(context).pop(); // Go back to the previous page
                  },
                ),
              ),
              const Text(
                "Step 4 of 6",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 70, right: 70, bottom: 50),
          child: Text(
            "Select Your Countries",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 84),
          child: Text(
            'Select the Countries you are '
                'in Corporated in or plan to be.',
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.transparent,
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.black, size: 35,),
              ),
              onChanged: (value) {
                // Handle search query if needed
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, left: 16.0, right: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: countries.length,

          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      countryImages[index],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16), // Space between image and text
                  Expanded(
                    child: Text(
                      countries[index],
                      style: const TextStyle(

                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.green,
                    size: 20,
                  ),
                ],
              ),

            );
          },
        ),
      ],
      ),
      ),
      floatingActionButton: Container(
        width: 400,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ThirdPageTest(title: "Selected Country"), // Pass the selected box label
              ),
            );
          },
          backgroundColor: Colors.lightBlueAccent,
          label: const Text("Continue"), // Text label
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}