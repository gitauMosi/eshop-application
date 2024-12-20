import 'package:eshop/views/home/notification_page.dart';
import 'package:eshop/views/home/search_page.dart';
import 'package:flutter/material.dart';

import '../../widgets/header_widget.dart';
import '../../widgets/project_widget_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var categorySelected = 0;

  final List<String> _categoriesList = [
    "All",
    "Men",
    "Women",
    "Foods",
    "electronics",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EShop',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to the CartPage
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to the CartPage
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
            },
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            headerWidget(context),
            Row(
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text("View all"))
              ],
            ),
            SizedBox(
              height: 30,
              child: ListView.builder(
                  itemCount: _categoriesList.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        label: Text(_categoriesList[index]),
                        selected: categorySelected == index,
                        onSelected: (value) {
                          setState(() {
                            categorySelected = index;
                          });
                        },
                      ),
                    );
                  }),
            ),
            SizedBox(height: 10,),
            SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 20,
               physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4 ,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.85
                  ), 
                itemBuilder: (context, index){
                  return ProdutWidgetCard();
                }),
            )
          ],
        ),
      ),
    );
  }
}


