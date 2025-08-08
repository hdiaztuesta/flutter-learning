import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = '/home'; 

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets en Flutter + Material 3')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final item = appMenuItems[index];
        return _CustomListTile(menuItem: item);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItems menuItem;

  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {

        // context.pushNamed(CardsScreen.routeName);
        context.push(menuItem.link);

        // Navigator.pushNamed(context, menuItem.link);

        // Navigator.of(
        //   context,
        // ).push(MaterialPageRoute(builder: (context) => ButtonsScreen()));
      },
    );
  }
}
