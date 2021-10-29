import 'package:flutter/material.dart';
import '../config/asset.dart';

import 'widget/appbar.widget.dart';
import 'widget/nav.button.dart';
import 'widget/stat.chip.dart';
import 'widget/stepper.tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const AppBarWidget(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavButton(
                        title: 'Hakkında',
                        isSelected: _selectedTab == 0,
                        color: Colors.amber,
                        onTap: () {
                          _selectedTab = 0;
                          setState(() {});
                        },
                      ),
                      NavButton(
                        title: 'Başla',
                        flex: 2,
                        isSelected: _selectedTab == 1,
                        color: Colors.green,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        onTap: () {
                          _selectedTab = 1;
                          setState(() {});
                        },
                      ),
                      NavButton(
                        title: 'Detaylar',
                        isSelected: _selectedTab == 2,
                        color: Colors.red,
                        onTap: () {
                          _selectedTab = 2;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Tarihin ve Müzenin Şehri: Istanbul',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (_selectedTab == 2)
                    Row(
                      children: const [
                        StatChip(
                          title: 'Nokta',
                          value: '20',
                        ),
                        SizedBox(width: 8),
                        StatChip(
                          title: 'Mesafe',
                          value: '4 Km',
                        ),
                        SizedBox(width: 8),
                        StatChip(
                          title: 'Adım',
                          value: '5.497',
                        ),
                        SizedBox(width: 8),
                        StatChip(
                          title: 'Kalori',
                          value: '168',
                        ),
                      ],
                    ),
                  const SizedBox(height: 8)
                ],
              ),
            ),
          ),
          if (_selectedTab == 0)
            const SliverFillRemaining(
              child: Center(child: Text('Hakkında')),
            ),
          if (_selectedTab == 1)
            const SliverFillRemaining(
              child: Center(child: Text('Başla')),
            ),
          if (_selectedTab == 2)
            SliverList(
              delegate: SliverChildBuilderDelegate((_, i) {
                return StepperTile(
                  index: i,
                  listLength: 40,
                  image: ImageNetwork.parallaxImage,
                  title: 'Yerebatan Sarnıcı',
                );
              }, childCount: 40),
            ),
        ],
      ),
    );
  }
}
