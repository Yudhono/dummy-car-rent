import 'package:flutter/material.dart';

import '../data/carData.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  bool light = false;
  int _selectedIndex = 0;
  final Set<int> _selectedChips = {}; // state for selected chip
  bool _withDriver = false;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onClickedWithDriver() {
    setState(() {
      _withDriver = !_withDriver;
    });
  }

  void _onChipSelected(int index) {
    setState(() {
      if (_selectedChips.contains(index)) {
        _selectedChips.remove(index);
      } else {
        _selectedChips.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('with driver ${_withDriver}');
    List<Car> filteredCarData = _withDriver
        ? carData.where((car) => car.withDriver == true).toList()
        : carData.where((car) => car.withDriver == false).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            selected: _selectedIndex == 0,
            onTap: () {
              // Update the state of the app
              _onItemTapped(0);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Business'),
            selected: _selectedIndex == 1,
            onTap: () {
              // Update the state of the app
              _onItemTapped(1);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('School'),
            selected: _selectedIndex == 2,
            onTap: () {
              // Update the state of the app
              _onItemTapped(2);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      )),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_box_rounded),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                return SearchBarTheme(
                  data: SearchBarThemeData(
                    elevation: WidgetStateProperty.all(0),
                    backgroundColor:
                        WidgetStateProperty.all(Colors.grey.shade200),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the desired border radius here
                      ),
                    ),
                  ),
                  child: SearchBar(
                    controller: controller,
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                  ),
                );
              }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              }),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChoiceChip(
                      label: const Text('Luxury Car'),
                      selected: _selectedChips.contains(0),
                      selectedColor: Colors.black87,
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: _selectedChips.contains(0) ? Colors.white : null,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onSelected: (bool selected) {
                        _onChipSelected(0);
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: const Text('Sedan'),
                      selected: _selectedChips.contains(1),
                      selectedColor: Colors.black87,
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: _selectedChips.contains(1) ? Colors.white : null,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onSelected: (bool selected) {
                        _onChipSelected(1);
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: const Text('Hatchback'),
                      selected: _selectedChips.contains(2),
                      selectedColor: Colors.black87,
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: _selectedChips.contains(2) ? Colors.white : null,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onSelected: (bool selected) {
                        _onChipSelected(2);
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: const Text('MPV'),
                      selected: _selectedChips.contains(3),
                      labelStyle: TextStyle(
                        color: _selectedChips.contains(3) ? Colors.white : null,
                      ),
                      selectedColor: Colors.black87,
                      checkmarkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onSelected: (bool selected) {
                        _onChipSelected(3);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Near You',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'With Driver',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.75, // Adjust the scale factor as needed
                    child: Switch(
                      value: light,
                      activeColor: Colors.black87,
                      onChanged: (bool value) {
                        setState(() {
                          _onClickedWithDriver();
                          light = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: filteredCarData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 4 / 6),
                  itemBuilder: (context, index) {
                    final car = filteredCarData[index];
                    return Material(
                      color: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  DetailsScreen(car),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    car.imagePath,
                                    scale: 2.8,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 7.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(height: 10),
                                  Text(
                                    car.name,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(height: 5),
                                  Image.asset(car.logoPath, scale: 12),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '\$ ${car.price}',
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            ' ${car.duration}',
                                            style: const TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.arrow_circle_right),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
