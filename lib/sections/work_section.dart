import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:portfolio/widgets/work_card.dart';
import 'package:portfolio/widgets/work_list.dart';
import 'package:portfolio/widgets/work_pill.dart';

const _workItems = [
  (
    title: "Social services super app",
    role: "· Lead · Live",
    description:
        "Staff run assistance programs and community events from one app. I built offline events (download the day's attendees, log attendance with no signal, sync later) and modernized the app with encrypted login storage and page-by-page loading.",
    skills: ['OFFLINE SYNC', 'QR', 'PRINTING'],
  ),
  (
    title: "Patient health app",
    role: "· Major contributor",
    description:
        "Patients book and reschedule consultations, check their medical records and lab results on the go, download them as PDFs, and use an AI symptom checker, in Filipino and Cebuano too.",
    skills: ['HEALTHCARE', 'PDF', 'LOCALIZATION'],
  ),
  (
    title: "Food assistance point-of-sale",
    role: "· Support · Live",
    description:
        "Beneficiaries buy food using their assistance balance. I tightened PIN-protected payments, added offline mode and balance privacy, and made sure every order prints a receipt.",
    skills: ['PAYMENTS', 'OFFLINE', 'PRINTING'],
  ),
  (
    title: "Beneficiary attendance & pre-order app",
    role: "· Lead · Live",
    description:
        "Partner merchants scan beneficiaries' QR codes to log attendance, then walk them through a step-by-step goods package pre-order. I built it from an empty project, with support for the kiosk's built-in scanner and handhelds, and background photo compression.",
    skills: ['QR', 'KIOSK SCANNER'],
  ),
  (
    title: "Crisis assistance apps",
    role: "· Lead on two apps",
    description:
        "A set of apps for releasing emergency financial aid. I led the disbursement and user apps, rebuilt the merchant app's design with an assistance request module, took over the facilitator app, and fixed capture crashes in the beneficiary app.",
    skills: ['FINANCIAL AID', 'UI/UX'],
  ),
  (
    title: "Grain retailer app",
    role: "· Lead",
    description:
        "Retailers scan a farmer's QR, pick items from a menu, print a QR receipt and pay from a wallet. I led the design and API work.",
    skills: ['QR', 'PRINTING', 'WALLET'],
  ),
  (
    title: "Farm assistance merchant POS",
    role: "· Support",
    description:
        "Merchants scan beneficiary cards and assistance packages on POS devices. I added the card scanner and package scanning, handled a full rebrand, and published builds to the Sunmi App Store.",
    skills: ['CARD SCANNER', 'SUNMI POS'],
  ),
  (
    title: "Delivery rider app",
    role: "· Overhaul",
    description:
        "Rebuilt the whole app: new design, cleaner code and API layer, and a Google Maps integration.",
    skills: ['GOOGLE MAPS'],
  ),
  (
    title: "Trader wallet app",
    role: "· Lead",
    description:
        "A digital wallet for agricultural traders. I built the wallet module, deposit requests and the API integration.",
    skills: ['WALLET', 'PAYMENTS'],
  ),
  (
    title: "Farm lending app",
    role: "· Lead",
    description:
        "The app that later grew into the farm services app. I built the loan module (applications, partial and full repayments, credit limit rules), borrower groups with invites and co-admins, and face verification screens for KYC.",
    skills: ['LENDING', 'PAYMENTS', 'KYC'],
  ),
  (
    title: "Community assistance app",
    role: "· Major contributor",
    description:
        "Members join groups, earn badges and points, and donate to causes. I built most of the points wallet, donations, groups, badges, billing and registration.",
    skills: ['WALLET', 'DONATIONS'],
  ),
  (
    title: "Citation app",
    role: "· Lead",
    description:
        "Built its full offline mode: citations with reference IDs and QR codes created with no signal, offline login and search, and CSV export and sync.",
    skills: ['OFFLINE-FIRST', 'CSV SYNC'],
  ),
  (
    title: "Clinic queue kiosk",
    role: "· Support",
    description:
        "Walk-in patients choose their services, get a printed queue ticket and rate their visit. Staff can correct a ticket with a password.",
    skills: ['KIOSK', 'TICKET PRINTING'],
  ),
  (
    title: "Field inspection apps",
    role: "· Lead on one",
    description:
        "Apps for field inspectors. I led the API integration on the first, then led a second inspection app built from the same base.",
    skills: ['API INTEGRATION'],
  ),
  (
    title: "Release owner for 7 apps",
    role: "",
    description:
        "Built, signed and published 30 releases to the Sunmi App Store, each with release notes for QA and the business.",
    skills: ['SUNMI APP STORE'],
  ),
  (
    title: "Helping the team",
    role: "",
    description:
        "Onboarded 2 interns, wrote team guides for POS printing and kiosk scanners, added shared helpers to our boilerplate, and rebuilt our mockup app in Compose and Flutter for R&D.",
    skills: ['DOCS', 'MENTORING'],
  ),
];

class WorkSection extends StatefulWidget {
  const WorkSection({super.key});

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppLayout.sectionPaddingY),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      child: ContentWrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "JPS Group of Companies (Ziaplex, PMTI, DIGIPEP OPC) · 2023 — PRESENT",
              style: AppText.sectionEyebrow,
            ),
            const SizedBox(height: 10),

            Text(
              "Professional Work",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                'Native Android apps in healthcare, financial assistance and agriculture, used by patients, pharmacies, merchants and field officers on phones and Sunmi POS devices. I lead several of them and own their releases.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 14),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                WorkPill(title: 'healthcare'),
                WorkPill(title: 'payments & financial aid'),
                WorkPill(title: 'offline-first'),
                WorkPill(title: 'pos & kiosk hardware'),
              ],
            ),

            //* NDA NOTE
            const SizedBox(height: 42),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.noticeBg,
                border: Border.all(color: AppColors.noticeBorder, width: 1),
                borderRadius: BorderRadius.circular(AppRadius.banner),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 30,
                    width: 30,

                    decoration: BoxDecoration(
                      color: AppColors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/lock.svg',
                      height: 16,
                      width: 16,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.6,
                          color: AppColors.noticeText,
                        ),
                        children: [
                          TextSpan(
                            text: 'Note on confidentiality — ',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.noticeTextStrong,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          TextSpan(
                            text:
                                "my professional work is under NDA. Client and project names are generalized and I can't share screenshots, but every app below is real, and the live ones are in production today.",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //* WORK CARD
            const SizedBox(height: 38),
            _workHighlights(context),

            //* WORK LIST
            const SizedBox(height: 26),
            _workList(context),
          ],
        ),
      ),
    );
  }

  Widget _workHighlights(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return Column(
      children: [
        //? ========= for desktop
        if (!isMobile)
          IntrinsicHeight(
            child: Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: WorkCard(
                    number: "01",
                    status: "NDA · LIVE",
                    description:
                        "Pharmacies scan a patient's e-prescription, dispense the medicines covered by their health benefits or out-of-pocket, add e-signature, and print a receipt, all on a handheld POS device.",
                    title: "Pharmacy point-of-sale app",
                    tech: [
                      'LEAD',
                      'HEALTHCARE',
                      'SUNMI POS',
                      'THERMAL RECEIPT PRINTING',
                      'QR SCANNER',
                      'NATIVE ANDROID',
                      'KOTLIN',
                    ],
                    bulletInfo: [
                      "Built it from an empty project as the lead",
                      "Partial dispensing with benefit balance checks, so benefits are never over-dispensed",
                      "Out-of-pocket payment when a patient's benefits don't cover the full prescription",
                      "QR scanning for faster processing",
                      "E-signature as proof of dispensing, plus thermal receipt printing",
                      "Supports English and Filipino",
                    ],
                  ),
                ),

                Expanded(
                  child: WorkCard(
                    number: "02",
                    status: "NDA · LIVE",
                    description:
                        "Field officers register people for an assistance program and verify their identity, even in areas with no signal. Records sync once they're back online.",
                    title: "Beneficiary onboarding (KYC) app",
                    tech: [
                      'LEAD',
                      'OFFLINE-FIRST',
                      'ML KIT',
                      'NATIVE ANDROID',
                      'KOTLIN',
                    ],
                    bulletInfo: [
                      "ID capture, face detection, and document and QR scanning with ML Kit",
                      "E-signature as another source of verification",
                      "Background image compression, zipping images, and notifications",
                      "Offline records with backup, search, duplicate checks and safe database migrations",
                      "Fixed recurring field issues and shipped it to production with a migration guide",
                    ],
                  ),
                ),

                Expanded(
                  child: WorkCard(
                    number: "03",
                    status: "NDA · LIVE",
                    title: "Farm services app",
                    description:
                        "Farmers map their land, track each crop season, and book services like hauling, land preparation and drone spraying from their phone. They can also sell their harvest, pre-order supplies and pay through an in-app wallet.",
                    tech: [
                      'BOOKING',
                      'GOOGLE MAPS',
                      'AGRICULTURE',
                      'NATIVE ANDROID',
                      'KOTLIN',
                    ],
                    bulletInfo: [
                      "Main builder of service booking: step-by-step booking, tracking, cancellation, ratings and problem reports",
                      "Built crop season tracking, with photos for each growth phase through to harvest",
                      "Redesigned the farm geotagging flow, where farmers trace their land on Google Maps",
                      "Built the sell-stock and trading screens, supply pre-orders, and a new payment method screen",
                    ],
                  ),
                ),
              ],
            ),
          ),

        //? ========= for mobile
        if (isMobile)
          Column(
            children: [
              WorkCard(
                number: "01",
                status: "NDA · LIVE",
                description:
                    "Pharmacies scan a patient's e-prescription, dispense the medicines covered by their health benefits or out-of-pocket, add e-signature, and print a receipt, all on a handheld POS device.",
                title: "Pharmacy point-of-sale app",
                tech: [
                  'LEAD',
                  'HEALTHCARE',
                  'SUNMI POS',
                  'THERMAL RECEIPT PRINTING',
                ],
                bulletInfo: [
                  "Built it from an empty project as the lead",
                  "Partial dispensing with benefit balance checks, so benefits are never over-dispensed",
                  "Out-of-pocket payment when a patient's benefits don't cover the full prescription",
                  "E-signature as proof of dispensing, plus thermal receipt printing",
                  "Supports English and Filipino",
                ],
              ),
              const SizedBox(height: 16),
              WorkCard(
                number: "02",
                status: "NDA · LIVE",
                description:
                    "Field officers register people for an assistance program and verify their identity, even in areas with no signal. Records sync once they're back online.",
                title: "Beneficiary onboarding (KYC) app",
                tech: [
                  'LEAD',
                  'OFFLINE-FIRST',
                  'ML KIT',
                  'NATIVE ANDROID',
                  'KOTLIN',
                ],
                bulletInfo: [
                  "ID capture, face detection, and document and QR scanning with ML Kit",
                  "E-signature as another source of verification",
                  "Background image compression, zipping images, and notifications",
                  "Offline records with backup, search, duplicate checks and safe database migrations",
                  "Fixed recurring field issues and shipped it to production with a migration guide",
                ],
              ),
              const SizedBox(height: 16),
              WorkCard(
                number: "03",
                status: "NDA · LIVE",
                title: "Farm services app",
                description:
                    "Farmers map their land, track each crop season, and book services like hauling, land preparation and drone spraying from their phone. They can also sell their harvest, pre-order supplies and pay through an in-app wallet.",
                tech: [
                  'BOOKING',
                  'GOOGLE MAPS',
                  'AGRICULTURE',
                  'NATIVE ANDROID',
                  'KOTLIN',
                ],
                bulletInfo: [
                  "Main builder of service booking: step-by-step booking, tracking, cancellation, ratings and problem reports",
                  "Built crop season tracking, with photos for each growth phase through to harvest",
                  "Redesigned the farm geotagging flow, where farmers trace their land on Google Maps",
                  "Built the sell-stock and trading screens, supply pre-orders, and a new payment method screen",
                ],
              ),
            ],
          ),
      ],
    );
  }

  Widget _workList(BuildContext context) {
    final visible = _expanded ? _workItems : _workItems.take(3).toList();

    return Column(
      children: [
        AnimatedSize(
          alignment: Alignment.topCenter,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(width: 1, color: AppColors.border),
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Column(
              // column that holds the list
              children: [
                for (final (index, item) in visible.indexed)
                  WorkList(
                    title: item.title,
                    contribution: item.role,
                    description: item.description,
                    skill: item.skills,
                    isLast: index == visible.length - 1,
                  ),
              ],
            ),
          ),
        ),

        //* button
        const SizedBox(height: 16),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Text(_expanded ? "Hide" : "Show more work"),
        ),
      ],
    );
  }
}
