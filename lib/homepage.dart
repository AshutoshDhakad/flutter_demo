import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'thirdpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> assetImages = [
    'assets/images/africa 1.png',
    'assets/images/asia-512 1.png',
    'assets/images/australia 1.png',
    'assets/images/img.png',
    'assets/images/africa 1.png',
    'assets/images/img.png',
  ];

  final List<String> boxLabels = [
    'Africa',
    'Asia',
    'Australia',
    'Europe',
    'USA',
    'Brazil',
  ];

  String searchQuery = '';
  String? selectedBox;

  @override
  Widget build(BuildContext context) {
    final filteredBoxes = boxLabels.asMap().entries.where((entry) =>
        entry.value.toLowerCase().contains(searchQuery.toLowerCase()))
        .map((entry) => {
      'label': entry.value,
      'image': assetImages[entry.key],
    })
        .toList();

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
            const LinearProgressIndicator(value: 0.5, color: Colors.white, backgroundColor: Colors.white54,),
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
                        // Add your back navigation logic here
                      },
                    ),
                  ),
                  const Text(
                    "Step 3 of 6",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 70.0 ),
              child: Text(
                "Select Your Continents",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 70, right: 70, top: 40),
              child: Text(
                'Select the Countries you are in corporated in or plan to be.',
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
                    setState(() {
                      searchQuery = value;
                    });
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
            const Padding(padding: EdgeInsets.only(top: 16)),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: List.generate(filteredBoxes.length, (index) {
                Color boxColor = (selectedBox == filteredBoxes[index]['label'])
                    ? Colors.white
                    : Colors.black;

                Color textColor = (selectedBox == filteredBoxes[index]['label'])
                    ? Colors.black
                    : Colors.white;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBox = filteredBoxes[index]['label'];
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: boxColor,
                      border: Border.all(color: Colors.white, width: 2), // White outline
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            (selectedBox == filteredBoxes[index]['label'])
                                ? Colors.black
                                : Colors.white,
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            filteredBoxes[index]['image']!,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            filteredBoxes[index]['label']!,
                            style: TextStyle(fontSize: 16, color: textColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: selectedBox != null
          ? Container(
              width: 400,
              height: 50,
               padding: const EdgeInsets.symmetric(horizontal: 10),
             child: FloatingActionButton.extended(
                    onPressed: () {
                    Navigator.of(context).push(
                  MaterialPageRoute(
                builder: (context) => SecondPageTest(title: selectedBox!), // Pass the selected box label
                    ),
                   );
                  },
                 backgroundColor: Colors.lightBlueAccent,
                  label: const Text("Continue"), // Text label
                    ),
                   )
                     : null,
                  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                   );
                  }
                 }