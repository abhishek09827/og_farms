import 'package:e_commerce/features/account/screens/account_screen.dart';
import 'package:e_commerce/features/home/screens/home_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';


class BubbelBarExample extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BubbelBarExample({Key? key}) : super(key: key);

  @override
  State<BubbelBarExample> createState() => _BubbelBarExampleState();
}

class _BubbelBarExampleState extends State<BubbelBarExample> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          HomeScreen(),
          AccountScreen(),
          Text('Cart')
        ],
      ),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.vertical,
          // barStyle: BubbleBarStyle.vertical,
          bubbleFillStyle: BubbleFillStyle.fill,
          // bubbleFillStyle: BubbleFillStyle.outlined,
          opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.house_outlined),
            title: const Text('Home'),
            backgroundColor: Colors.red,

            // selectedColor: Colors.pink,
            selectedIcon: const Icon(Icons.house_outlined),
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_pin_circle_outlined),
            title: const Text('Profile'),
            selectedColor: Colors.orange,
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Cart'),
            backgroundColor: Colors.purple,
          ),
        ],
        fabLocation: StylishBarFabLocation.end,
        // hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.emoji_emotions),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}