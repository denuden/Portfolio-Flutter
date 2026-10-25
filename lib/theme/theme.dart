import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ===============================
/// COLORS  (from :root in the HTML)
/// ===============================
/// Wrapped in a class so names like `surface` or `border` don't clash
/// with Flutter's own names. Use them as AppColors.ink, AppColors.teal, etc.
class AppColors {
  AppColors._(); // no instances, this class is only a namespace

  // Surfaces
  static const background = Color(0xFFF4F5F1); // --bg
  static const surface = Color(0xFFFFFFFF); // --surface: cards, chips, modal
  static const surfaceMuted = Color(
    0xFFECEEE8,
  ); // --surface-muted: tags, Android section bg

  // Text
  static const ink = Color(0xFF14181F); // --ink: main text, dark buttons
  static const inkSoft = Color(0xFF5B6270); // --ink-soft: secondary text
  static const slate = Color(0xFF9098A3); // --slate: hints, footer meta

  // Accents
  static const amber = Color(0xFFF2A93B); // --amber: underline, FAB, NDA icon
  static const amberDeep = Color(
    0xFFC97A12,
  ); // --amber-deep: "Flutter by choice."
  static const teal = Color(0xFF1F6F78); // --teal: links, eyebrow text
  static const tealSoft = Color(0xFFE4EFEF); // --teal-soft: eyebrow bg
  static const tealDeep = Color(0xFF163E42); // phone screen gradient end

  // Borders
  static const border = Color(0xFFE1E3DC); // --border

  // NDA notice banner
  static const noticeBg = Color(0xFFFBF3E3);
  static const noticeBorder = Color(0xFFEFD9A8);
  static const noticeText = Color(0xFF5C4A1E);
  static const noticeTextStrong = Color(0xFF3E3111);

  // Locked (NDA) stripe pattern
  static const lockedA = Color(0xFFEDEEF0); // --locked-bg
  static const lockedB = Color(0xFFE3E4E7);

  // Transparent overlays. The first two hex digits are the alpha.
  static const appBarGlass = Color(0xD9F4F5F1); // bg at 85%
  static const appBarGlassElevated = Color(0xF5F4F5F1); // bg at 96%
  static const scrim = Color(0x9914181F); // ink at 60%: modal backdrop
  static const mediaOverlay = Color(0x8C14181F); // ink at 55%: "+2 more"
  static const darkPill = Color(0xBF14181F); // ink at 75%: gallery hint, mute
  static const selection = Color(0x59F2A93B); // amber at 35%: selected text

  static const white = Color(0xFFFFFFFF);

  static const kotlinPurple = Color(0xFF7F52FF);
  static const composeGreen = Color(0xFF3DDC84);
  static const flutterBlue = Color(0xFF1F6FEB);
}

/// ===============================
/// LAYOUT
/// ===============================
class AppLayout {
  AppLayout._();

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileBreakpoint;

  static const maxContentWidth = 1080.0; // .wrap max-width
  static const gutter = 28.0; // .wrap horizontal padding
  static const mobileBreakpoint = 860.0; // @media (max-width: 860px)

  static const sectionPaddingY = 80.0; // section { padding: 80px 0 }
  static const heroPaddingTop = 52.0;
  static const heroPaddingBottom = 88.0;
  static const gridGap = 22.0; // gap between cards
}

class AppSpacing {
  AppSpacing._();

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
}

/// Pills (border-radius: 100px in CSS) use StadiumBorder instead.
class AppRadius {
  AppRadius._();

  static const modal = 20.0;
  static const card = 16.0; // --radius
  static const banner = 12.0; // NDA banner
  static const logo = 9.0; // JC logo mark
  static const tag = 7.0; // hero tags
  static const chip = 6.0; // small card chips
}

/// ===============================
/// SHADOWS  (CSS box-shadow → BoxShadow)
/// ===============================
/// CSS order is: x y blur spread color
class AppShadows {
  AppShadows._();

  // #appbar.elevated: 0 4px 18px rgba(20,24,31,.08)
  static const appBar = [
    BoxShadow(color: Color(0x1414181F), offset: Offset(0, 4), blurRadius: 18),
  ];

  // .phone: 0 30px 60px -20px rgba(20,24,31,.35)
  static const phone = [
    BoxShadow(
      color: Color(0x5914181F),
      offset: Offset(0, 30),
      blurRadius: 60,
      spreadRadius: -20,
    ),
  ];

  // .float-chip: 0 10px 24px -10px rgba(20,24,31,.18)
  static const floatChip = [
    BoxShadow(
      color: Color(0x2E14181F),
      offset: Offset(0, 10),
      blurRadius: 24,
      spreadRadius: -10,
    ),
  ];
}

/// ===============================
/// GRADIENTS
/// ===============================
/// CSS angles: 0deg points up, 90deg right, 180deg down.
class AppGradients {
  AppGradients._();

  // .logo-mark: 135deg = top-left → bottom-right
  static const brand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.teal, AppColors.amber],
  );

  // .card-media, .media-cell, .modal-stage placeholders
  static const mediaPlaceholder = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.tealSoft, AppColors.surfaceMuted],
  );

  // .phone-screen: 165deg = mostly downward, tilted slightly right
  static const phoneScreen = LinearGradient(
    begin: Alignment(-0.27, -1),
    end: Alignment(0.27, 1),
    colors: [AppColors.teal, AppColors.tealDeep],
  );

  // .web-strip: 90deg = left → right (Flutter's default direction)
  static const webStrip = LinearGradient(
    colors: [AppColors.surface, AppColors.surfaceMuted],
  );
}

/// ===============================
/// MONO TEXT STYLES (IBM Plex Mono)
/// ===============================
/// These don't fit Material's TextTheme slots, so they live here.
/// CSS letter-spacing in em → Flutter pixels: em × font size.
/// Flutter has no text-transform, so call .toUpperCase() on the string.
class AppText {
  AppText._();

  static TextStyle _mono(
    double size, {
    double letterSpacing = 0,
    Color color = AppColors.inkSoft,
  }) {
    return GoogleFonts.ibmPlexMono(
      fontSize: size,
      fontWeight: FontWeight.w500,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static final heroEyebrow = _mono(
    12,
    letterSpacing: 1.7,
    color: AppColors.teal,
  ); // .eyebrow
  static final sectionEyebrow = _mono(
    12,
    letterSpacing: 1.45,
  ); // .section-eyebrow
  static final tag = _mono(11.5, letterSpacing: 0.35); // .tag
  static final chip = _mono(10.5); // .chip
  static final techMeta = _mono(11); // .more-tech
  static final skillLabel = _mono(
    11.5,
    letterSpacing: 1.15,
    color: AppColors.slate,
  ); // .skill-label
  static final floatChip = _mono(12, color: AppColors.ink); // .float-chip

  // .logo text
  static final logo = GoogleFonts.inter(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: AppColors.ink,
  );
}

/// ===============================
/// BUTTON VARIANTS
/// ===============================
/// A style passed to a button only overrides the properties it sets;
/// everything else still comes from the theme below.
class AppButtonStyles {
  AppButtonStyles._();

  // Smaller pill for the navbar "Contact" button (.cta-btn)
  static final compact = FilledButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
  );
}

/// ===============================
/// THEME
/// ===============================
final ThemeData lightMode = ThemeData(
  useMaterial3: true,

  // Don't set `fontFamily` here: ThemeData would apply it to every text
  // style and overwrite Space Grotesk on the headings. Fonts are set
  // per style in textTheme instead.

  // Desktop browsers default to a "compact" density that shrinks buttons
  // by a few pixels. Standard keeps sizes matching the design.
  visualDensity: VisualDensity.standard,

  // Websites don't ripple on click. Hover highlights still work.
  splashFactory: NoSplash.splashFactory,

  scaffoldBackgroundColor: AppColors.background,

  colorScheme: const ColorScheme.light(
    primary: AppColors.ink, // dark buttons, focus rings
    onPrimary: AppColors.white,
    secondary: AppColors.amber,
    onSecondary: AppColors.ink,
    tertiary: AppColors.teal,
    onTertiary: AppColors.white,
    surface: AppColors.surface,
    onSurface: AppColors.ink,
    onSurfaceVariant: AppColors.inkSoft,
    outline: AppColors.border,
    outlineVariant: AppColors.border,
  ),

  // Inter everywhere by default, then specific slots replaced below.
  textTheme: GoogleFonts.interTextTheme().copyWith(
    // .hero-title (use copyWith(fontSize: 34) on mobile)
    displayMedium: GoogleFonts.spaceGrotesk(
      fontSize: 44,
      fontWeight: FontWeight.w700,
      height: 1.12,
      letterSpacing: -0.5,
      color: AppColors.ink,
    ),
    // .section-title
    headlineMedium: GoogleFonts.spaceGrotesk(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
      color: AppColors.ink,
    ),
    // .footer-title
    headlineSmall: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.ink,
    ),
    // .modal-title
    titleLarge: GoogleFonts.spaceGrotesk(
      fontSize: 21,
      fontWeight: FontWeight.w600,
      color: AppColors.ink,
    ),
    // .card-title
    titleMedium: GoogleFonts.spaceGrotesk(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: AppColors.ink,
    ),
    // .web-title
    titleSmall: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.ink,
    ),
    // .hero-sub
    bodyLarge: GoogleFonts.inter(
      fontSize: 16.5,
      height: 1.65,
      color: AppColors.inkSoft,
    ),
    // .section-desc (also the default for plain Text widgets)
    bodyMedium: GoogleFonts.inter(
      fontSize: 15,
      height: 1.6,
      color: AppColors.inkSoft,
    ),
    // .card-desc
    bodySmall: GoogleFonts.inter(
      fontSize: 13.8,
      height: 1.55,
      color: AppColors.inkSoft,
    ),
    // nav links
    labelLarge: GoogleFonts.inter(
      fontSize: 14.5,
      fontWeight: FontWeight.w500,
      color: AppColors.inkSoft,
    ),
    // .footer-meta
    labelMedium: GoogleFonts.inter(fontSize: 12.5, color: AppColors.slate),
  ),

  // Highlight color when visitors select text (with SelectionArea)
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: AppColors.selection,
    cursorColor: AppColors.ink,
  ),

  dividerTheme: const DividerThemeData(
    color: AppColors.border,
    thickness: 1,
    space: 1,
  ),

  // .card: white, 1px border, 16px radius, no shadow
  cardTheme: CardThemeData(
    color: AppColors.surface,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.card),
      side: const BorderSide(color: AppColors.border),
    ),
  ),

  // .btn-primary: "View my work", "Contact"
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.ink,
      foregroundColor: AppColors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: const StadiumBorder(),
      textStyle: GoogleFonts.inter(fontSize: 14.5, fontWeight: FontWeight.w600),
    ),
  ),

  // .btn-ghost: "Get in touch", "Show more contributions"
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.ink,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      side: const BorderSide(color: AppColors.border, width: 1.5),
      shape: const StadiumBorder(),
      textStyle: GoogleFonts.inter(fontSize: 14.5, fontWeight: FontWeight.w600),
    ),
  ),

  // .card-links: teal inline links. No padding or hover background,
  // since the design shows an underline on hover instead.
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.teal,
      overlayColor: Colors.transparent,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600),
    ),
  ),

  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: AppColors.ink),
  ),

  // Gallery modal
  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.surface,
    surfaceTintColor: Colors.transparent,
    barrierColor: AppColors.scrim,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.modal),
    ),
  ),

  // Mobile nav menu
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.background,
    surfaceTintColor: Colors.transparent,
  ),
);
