import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';

const linkList = ['About', 'Work', 'Projects', 'Notable', 'Web', 'Skills'];

class NavBar extends StatelessWidget {
  final int selectedLinkIndex;
  final void Function(int) onSelectLink;
  final bool isElevated;
  final void Function() onClickContact;
  const NavBar({
    super.key,
    required this.selectedLinkIndex,
    required this.onSelectLink,
    required this.isElevated,
    required this.onClickContact,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return AnimatedContainer(
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: isElevated ? AppShadows.appBar : [],
      ),
      duration: Duration(milliseconds: 250),
      child: ContentWrap(
        child: Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* ===== Profile
            _profile(isMobile, () {
              Scaffold.of(context).openDrawer();
            }),
            //* ===== Links
            if (!isMobile) _links(context),
            //* ===== Contact
            _contact(() => onClickContact()),
          ],
        ),
      ),
    );
  }

  Widget _profile(bool isMobile, void Function() onPressMenu) {
    return Flexible(
      child: Row(
        children: [
          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  onPressMenu();
                },
                icon: Icon(Icons.menu),
              ),
            ),

          Container(
            decoration: BoxDecoration(
              gradient: AppGradients.brand,
              borderRadius: BorderRadius.circular(AppRadius.logo),
            ),
            child: SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: Text(
                  "VD",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              'Von Denuelle',
              style: AppText.logo.copyWith(fontSize: isMobile ? 14 : 17),
            ),
          ),
        ],
      ),
    );
  }

  Widget _links(BuildContext context) {
    return Flexible(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final (index, link) in linkList.indexed)
                TextButton(
                  style:
                      TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        padding: EdgeInsets.symmetric(vertical: 6),
                        shape: selectedLinkIndex == index
                            ? LinearBorder.bottom(
                                side: BorderSide(
                                  color: AppColors.amber,
                                  width: 2,
                                ),
                              )
                            : LinearBorder.none,
                      ).copyWith(
                        foregroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (selectedLinkIndex == index ||
                              states.contains(WidgetState.hovered)) {
                            return AppColors.ink;
                          }
                          return AppColors.inkSoft;
                        }),
                      ),
                  onPressed: () {
                    onSelectLink(index);
                  },
                  child: Text(link),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contact(void Function() onClick) {
    return FilledButton(
      style: AppButtonStyles.compact,
      onPressed: onClick,
      child: Text('Contact'),
    );
  }
}
