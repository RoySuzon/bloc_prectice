import 'package:flutter/material.dart';
import 'package:testing_project/animation.dart';
import 'package:testing_project/features/todo/presentations/page/todo_view.dart';
import 'package:testing_project/ui/counter/counter_page.dart';
import 'package:testing_project/ui/credit_card/credit_card_ui.dart';
import 'package:testing_project/ui/image_picker/image_picker_page.dart';
import 'package:testing_project/ui/sliver_app_bar/silver_app_bar.dart';
import 'package:testing_project/ui/switch/switch_page.dart';

class ElementsList extends StatelessWidget {
  const ElementsList({super.key});

  @override
  Widget build(BuildContext context) {
    Future navigatePage(Widget widget) async {
      return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Element List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTile(
              title: 'Counter App',
              onTap: () {
                navigatePage(const CounterPage());
              },
            ),
            CustomTile(
              title: 'Switch',
              onTap: () {
                navigatePage(const SwitchPage());
              },
            ),
            CustomTile(
              title: 'Image Picke',
              onTap: () {
                navigatePage(const ImagePickerPage());
              },
            ),
            CustomTile(
              title: 'Todo App',
              onTap: () {
                navigatePage(const TodoView());
              },
            ),
            CustomTile(
              title: 'Animation',
              onTap: () {
                navigatePage(const ProductDetailsPage());
              },
            ),
            CustomTile(
              title: 'Credit Card',
              onTap: () {
                navigatePage(const CreditCardUi());
              },
            ),
            CustomTile(
              title: 'Sliver App Bar',
              onTap: () {
                navigatePage(const SilverAppBarDemo());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
