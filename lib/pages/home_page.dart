import 'package:flutter/material.dart';
import 'package:portfolio/sections/hero_section.dart';
import 'package:portfolio/sections/work_section.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:portfolio/widgets/nav_bar.dart';
import 'package:portfolio/widgets/nav_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isNavBarElevated = false;
  int _selectedLinkIndex = 0;
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final shouldElevate = _scrollController.offset > 12;

      if (shouldElevate == _isNavBarElevated) return;

      setState(() {
        _isNavBarElevated = shouldElevate;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        selectedIndex: _selectedLinkIndex,
        onSelectLink: (index) => setState(() => _selectedLinkIndex = index),
        onClickContact: () {},
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child:
            //* ======== Nav bar
            NavBar(
              selectedLinkIndex: _selectedLinkIndex,
              isElevated: _isNavBarElevated,
              onSelectLink: (index) =>
                  setState(() => _selectedLinkIndex = index),
              onClickContact: () {},
            ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              //* Hero Section
              ContentWrap(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppLayout.heroPaddingTop,
                    bottom: AppLayout.heroPaddingBottom,
                  ),
                  child: const HeroSection(),
                ),
              ),

              //* Work Section
              WorkSection(),
            ],
          ),
        ),
      ),
    );
  }
}
