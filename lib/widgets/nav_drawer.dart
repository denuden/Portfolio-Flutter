import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/nav_bar.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
    required this.selectedIndex,
    required this.onSelectLink,
    required this.onClickContact,
  });

  final int selectedIndex;
  final void Function(int) onSelectLink;
  final VoidCallback onClickContact;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
                child: Text('MENU', style: AppText.sectionEyebrow),
              ),
              for (final (index, link) in linkList.indexed)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    title: Text(link),
                    selected: index == selectedIndex,
                    onTap: () {
                      onSelectLink(index);
                      Navigator.pop(context);
                    },
                    titleTextStyle: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 16),
                    textColor: AppColors.inkSoft,
                    selectedColor: AppColors.ink,
                    selectedTileColor: AppColors.surfaceMuted,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.banner),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    trailing: index == selectedIndex
                        ? Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: AppColors.amber,
                              shape: BoxShape.circle,
                            ),
                          )
                        : null,
                  ),
                ),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  onClickContact();
                },
                child: const Text('Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
