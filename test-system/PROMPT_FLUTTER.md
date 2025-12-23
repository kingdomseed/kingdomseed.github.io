# Prompt:
Act as a world-class Senior Flutter Developer and Mobile UI/UX Engineer from the year 2099. Build a hyper-realistic, retro-futuristic "MCP-2099 Mobile Portfolio Interface" using Flutter 3.x, Dart, Material Design 3, Custom Animations, and CustomPaint (with optional flutter_shaders). The application must be cross-platform: targeting iOS, Android, Web, Windows, macOS, and Linux. The design must be Awwwards-level: cinematic, grid-based, and heavily reliant on custom Flutter widgets and glassmorphism effects.

## Core Aesthetic & Vibe:
• **Style**: High-fidelity Retro-Futurism / Cyberpunk (Year 2099) adapted for mobile-first interfaces.
• **Visual Language**: Clean, grid-based layouts with Material Design 3 foundation, holographic UI elements, glassmorphism (BackdropFilter), and cinematic typography.
• **Color Palette**:
  ○ **Dark Mode** (Primary): Deep Space Black (#0A0A0F), Neon Cyan (#00E5FF), Neon Purple (#B388FF), Accent Cyan (#80DEEA)
  ○ **Light Mode** (Optional): Stark White (#F5F5F7) with technical blue accents (#2962FF) and subtle gray (#ECEFF1)
• **Typography**:
  ○ **Display/Headers**: Orbitron or Exo 2 (Google Fonts) for futuristic impact
  ○ **Body**: Inter for readability and modern feel
  ○ **Monospace**: JetBrains Mono for code snippets, data, and technical details
• **Visual Effects**:
  ○ Glassmorphism using BackdropFilter with blur
  ○ Grid patterns rendered with CustomPaint
  ○ Holographic gradients using ShaderMask and LinearGradient
  ○ Parallax scrolling effects with scroll offset calculations
  ○ Floating particle effects (optional: using flame package)

## Technical Stack & Libraries

### Framework
• **Flutter 3.x** (Dart 3.x)
• **Material Design 3** with custom ThemeData extensions

### State Management & Architecture
• **Provider** or **Riverpod** for reactive state management
• **Get_It** for dependency injection and service locator pattern
• **MVVM Architecture** (Model-View-ViewModel) for clean separation of concerns

### Animation & Visual Libraries
• **flutter_animate** - Declarative animation sequences with chaining
• **rive** - Vector animations for complex motion graphics (holographic ring, logo animations)
• **shimmer** - Loading state shimmer effects
• Custom **AnimationController** and **TweenSequence** for complex multi-stage animations

### UI Enhancement Packages
• **glassmorphism** (or custom BackdropFilter implementations)
• **fl_chart** - Radar charts for skill visualization
• **flutter_staggered_grid_view** - Bento-grid layouts for portfolio cards
• **gradient_borders** - Neon outline effects on cards
• **custom_refresh_indicator** - Themed pull-to-refresh

### Platform Integration
• **url_launcher** - External links (email, LinkedIn, GitHub)
• **share_plus** - Share profile functionality
• **pdf** - Generate and download resume as PDF
• **responsive_framework** - Adaptive layouts across device sizes

### 3D & Advanced Graphics (Optional)
• **flame** - 2D game engine for particle systems and background effects
• **flutter_shaders** - Custom fragment shaders for advanced visual effects

### Navigation
• **go_router** or **Navigator 2.0** for declarative routing with deep linking support

## Key Features & Components

### 1. Cinematic Splash Screen
• **Visuals**: A full-screen animated gradient background (Deep Space Black → Neon Purple) with a rotating holographic ring as the centerpiece. Terminal-style loading text that decodes character-by-character ("INITIALIZING_SYSTEM" → "LOADING_ASSETS" → "SYSTEM_READY"). Custom circular progress indicator with gradient stroke and scanline effect.
• **Implementation**:
  ○ **Widget**: StatefulWidget with initState triggering animation sequence
  ○ **Animation**: AnimationController with TweenSequence for multi-stage transitions:
    - Stage 1 (0.0-0.5s): Fade in background gradient
    - Stage 2 (0.3-1.0s): Holographic ring rotation starts (Rive animation or CustomPaint)
    - Stage 3 (0.5-1.5s): Loading text decodes using Timer with 50ms intervals
    - Stage 4 (1.5-2.0s): Progress indicator completes (0 → 100%)
    - Stage 5 (2.0-2.5s): Fade out entire screen using AnimatedOpacity
  ○ **Holographic Ring**:
    - Option A: Rive animation with continuous 360° rotation over 3 seconds
    - Option B: CustomPaint with RadialGradient (Neon Cyan → Purple) and rotation animation
  ○ **Transition**: Use PageRouteBuilder with FadeTransition to home screen
• **Duration**: 2-3 seconds total, smooth fade-out transition

### 2. Hero Home Screen
• **Background**: Animated gradient background transitioning between dark space colors (Deep Space Black, Dark Purple, Dark Cyan). Grid pattern overlay using CustomPaint with perspective effect (lines fade toward horizon). Optional: Rive particle animation or flame particles floating in background layers.
• **UI Elements**:
  ○ **Hero Text**: Large display typography (Orbitron, 56sp+) with text:
    ```
    "Flutter Engineer.
    Cross-Platform Specialist."
    ```
  ○ Gradient text effect using ShaderMask with LinearGradient (Cyan → Purple)
  ○ Typewriter animation: Text appears character by character (50ms per char)
  ○ **Subtitle**: "Jason Holt - Independent Developer & Product Designer"
  ○ **Location Badge**: "Frankfurt, Germany" with flag icon
  ○ **Floating Tech Badges**: 5-6 circular badges displaying key stats:
    - "5 Platforms"
    - "4.8★ Rating"
    - "85% Retention"
    - "200+ Testers"
  ○ Each badge has subtle float animation using sine wave motion (AnimatedPositioned + AnimationController)
  ○ Tap interaction: Scale animation (0.9x → 1.1x → 1.0x over 300ms)
• **Implementation**:
  ○ **Layout**: CustomScrollView with SliverAppBar (floating glassmorphic app bar)
  ○ **Background Grid**: CustomPainter rendering perspective grid with:
    - Grid spacing: 50px at bottom, tapering to 10px at top
    - Line color: Neon Cyan with alpha gradient (1.0 bottom → 0.0 top)
    - Paint strokeWidth: 1.0, blendMode: BlendMode.lighten
  ○ **Parallax Effect**: Background layers move at 0.3x scroll speed using Transform.translate
  ○ **Floating Badges**: Stack with AnimatedPositioned widgets
    - Animation: Continuous sine wave using AnimationController
    - Stagger: Each badge offset by 100ms delay
• **Animations**:
  ○ Staggered fade-in on screen load using flutter_animate with 100ms delays
  ○ Parallax scrolling with scroll offset * 0.3
  ○ Badge hover/tap: GestureDetector with scale animation

### 3. Interactive Skills Dashboard
• **Visual Design**: Bento-grid layout featuring glass cards with technical skills. Central radar chart visualizing proficiency across key areas. Interactive cards that expand on tap to show detailed technology lists.
• **Layout**:
  ○ **Primary Widget**: StaggeredGridView or GridView.builder with:
    - Mobile: 1 column
    - Tablet: 2 columns
    - Desktop: 3 columns
  ○ **Card Design**: Glass morphism cards using:
    ```dart
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.05)],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: neonCyan.withOpacity(0.3)),
          ),
        ),
      ),
    )
    ```
• **Skills Data Structure**:
  ```dart
  class Skill {
    final String name;
    final String category;
    final double proficiency; // 0-100
    final List<String> technologies;
  }
  ```
  ○ **Skills to Display**:
    - Flutter/Dart: 95% (Provider, Get_It, Riverpod, Platform Channels, Custom Animations)
    - State Management: 90% (MVVM, Clean Architecture, Provider pattern)
    - Platform Channels: 80% (Native iOS/Android integration)
    - Firebase Integration: 85% (Crashlytics, Analytics, Cloud Functions)
    - Performance Optimization: 85% (40% load time reduction achievement)
    - UI/UX Design: 90% (Custom widgets, Material Design 3, Glassmorphism)
• **Radar Chart**:
  ○ Use fl_chart RadarChart widget
  ○ 6 axes for skill categories
  ○ Neon Cyan fill with glow effect
  ○ Animated drawing on screen entry (0 → full value over 1 second)
• **Interactive Behavior**:
  ○ Tap card: Expand using AnimatedContainer (height: 100 → 200)
  ○ Show detailed technology list on expansion
  ○ Hero transition to full skill detail screen (optional)
• **Animations**:
  ○ flutter_animate stagger sequence on grid load
  ○ Radar chart animated drawing using AnimationController
  ○ Card expansion smooth height transition (Curves.easeOutCubic, 300ms)

### 4. Project Portfolio Showcase
• **Visual Design**: Grid layout with project cards featuring app icons, titles, descriptions, and tech stack badges. Filter chips at top for categories (All, Mobile, EdTech, Tools). Hero transitions to detailed project view.
• **Layout**:
  ○ **FilterChip Row**: Horizontal scrollable row of FilterChip widgets
    - Categories: All, Mobile Apps, EdTech, Creative Tools
    - Selected chip: Neon Cyan background with glow
  ○ **Project Grid**: GridView.builder with 2 columns (mobile), 3 columns (desktop)
  ○ **Project Card**: Glass card with:
    - App icon (80x80, rounded corners)
    - Project title (Orbitron, 20sp)
    - Short description (Inter, 14sp)
    - Tech stack badges (Chips with gradient borders)
    - Rating stars (if applicable)
• **Featured Projects**:
  ○ **Mythic GME 2e** (Primary Showcase):
    - Icon: App logo
    - Title: "Mythic GME 2e"
    - Description: "Official companion app for solo RPG game masters. Cross-platform deployment across 5 platforms with MVVM architecture."
    - Tech Stack: Flutter, Dart, Provider, Get_It, Firebase, Sentry
    - Stats: 4.8★ rating, 5 platforms (iOS, Android, Windows, macOS, Linux), 85% retention, 200+ beta testers
    - Achievements: 40% load time reduction, MVVM architecture, community-driven development
  ○ **VR Learning Lab Management**:
    - Description: "XR platform management system enabling school-wide VR adoption across multiple grade levels and subjects."
    - Impact: $200,000+ in grants secured, school-wide adoption
    - Tech: Unity3D, C#, Custom tools
  ○ **IB Computer Science Curriculum Tools**:
    - Description: "Educational companion apps and tools for International Baccalaureate Computer Science program."
    - Impact: 150% enrollment increase, highest exam pass rates in network history
    - Tech: Flutter Web, Firebase
• **Implementation**:
  ○ **Data Model**:
    ```dart
    class Project {
      final String id;
      final String name;
      final String description;
      final String category;
      final List<String> techStack;
      final String? iconAsset;
      final List<String>? screenshots;
      final double? rating;
      final Map<String, dynamic>? stats;
    }
    ```
  ○ **State Management**: Provider with filter state
  ○ **Filtering**: Update displayed list based on selected FilterChip
• **Interaction**:
  ○ Tap card: Hero transition to ProjectDetailScreen
  ○ Detail screen: PageView with screenshots, full description, tech stack list, external links
  ○ Swipe between projects in detail view
• **Animations**:
  ○ Filter selection: Animated color change and scale (1.0 → 1.05 → 1.0)
  ○ Card appearance: Staggered fade-in with 50ms delays
  ○ Hero transition: Shared element animation for icon and title

### 5. Experience Timeline
• **Visual Design**: Vertical timeline with glass cards for each role. CustomPaint connector lines between timeline nodes. Achievement badges that pulse on entry. Expandable cards showing detailed responsibilities.
• **Layout**:
  ○ **ListView.builder** with timeline items
  ○ **Timeline Node**: Circle indicator with gradient fill (Neon Cyan)
  ○ **Connector Line**: CustomPaint vertical line connecting nodes
  ○ **Experience Card**: Glass card positioned to the right of timeline
• **Timeline Data**:
  ```dart
  class Experience {
    final String role;
    final String company;
    final String location;
    final DateTime startDate;
    final DateTime? endDate; // null for current
    final String description;
    final List<String> responsibilities;
    final List<Achievement> achievements;
  }
  ```
  ○ **Entries**:
    1. **Independent Software Developer** (Aug 2024 - Present)
       - Company: Jason Holt Digital (US LLC)
       - Location: Frankfurt, Germany
       - Key Achievement: Launched Mythic GME 2e app across 5 platforms
       - Responsibilities: Product lifecycle, MVVM architecture, community management (200+ beta testers)
    2. **DP Computer Science Teacher & Department Chair** (July 2021 - June 2024)
       - Company: Uplift Education (Atlas Preparatory)
       - Location: Dallas, TX, USA
       - Achievements: Top Hat Award (Oct 2023), Record IB CS exam results, $200K+ in VR grants
       - Responsibilities: Curriculum development, VR integration, faculty training
    3. **Computer Science Teacher** (June 2017 - June 2019)
       - Company: Crowley High School
       - Location: Crowley, TX, USA
       - Achievements: Unity certification program, UIL competition coaching
• **Achievement Badges**:
  ○ Icons for key accomplishments (trophy, star, certificate)
  ○ Pulse animation: Scale 1.0 → 1.1 → 1.0 continuously (2s duration)
  ○ Appear on scroll with fade-in
• **Implementation**:
  ○ **CustomPainter for Timeline Line**:
    ```dart
    class TimelinePainter extends CustomPainter {
      void paint(Canvas canvas, Size size) {
        final paint = Paint()
          ..color = neonCyan.withOpacity(0.5)
          ..strokeWidth = 2.0
          ..style = PaintingStyle.stroke;
        canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
      }
    }
    ```
  ○ **Expandable Card**: ExpansionTile or custom AnimatedContainer
  ○ **Scroll Detection**: VisibilityDetector to trigger animations on scroll
• **Animations**:
  ○ Timeline items fade in sequentially (stagger: 100ms)
  ○ Achievement badges pulse continuously
  ○ Card expansion: Smooth height animation (300ms, Curves.easeOut)
  ○ Connector line: Animated drawing from top to bottom on screen load

### 6. Certifications Grid
• **Visual Design**: Grid of interactive certification badges with 3D flip animation. Front shows logo/icon, back shows details (date, skills learned). Filter by category.
• **Layout**:
  ○ **GridView** with 2 columns (mobile), 4 columns (desktop)
  ○ **Badge Size**: 150x150 square cards with rounded corners
• **Categories & Certifications**:
  ○ **Cloud & Infrastructure**:
    - AWS Certified Cloud Practitioner (Valid through July 2027)
    - Cisco CCST Networking (April 2024)
  ○ **Mobile Development**:
    - App Development with Swift Certified User (Apple, December 2023)
    - Android Basics Nanodegree (Udacity, 2018)
  ○ **Development Tools & Methods**:
    - Professional Scrum Master I (Scrum.org, June 2022)
    - Unity Certified User: Programmer (Unity Technologies, July 2022)
    - IT Specialist - Python (Certiport, November 2023)
  ○ **Adobe Creative Suite**:
    - Adobe Certified Professional: Visual Design (Photoshop)
    - Adobe Certified Professional: Video Design (Premiere Pro)
    - Adobe Certified Professional: Graphic Design (Illustrator)
• **Flip Animation**:
  ○ **Implementation**: TweenAnimationBuilder with Transform
    ```dart
    TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: isFlipped ? 180 : 0),
      duration: Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Transform(
          transform: Matrix4.rotationY(value * pi / 180),
          alignment: Alignment.center,
          child: value < 90 ? frontWidget : backWidget,
        );
      },
    )
    ```
  ○ **Front**: Badge logo/icon with name
  ○ **Back**: Issue date, skills learned, validity period
• **Interaction**:
  ○ Tap badge: Flip animation (front ↔ back)
  ○ Filter chips at top to show specific categories
• **Animations**:
  ○ Grid load: Staggered appearance with 30ms delays
  ○ 3D flip: Smooth rotation with perspective transform
  ○ Hover (desktop): Subtle lift effect (elevation increase)

### 7. Contact & CTA Section
• **Visual Design**: Prominent "Initialize Contact Protocol" button with gradient and glow. Social media icons with animated hover states. Resume download button. Optional contact form. Particle background effect (optional).
• **Layout**:
  ○ **Primary CTA**: Large ElevatedButton with custom styling:
    ```dart
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 0,
      ).copyWith(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [neonCyan, neonPurple]),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: neonCyan.withOpacity(0.5), blurRadius: 20, spreadRadius: 2),
          ],
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text("Initialize Contact Protocol", style: buttonTextStyle),
        ),
      ),
    )
    ```
  ○ **Social Links**: Row of IconButtons:
    - Email: holt.jason@icloud.com (uses url_launcher: mailto)
    - LinkedIn: linkedin.com/in/jasonholtsoftware (opens in browser)
    - GitHub: github.com/username (opens in browser)
  ○ **Resume Download**: Button triggering PDF generation
    ```dart
    // Using pdf package
    final pdf = pw.Document();
    // Add resume content
    final bytes = await pdf.save();
    // Trigger download or share
    ```
  ○ **Share Profile**: Button using share_plus
    ```dart
    Share.share('Check out Jason Holt\'s portfolio: [URL]');
    ```
• **Background Effect** (Optional):
  ○ Animated particles using flame or custom CustomPaint
  ○ Floating dots with slow drift motion
  ○ Parallax movement based on scroll
• **Implementation**:
  ○ url_launcher for external links
  ○ pdf package for resume generation
  ○ share_plus for sharing
  ○ GestureDetector with scale animation on tap
• **Animations**:
  ○ Button hover: Glow intensity increase (desktop)
  ○ Button tap: Scale 0.95 → 1.0 (mobile)
  ○ Icon hover: Color transition + slight lift
  ○ Background particles: Continuous drift animation

## Navigation & Architecture

### Navigation System
• **Design**: Bottom Navigation Bar (mobile), Navigation Rail (tablet/desktop), Drawer for secondary actions
• **Routes**:
  ○ `/` - Home (Hero Screen)
  ○ `/skills` - Skills Dashboard
  ○ `/projects` - Project Portfolio
  ○ `/experience` - Experience Timeline
  ○ `/contact` - Contact & CTA
• **Implementation**:
  ○ Use **go_router** for declarative routing:
    ```dart
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),
        GoRoute(path: '/skills', builder: (context, state) => SkillsScreen()),
        GoRoute(path: '/projects', builder: (context, state) => ProjectsScreen()),
        GoRoute(path: '/projects/:id', builder: (context, state) => ProjectDetailScreen(id: state.params['id']!)),
        GoRoute(path: '/experience', builder: (context, state) => ExperienceScreen()),
        GoRoute(path: '/contact', builder: (context, state) => ContactScreen()),
      ],
    );
    ```
  ○ Deep linking support for web
  ○ Hero transitions between screens for shared elements
• **Bottom Navigation** (Mobile):
  ○ 5 tabs with icons + labels
  ○ Selected state: Neon Cyan indicator
  ○ Smooth transition animation between tabs
• **Navigation Rail** (Desktop):
  ○ Persistent left-side rail
  ○ Glassmorphic background with blur
  ○ Hover effect: Icon glow

### App Architecture (MVVM)
• **Model**: Data classes (Project, Experience, Skill, Certification)
• **View**: Flutter widgets (Screens and reusable components)
• **ViewModel**: Provider classes managing state and business logic

**Folder Structure**:
```
lib/
├── main.dart
├── app.dart (MaterialApp configuration with theme)
├── core/
│   ├── theme/
│   │   ├── app_theme.dart (ThemeData with custom colors)
│   │   ├── colors.dart (Color constants)
│   │   └── text_styles.dart (Typography definitions)
│   ├── constants/
│   │   └── strings.dart
│   └── utils/
│       └── animations.dart
├── data/
│   ├── models/
│   │   ├── project.dart
│   │   ├── experience.dart
│   │   ├── skill.dart
│   │   └── certification.dart
│   └── repositories/
│       └── portfolio_repository.dart
├── presentation/
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── home_screen.dart
│   │   ├── skills_screen.dart
│   │   ├── projects_screen.dart
│   │   ├── project_detail_screen.dart
│   │   ├── experience_screen.dart
│   │   └── contact_screen.dart
│   ├── widgets/
│   │   ├── glass_card.dart
│   │   ├── neon_button.dart
│   │   ├── tech_badge.dart
│   │   ├── timeline_item.dart
│   │   └── custom_painters/
│   │       ├── grid_background_painter.dart
│   │       └── timeline_line_painter.dart
│   └── animations/
│       └── typewriter_text.dart
└── providers/
    ├── theme_provider.dart
    └── portfolio_provider.dart
```

## Custom Widgets Library

### 1. GlassCard Widget
• **Purpose**: Reusable glassmorphism container for consistent visual style
• **Properties**:
  ○ `double blurIntensity` (default: 10.0)
  ○ `Color borderColor` (default: Neon Cyan with opacity)
  ○ `Widget child` (content)
  ○ `BorderRadius borderRadius` (default: 16)
• **Implementation**:
```dart
class GlassCard extends StatelessWidget {
  final Widget child;
  final double blurIntensity;
  final Color borderColor;
  final BorderRadius borderRadius;

  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurIntensity, sigmaY: blurIntensity),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: borderRadius,
            border: Border.all(color: borderColor, width: 1),
          ),
          child: child,
        ),
      ),
    );
  }
}
```

### 2. NeonButton Widget
• **Purpose**: CTA button with gradient background and glow effect
• **Properties**:
  ○ `String text`
  ○ `VoidCallback onPressed`
  ○ `List<Color> gradientColors` (default: [Cyan, Purple])
• **Implementation**:
```dart
class NeonButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> gradientColors;

  @override
  _NeonButtonState createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: widget.gradientColors),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: widget.gradientColors.first.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
```

### 3. TechBadge Widget
• **Purpose**: Floating technology badges with animation
• **Properties**:
  ○ `String label`
  ○ `IconData? icon`
  ○ `Color color`
• **Implementation**: Chip with float animation using AnimatedPositioned

### 4. GridBackground CustomPainter
• **Purpose**: Cyberpunk perspective grid background
• **Implementation**:
```dart
class GridBackgroundPainter extends CustomPainter {
  final Color lineColor;
  final double spacing;

  GridBackgroundPainter({required this.lineColor, this.spacing = 50.0});

  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..blendMode = BlendMode.lighten;

    // Vertical lines with perspective
    for (double x = 0; x < size.width; x += spacing) {
      final topX = size.width / 2 + (x - size.width / 2) * 0.3;
      canvas.drawLine(Offset(topX, 0), Offset(x, size.height), paint);
    }

    // Horizontal lines fading toward top
    for (double y = size.height; y > 0; y -= spacing) {
      final opacity = (y / size.height);
      paint.color = lineColor.withOpacity(opacity * 0.3);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
```

### 5. HolographicRing Widget
• **Purpose**: Animated logo/loading element
• **Implementation**: Rive animation (recommended) or CustomPaint with rotation
• **Rive Option**: Export holographic ring animation from Rive, load with rive package
• **CustomPaint Option**: Draw torus with gradient, animate rotation with AnimationController

## Animation Specifications

### Screen Transitions
• **Type**: Fade + Slide combination
• **Duration**: 300ms
• **Curve**: Curves.easeOutCubic
• **Implementation**:
```dart
PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => NextScreen(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeOutCubic;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(position: animation.drive(tween), child: FadeTransition(opacity: animation, child: child));
  },
)
```

### Micro-interactions
• **Button Tap**: Scale animation (1.0 → 0.95 → 1.0) over 150ms
• **Card Hover** (Desktop): Elevation increase (2 → 8) + glow effect over 200ms
• **Badge Float**: Continuous sine wave motion
  ```dart
  AnimatedPositioned(
    duration: Duration(seconds: 2),
    top: baseTop + sin(_controller.value * 2 * pi) * 10,
    // ...
  )
  ```
• **Loading**: Shimmer effect using shimmer package

### Complex Animations
• **Splash Screen Sequence**: TweenSequence with 5 stages (described in Splash Screen section)
• **Skills Chart**: Animated value from 0 to target proficiency over 1 second (Curves.easeOut)
• **Timeline**: Sequential item appearance with 100ms stagger
  ```dart
  flutter_animate:
  ListView.builder(
    itemBuilder: (context, index) {
      return TimelineItem().animate().fadeIn(delay: Duration(milliseconds: index * 100));
    },
  )
  ```
• **Background Parallax**: Scroll offset calculation
  ```dart
  Transform.translate(
    offset: Offset(0, scrollOffset * 0.3),
    child: BackgroundGrid(),
  )
  ```

### Performance Optimization
• Use **const constructors** wherever possible
• Wrap complex animations in **RepaintBoundary**
• Cache **AnimationController** instances, dispose properly
• Use **AnimatedBuilder** instead of setState for animation-driven rebuilds
• Lazy load heavy widgets (images, charts) with **FutureBuilder** or **StreamBuilder**

## Responsive Design

### Breakpoints
```dart
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < Breakpoints.mobile;
bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= Breakpoints.mobile && MediaQuery.of(context).size.width < Breakpoints.desktop;
bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= Breakpoints.desktop;
```

### Adaptive Layouts
• **Mobile (<600px)**:
  ○ Single column layouts
  ○ Bottom Navigation Bar
  ○ Full-width cards
  ○ Stack-based content
  ○ Typography: Base 16sp

• **Tablet (600-1024px)**:
  ○ Two column grids
  ○ Bottom Navigation Bar or Navigation Rail (user preference)
  ○ Larger card sizes
  ○ Typography: Base 17sp

• **Desktop (>1024px)**:
  ○ Three column grids
  ○ Persistent Navigation Rail
  ○ Top bar with actions
  ○ Sidebar layouts for detail views
  ○ Typography: Base 18sp
  ○ Mouse hover effects enabled

### Implementation
• Use **LayoutBuilder** for widget-level responsive behavior:
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 600) {
      return MobileLayout();
    } else if (constraints.maxWidth < 1024) {
      return TabletLayout();
    } else {
      return DesktopLayout();
    }
  },
)
```
• Use **MediaQuery** for global device info
• **responsive_framework** package for easier breakpoint management

## Platform-Specific Features

### iOS
• **Cupertino Widgets**: Optional toggle for Cupertino-style navigation
• **Haptic Feedback**: Use `HapticFeedback.lightImpact()` on button taps
• **SF Symbols**: Use SF Symbols icons with fallbacks for other platforms
• **Safe Area**: Properly handle notches and home indicators with SafeArea widget
• **Share Sheet**: Native iOS share sheet using share_plus

### Android
• **Material Design 3**: Primary design language
• **Bottom Sheets**: Use showModalBottomSheet for detail views
• **Adaptive Icons**: Provide adaptive icon assets
• **Material You**: Dynamic color support (optional)
• **Share Intent**: Android-style share using share_plus

### Web
• **URL Routing**: Full URL routing with go_router
• **SEO Meta Tags**: Add meta tags in web/index.html:
  ```html
  <meta name="description" content="Jason Holt - Flutter Developer Portfolio">
  <meta property="og:title" content="MCP-2099 Portfolio">
  ```
• **Keyboard Navigation**: Tab navigation for accessibility
• **Cursor Hover**: MouseRegion for hover effects
• **Responsive Images**: Use responsive image loading

### Desktop (Windows, macOS, Linux)
• **Window Sizing**: Set minimum/maximum window size in main.dart
• **Keyboard Shortcuts**: Implement shortcuts for navigation
• **Menu Bar**: macOS menu bar integration (optional)
• **System Tray**: Windows system tray icon (optional)
• **Mouse Interactions**: Right-click context menus, hover tooltips

### Platform Checks
```dart
import 'dart:io' show Platform;

if (Platform.isIOS) {
  // iOS-specific code
} else if (Platform.isAndroid) {
  // Android-specific code
}

// For web:
import 'package:flutter/foundation.dart' show kIsWeb;

if (kIsWeb) {
  // Web-specific code
}
```

## Data Models & Content

### Project Model
```dart
class Project {
  final String id;
  final String name;
  final String description;
  final String category; // Mobile, EdTech, Tool
  final List<String> techStack;
  final String? iconAsset;
  final List<String>? screenshots;
  final double? rating;
  final Map<String, dynamic>? stats; // e.g., {"platforms": 5, "retention": 0.85}
  final String? externalLink;

  Project({required this.id, required this.name, required this.description, required this.category, required this.techStack, this.iconAsset, this.screenshots, this.rating, this.stats, this.externalLink});
}
```

### Experience Model
```dart
class Experience {
  final String id;
  final String role;
  final String company;
  final String location;
  final DateTime startDate;
  final DateTime? endDate; // null = current position
  final String description;
  final List<String> responsibilities;
  final List<Achievement> achievements;

  Experience({required this.id, required this.role, required this.company, required this.location, required this.startDate, this.endDate, required this.description, required this.responsibilities, required this.achievements});

  String get period {
    final start = DateFormat('MMM yyyy').format(startDate);
    final end = endDate != null ? DateFormat('MMM yyyy').format(endDate!) : 'Present';
    return '$start - $end';
  }
}

class Achievement {
  final String title;
  final String description;
  final IconData icon;

  Achievement({required this.title, required this.description, required this.icon});
}
```

### Skill Model
```dart
class Skill {
  final String name;
  final String category;
  final double proficiency; // 0-100
  final List<String> technologies;
  final String? description;

  Skill({required this.name, required this.category, required this.proficiency, required this.technologies, this.description});
}
```

### Certification Model
```dart
class Certification {
  final String id;
  final String name;
  final String issuer;
  final DateTime issueDate;
  final DateTime? expiryDate;
  final String category;
  final String? logoAsset;
  final List<String> skillsLearned;

  Certification({required this.id, required this.name, required this.issuer, required this.issueDate, this.expiryDate, required this.category, this.logoAsset, required this.skillsLearned});
}
```

### Data Mapping from Resume
• Extract data from **professional-inventory.md**
• Structure as JSON or Dart constants
• Load into Provider on app initialization
• **Example**: Create `lib/data/portfolio_data.dart` with hardcoded lists or JSON parsing

## Accessibility

### Semantic Widgets
• Wrap **CustomPaint** widgets with **Semantics**:
```dart
Semantics(
  label: 'Holographic ring animation',
  child: CustomPaint(painter: HolographicRingPainter()),
)
```
• Use **MergeSemantics** for grouped elements
• **ExcludeSemantics** for purely decorative elements (background grids, particles)

### Screen Reader Support
• Provide **semanticsLabel** for all images:
```dart
Image.asset('app_icon.png', semanticLabel: 'Mythic GME 2e app icon')
```
• Announce state changes with **Semantics(liveRegion: true)**
• Ensure logical reading order in widget tree

### Visual Accessibility
• **High Contrast Mode**: Detect and adjust colors
```dart
bool isHighContrast = MediaQuery.of(context).highContrast;
```
• **Minimum Text Size**: 16sp for body text
• **Touch Targets**: Minimum 48x48 logical pixels
• **Color Contrast**: Ensure 4.5:1 ratio (WCAG AA standard)

### Input Methods
• **Keyboard Navigation**: Focus nodes for desktop/web
```dart
FocusScope.of(context).requestFocus(myFocusNode);
```
• **Voice Control**: Compatible labels
• **Focus Management**: Proper focus traversal order

## Performance & Optimization

### Best Practices
• **Const Constructors**: Use `const` for immutable widgets
• **Lazy Loading**: Use `ListView.builder`, `GridView.builder` for large lists
• **Image Caching**: `CachedNetworkImage` for remote images
• **RepaintBoundary**: Isolate expensive paints
```dart
RepaintBoundary(
  child: CustomPaint(painter: ComplexPainter()),
)
```
• **Dispose Resources**: Always dispose AnimationControllers, TextEditingControllers
```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```
• **Keys**: Use keys for list items that can reorder
• **Avoid Unnecessary Rebuilds**: Use `Consumer` with Provider instead of rebuilding entire tree

### Target Metrics
• **Cold Start**: < 2 seconds on mid-range devices
• **Screen Transition**: < 300ms
• **Animation FPS**: 60fps minimum (use DevTools performance overlay)
• **Memory Usage**: < 100MB when idle
• **App Size**: < 50MB (use `flutter build --split-debug-info` for smaller builds)

### Performance Profiling
• Use **Flutter DevTools** to profile:
  ○ Performance overlay (FPS counter)
  ○ Memory profiler
  ○ Timeline view for jank detection
• Test on real devices, especially mid-range and low-end
• Use `flutter run --profile` for production-like performance

## Deployment & Build

### App Identity
• **Name**: MCP-2099 Portfolio - Jason Holt
• **Bundle ID**: com.jasonholt.portfolio
• **Version**: 1.0.0+1
• **Minimum SDK**: iOS 12.0, Android API 21 (Lollipop)

### Assets
• **App Icon**: 1024x1024 PNG with platform-specific variants (iOS, Android, Windows, macOS, Linux)
• **Splash Screen**: Platform-specific splash assets
• **Fonts**:
  ○ Orbitron (or Exo 2) - Google Fonts
  ○ Inter - Google Fonts
  ○ JetBrains Mono - Google Fonts
• **Images**: Project icons, certification logos, screenshots
• **Animations**: Rive files (.riv) for complex animations

### Build Commands

**Mobile**:
```bash
flutter build apk --release  # Android APK
flutter build appbundle --release  # Android App Bundle (for Play Store)
flutter build ios --release  # iOS (requires macOS and Xcode)
```

**Desktop**:
```bash
flutter build macos --release  # macOS
flutter build windows --release  # Windows
flutter build linux --release  # Linux
```

**Web**:
```bash
flutter build web --release --web-renderer canvaskit  # Web with CanvasKit renderer
```

### Distribution

**Primary Deployment**: Web (Recommended)
• **Platform**: GitHub Pages, Firebase Hosting, or Netlify
• **URL**: portfolio.jasonholt.dev
• **PWA**: Add service worker for Progressive Web App capabilities
• **SEO**: Meta tags in `web/index.html`, sitemap.xml
• **Command**:
```bash
flutter build web --release
firebase deploy  # or push to gh-pages branch
```

**Secondary**: Native Apps (Optional)
• **iOS App Store**: Requires Apple Developer account, TestFlight for beta
• **Google Play Store**: Requires Google Play Console account
• **Microsoft Store**: Windows app submission
• **Mac App Store**: macOS app submission
• **Snap Store**: Linux app via snapcraft

### CI/CD Pipeline (GitHub Actions)

**Example Workflow**:
```yaml
name: Build and Deploy
on:
  push:
    branches: [main]
jobs:
  build-web:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.x'
      - run: flutter pub get
      - run: flutter test
      - run: flutter build web --release
      - name: Deploy to Firebase
        uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: '${{ secrets.GITHUB_TOKEN }}'
          firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
```

### Testing
• **Unit Tests**: Test models and business logic
• **Widget Tests**: Test individual widgets
• **Integration Tests**: Test full user flows
• **Command**: `flutter test`

---

## Summary

This prompt specifies a comprehensive **MCP-2099 Mobile Portfolio Interface** built with Flutter that showcases Jason Holt's expertise as a Flutter developer across 5+ platforms. The app features:
• **Retro-futuristic cyberpunk aesthetic** with Material Design 3 foundation
• **7 core screens**: Splash, Home, Skills, Projects, Experience, Certifications, Contact
• **Custom widgets** for glassmorphism, neon buttons, tech badges, and grid backgrounds
• **Advanced animations**: Splash sequence, parallax scrolling, hero transitions, staggered appearances
• **Real portfolio data**: Mythic GME 2e (4.8★, 5 platforms, 85% retention), VR Learning Lab, IB CS Tools, certifications, achievements
• **MVVM architecture** with Provider state management
• **Responsive design** for mobile, tablet, and desktop
• **Platform-specific features** for iOS, Android, Web, and Desktop
• **Performance optimizations** targeting <2s cold start, 60fps animations
• **Deployment** primarily as web app, with optional native app store distribution

This specification provides sufficient technical detail for an AI agent to implement a production-ready, cross-platform Flutter portfolio application that demonstrates world-class mobile development capabilities in a visually stunning retro-futuristic interface.
