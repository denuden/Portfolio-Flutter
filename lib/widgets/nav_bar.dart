import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/theme.dart';

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
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: isElevated ? AppShadows.appBar : [],
      ),
      duration: Duration(milliseconds: 250),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: AppLayout.gutter,
          ),
          child: SizedBox(
            width: AppLayout.maxContentWidth,
            child: Row(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* ===== Profile
                _profile(),
                //* ===== Links
                _links(context),
                //* ===== Contact
                _contact(() => onClickContact()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return Row(
      children: [
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
        Text('Von Denuelle', style: AppText.logo),
      ],
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
              TextButton(
                style:
                    TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      shape: selectedLinkIndex == 0
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
                        if (selectedLinkIndex == 0 ||
                            states.contains(WidgetState.hovered)) {
                          return AppColors.ink;
                        }
                        return AppColors.inkSoft;
                      }),
                    ),
                onPressed: () {
                  onSelectLink(0);
                },
                child: Text("About"),
              ),
              TextButton(
                style:
                    TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      shape: selectedLinkIndex == 1
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
                        if (selectedLinkIndex == 1 ||
                            states.contains(WidgetState.hovered)) {
                          return AppColors.ink;
                        }
                        return AppColors.inkSoft;
                      }),
                    ),
                onPressed: () {
                  onSelectLink(1);
                },
                child: Text("Flutter"),
              ),
              TextButton(
                style:
                    TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      shape: selectedLinkIndex == 2
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
                        if (selectedLinkIndex == 2 ||
                            states.contains(WidgetState.hovered)) {
                          return AppColors.ink;
                        }
                        return AppColors.inkSoft;
                      }),
                    ),
                onPressed: () {
                  onSelectLink(2);
                },
                child: Text("Native Android"),
              ),
              TextButton(
                style:
                    TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      shape: selectedLinkIndex == 3
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
                        if (selectedLinkIndex == 3 ||
                            states.contains(WidgetState.hovered)) {
                          return AppColors.ink;
                        }
                        return AppColors.inkSoft;
                      }),
                    ),
                onPressed: () {
                  onSelectLink(3);
                },
                child: Text("Notable"),
              ),
              TextButton(
                style:
                    TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      shape: selectedLinkIndex == 4
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
                        if (selectedLinkIndex == 4 ||
                            states.contains(WidgetState.hovered)) {
                          return AppColors.ink;
                        }
                        return AppColors.inkSoft;
                      }),
                    ),
                onPressed: () {
                  onSelectLink(4);
                },
                child: Text("Web"),
              ),
              TextButton(
                style:
                    TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      shape: selectedLinkIndex == 5
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
                        if (selectedLinkIndex == 5 ||
                            states.contains(WidgetState.hovered)) {
                          return AppColors.ink;
                        }
                        return AppColors.inkSoft;
                      }),
                    ),
                onPressed: () {
                  onSelectLink(5);
                },
                child: Text("Skills"),
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
