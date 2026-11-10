const personalProjects = [
  (
    title: "DenuSpend",
    summary:
        "Track income and expenses, set a budget, and see where your money goes with charts for the last 7, 15 or 30 days. Synced in real time with Firebase.",
    details:
        "A spending tracker in Jetpack Compose that helps stop impulse buying. Log income and expenses, review recent transactions and monthly spending, set a budget, and check budget insights with charts for this month or the last 7, 15 or 30 days. Sign in with email (with verification) or Google, and your data syncs in real time with Firestore. Built on my own Compose boilerplate: MVVM, Hilt, WorkManager and Paging.",
    cardSkills: ['COMPOSE', 'HILT', 'FIRESTORE'],
    gallerySkills: ['KOTLIN', 'COMPOSE', 'HILT', 'FIREBASE AUTH', 'FIRESTORE'],
    images: [
      'placeholder/placeholder_screen_1.png',
      'placeholder/placeholder_screen_2.png',
      'placeholder/placeholder_screen_3.png',
      'placeholder/placeholder_screen_4.png',
    ],
    codeUrl: 'https://github.com/denuden/DenuSpend',
  ),
  (
    title: "DenuAnime",
    summary:
        "Browse, search and filter anime and characters from the Jikan API. MVVM with StateFlow and type-safe navigation.",
    details:
        "An anime collection app in Jetpack Compose, powered by the Jikan API. Browse trending and popular anime, search and filter titles and characters, and open detailed pages for each. Built with MVVM, Hilt for dependency injection, Retrofit, Coil, Kotlin Coroutines with StateFlow, and type-safe Compose navigation.",
    cardSkills: ['COMPOSE', 'HILT', 'RETROFIT'],
    gallerySkills: ['KOTLIN', 'COMPOSE', 'HILT', 'RETROFIT', 'COIL'],
    images: [
      'placeholder/placeholder_screen_2.png',
      'placeholder/placeholder_screen_3.png',
      'placeholder/placeholder_screen_4.png',
      'placeholder/placeholder_screen_1.png',
    ],
    codeUrl: 'https://github.com/denuden/DenuAnime',
  ),
  (
    title: "DenuAnime for Flutter",
    summary:
        "My anime app rebuilt in Flutter with Bloc and Dio, plus Firebase email sign-in, skeleton loading and pull to refresh.",
    details:
        "My Compose anime app rebuilt in Flutter to learn the framework properly. Cubits scoped per screen so opening one anime from another never shows stale data, a repository layer over Dio, and a sealed loading/data/error state for every request. Adds email sign-in with Firebase Auth, skeleton loading screens and pull to refresh.",
    cardSkills: ['BLOC', 'DIO', 'FIREBASE'],
    gallerySkills: ['FLUTTER', 'BLOC / CUBIT', 'DIO', 'FIREBASE AUTH'],
    images: [
      'placeholder/placeholder_screen_3.png',
      'placeholder/placeholder_screen_4.png',
      'placeholder/placeholder_screen_1.png',
      'placeholder/placeholder_screen_2.png',
    ],
    codeUrl: 'https://github.com/denuden/DenuAnime-Flutter',
  ),
];

const workItems = [
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

const aiSteps = [
  (
    number: "01",
    title: "Spec",
    text:
        "I describe the task. Claude drafts a spec and a plan, and nothing starts until I approve them.",
  ),
  (
    number: "02",
    title: "Build",
    text:
        "Specialized agents write the code on a task branch, kept away from tests and database migrations.",
  ),
  (
    number: "03",
    title: "Review",
    text:
        "A QA agent checks the change against the spec and writes tests for it. It has to pass to move on.",
  ),
  (
    number: "04",
    title: "Ship",
    text:
        "I approve the push, an agent reviews the pull request, and a person merges it.",
  ),
];

const workHighlightItems = [
  (
    title: "Pharmacy point-of-sale app",
    status: "NDA · LIVE",
    description:
        "Pharmacies scan a patient's e-prescription, dispense the medicines covered by their health benefits or out-of-pocket, add e-signature, and print a receipt, all on a handheld POS device.",
    tech: [
      'LEAD',
      'HEALTHCARE',
      'SUNMI POS',
      'THERMAL RECEIPT PRINTING',
      'QR SCANNER',
      'NATIVE ANDROID',
      'KOTLIN',
    ],
    bullets: [
      "Built it from an empty project as the lead",
      "Partial dispensing with benefit balance checks, so benefits are never over-dispensed",
      "Out-of-pocket payment when a patient's benefits don't cover the full prescription",
      "QR scanning for faster processing",
      "E-signature as proof of dispensing, plus thermal receipt printing",
      "Supports English and Filipino",
    ],
  ),
  (
    title: "Beneficiary onboarding (KYC) app",
    status: "NDA · LIVE",
    description:
        "Field officers register people for an assistance program and verify their identity, even in areas with no signal. Records sync once they're back online.",
    tech: ['LEAD', 'OFFLINE-FIRST', 'ML KIT', 'NATIVE ANDROID', 'KOTLIN'],
    bullets: [
      "ID capture, face detection, and document and QR scanning with ML Kit",
      "E-signature as another source of verification",
      "Background image compression, zipping images, and notifications",
      "Offline records with backup, search, duplicate checks and safe database migrations",
      "Fixed recurring field issues and shipped it to production with a migration guide",
    ],
  ),
  (
    title: "Farm services app",
    status: "NDA · LIVE",
    description:
        "Farmers map their land, track each crop season, and book services like hauling, land preparation and drone spraying from their phone. They can also sell their harvest, pre-order supplies and pay through an in-app wallet.",
    tech: ['BOOKING', 'GOOGLE MAPS', 'AGRICULTURE', 'NATIVE ANDROID', 'KOTLIN'],
    bullets: [
      "Main builder of service booking: step-by-step booking, tracking, cancellation, ratings and problem reports",
      "Built crop season tracking, with photos for each growth phase through to harvest",
      "Redesigned the farm geotagging flow, where farmers trace their land on Google Maps",
      "Built the sell-stock and trading screens, supply pre-orders, and a new payment method screen",
    ],
  ),
];
