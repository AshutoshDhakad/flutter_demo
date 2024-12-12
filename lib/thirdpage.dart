import 'package:flutter/material.dart';

class ThirdPageTest extends StatefulWidget {
  final String title; // Change to String to match the selected box

  const ThirdPageTest({Key? key, required this.title}) : super(key: key);

  @override
  State<ThirdPageTest> createState() => _ThirdPageTestState();
}

class _ThirdPageTestState extends State<ThirdPageTest> {
  final List<String> countries = [
    'AdTech',
    'Advanced Manufacturing',
    'AgTech',
    'AI/ML',
    'AudioTech',
    'Augmented Reality(AR)',
    'AI Generated',
  ];
  final List<String> countryImages = [
    'assets/thirdpage/AdTech.jpg',
    'assets/thirdpage/Advanced_Manufacturing.png',
    'assets/thirdpage/AgTech.png',
    'assets/thirdpage/AI:ML.png',
    'assets/thirdpage/AiGenerated.png',
    'assets/thirdpage/Audio_Tech.png',
    'assets/thirdpage/Augmented_Reality.png',
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
              const LinearProgressIndicator(value: 0.85, color: Colors.white, backgroundColor: Colors.white54,),
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
                      "Step 5 of 6",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 70, bottom: 50),
                child: Text(
                  "Select Your Industries",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "What is your Industry? if you don't see it Select "
                               "the closet fit",
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