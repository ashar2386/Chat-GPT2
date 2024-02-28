import 'package:chat_gpt/constant/color.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPortfolioItem = 'Portfolio';
  int selectedMenu = 0;
  int selected = 0;
  final List<String> myDataTechnicalAnalysis = [
    'Item for Technical Analysis',
    'Item for Technical Analysis',
    'Item for Technical Analysis',
    'Item for Technical Analysis',
  ];

  final List<String> myDataFundamentalAnalysis = [
    'Item for Fundamental Analysis',
    'Item for Fundamental Analysis',
    'Item for Fundamental Analysis',
    'Item for Fundamental Analysis',
  ];

  final List<String> myDataTradingRecommend = [
    'Item for Trading Recommend',
    'Item for Trading Recommend',
    'Item for Trading Recommend',
    'Item for Trading Recommend',
  ];
  final List<String> myDataValuation = [
    'Item for Valuation',
    'Item for Valuation',
    'Item for Valuation',
    'Item for Valuation',
  ];
  @override
  void initState() {
    super.initState();
    getSelectedList(0);
  }

  List<String> recentCreationList = [];

  List<String> selectedSideMenuList = [];
  getSelectedList(int index) {
    switch (index) {
      case 0:
        setState(() {
          selectedSideMenuList = myDataTechnicalAnalysis;
        });
        return;
      case 1:
        setState(() {
          selectedSideMenuList = myDataFundamentalAnalysis;
        });
        return;
      case 2:
        setState(() {
          selectedSideMenuList = myDataTradingRecommend;
        });
        return;
      case 3:
        setState(() {
          selectedSideMenuList = myDataValuation;
        });
        return myDataValuation;
      // return myDataTradingRecommend;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          // buildDropdownButton('Home', selectedHomeItem,['Home']),
          buildElevatedButton('Home'),
          const SizedBox(
            width: 10,
          ),
          buildDropdownButton('Portfolio', selectedPortfolioItem,
              ['Portfolio', 'Watchlist', 'Backtest']),
          const SizedBox(
            width: 10,
          ),
          buildElevatedButton('Social'),
          const SizedBox(
            width: 10,
          ),
          buildElevatedButton('Tools'),
          const SizedBox(
            width: 10,
          ),
          // buildDropdownButton('Social', selectedSocialItem, ['Social']),
          // buildDropdownButton('Tools', selectedToolsItem, ['Tools']),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                elevation: 1.0,
              ),
              onPressed: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(
                    colors: [
                      gcolor,
                      grcolor,
                    ],
                    stops: [0.3, 1.0],
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Center(
                  child: Text(
                    "Try Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: size.height * 0.7,
                  width: size.width * 0.26,
                  // color:Colors.grey[850],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      itemCount: selectedSideMenuList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: selected == index ? menucolor : null,
                          ),
                          child: ListTile(
                            selected: selected == index,
                            title: Text(
                              selectedSideMenuList[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            hoverColor: Colors.grey[800],
                            // selectedTileColor: Colors.grey[800],
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                              print('Item $selected tapped');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(color: Colors.grey,width: 1,height: size.height*0.6,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SearchBar(onSearch: (value) {
                          setState(() {
                            recentCreationList.add(value);
                          });
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // 1st Container
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            color: Colors.black,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // 1st container
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedMenu = 0;
                                          });
                                          getSelectedList(0);
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.09,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          decoration: BoxDecoration(
                                            gradient: selectedMenu != 0
                                                ? null
                                                : const LinearGradient(
                                                    colors: [
                                                      gcolor,
                                                      grcolor
                                                    ], // Adjust these colors as needed
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Technical Analysis",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      //2nd container
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedMenu = 1;
                                          });
                                          getSelectedList(1);
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.09,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          decoration: BoxDecoration(
                                            gradient: selectedMenu != 1
                                                ? null
                                                : const LinearGradient(
                                                    colors: [
                                                      gcolor,
                                                      grcolor
                                                    ], // Adjust these colors as needed
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Fundamental Analysis",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      // 3rd Container
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedMenu = 2;
                                          });
                                          getSelectedList(2);
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.09,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          decoration: BoxDecoration(
                                            gradient: selectedMenu != 2
                                                ? null
                                                : const LinearGradient(
                                                    colors: [
                                                      gcolor,
                                                      grcolor
                                                    ], // Adjust these colors as needed
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Tradng Recommend",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      // 4th Container
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedMenu = 3;
                                          });
                                          getSelectedList(3);
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.09,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.08,
                                          decoration: BoxDecoration(
                                            gradient: selectedMenu != 3
                                                ? null
                                                : const LinearGradient(
                                                    colors: [
                                                      gcolor,
                                                      grcolor
                                                    ], // Adjust these colors as needed
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                " Valuation",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // SearchResultContainer(),
                                Container(
                                  height: size.height * 0.6,
                                  width: size.width*0.7,
                                  // color: Colors.grey,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[800],
                                    
                                  ),
                                  child:recentCreationList.isEmpty?null :Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(recentCreationList.first,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //Elevated Button
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(0),
                          elevation: 1.0,
                        ),
                        onPressed: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: const LinearGradient(
                              colors: [
                                gcolor,
                                grcolor,
                              ],
                              stops: [0.3, 1.0],
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Center(
                            child: Text(
                              "Recent Creations",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //GridView
            SizedBox(
              // height: size.height * 0.2,
              // width: size.width*0.4 ,
              child: GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: recentCreationList.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10, // Adjust the cross axis count as needed
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // height: size.height*0.2,
                    width: size.width*0.2,
                    // height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[800],
                    ),
                    margin: const EdgeInsets.all(
                        8.0), // Adjust the margin as needed
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          recentCreationList[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
          //
        ),
      ),
    );
  }

  Widget buildDropdownButton(
      String menuText, String selectedItem, List<String> dropdownItems) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [
            gcolor,
            grcolor,
          ],
          stops: [0.3, 1.0],
        ),
      ),
      child: Theme(
        data: ThemeData.light().copyWith(
          canvasColor: Colors.grey[800],
        ),
        child: Row(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPortfolioItem = newValue!;
                  });
                },
                style: const TextStyle(color: Colors.white),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                items:
                    dropdownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: const LinearGradient(
                          colors: [
                            gcolor,
                            grcolor,
                          ],
                          stops: [0.3, 1.0],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(String buttonText) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.07,
      // width: MediaQuery.of(context).size.width * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(0),
          elevation: 1.0,
        ),
        onPressed: () {
          // print('$buttonText button pressed');
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: const LinearGradient(
              colors: [
                gcolor,
                grcolor,
              ],
              stops: [0.3, 1.0],
            ),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;
  SearchBar({required this.onSearch});
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: size.width * 0.68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), // Rectangle shape
            color: Colors.white, // Background color
          ),
          child: TextField(
            controller: searchController,
            onSubmitted: (value){
                  widget.onSearch(searchController.text);
                  searchController.clear();
              
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12.0),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  widget.onSearch(searchController.text);
                  searchController.clear();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
