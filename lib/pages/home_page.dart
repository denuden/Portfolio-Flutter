import 'package:flutter/material.dart';
import 'package:portfolio/sections/hero_section.dart';
import 'package:portfolio/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isNavBarElevated = false;

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child:
            //* ======== Nav bar
            NavBar(
              selectedLinkIndex: 0,
              isElevated: _isNavBarElevated,
              onSelectLink: (p0) {},
              onClickContact: () {},
            ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16),
          controller: _scrollController,
          child: Column(
            children: [
              //* Hero Section
              HeroSection(),
            ],
          ),
        ),
      ),
    );
  }
}
