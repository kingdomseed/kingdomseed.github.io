import '../models/models.dart';

/// Repository providing hardcoded portfolio data for Jason Holt
class PortfolioRepository {
  /// Get all projects
  List<Project> getProjects() => _projects;

  /// Get all experiences
  List<Experience> getExperiences() => _experiences;

  /// Get all skills
  List<Skill> getSkills() => _skills;

  /// Get all certifications
  List<Certification> getCertifications() => _certifications;

  /// Get projects filtered by category
  List<Project> getProjectsByCategory(String category) {
    if (category == 'All') return _projects;
    return _projects.where((p) => p.category == category).toList();
  }

  /// Get certifications filtered by category
  List<Certification> getCertificationsByCategory(String category) {
    if (category == 'All') return _certifications;
    return _certifications.where((c) => c.category == category).toList();
  }

  /// Get unique project categories
  List<String> getProjectCategories() {
    final categories = _projects.map((p) => p.category).toSet().toList();
    return ['All', ...categories];
  }

  /// Get unique certification categories
  List<String> getCertificationCategories() {
    final categories = _certifications.map((c) => c.category).toSet().toList();
    return ['All', ...categories];
  }

  // ============================================
  // PROJECTS DATA
  // ============================================

  static final List<Project> _projects = [
    const Project(
      id: 'mythic-gme-2e',
      name: 'Mythic GME 2e',
      description:
          'Official companion app for solo RPG game masters. Cross-platform deployment across 5 platforms with MVVM architecture.',
      category: 'Mobile',
      techStack: ['Flutter', 'Dart', 'Riverpod', 'Firebase', 'Sentry'],
      rating: 4.8,
      stats: {
        'platforms': 5,
        'retention': 0.85,
        'betaTesters': 200,
      },
      achievements: [
        '40% load time reduction',
        'MVVM architecture implementation',
        'Community-driven development with 200+ beta testers',
        'Cross-platform deployment (iOS, Android, Windows, macOS, Linux)',
      ],
      externalLink: 'https://mythicgme.app',
    ),
    const Project(
      id: 'vr-learning-lab',
      name: 'VR Learning Lab Management',
      description:
          'XR platform management system enabling school-wide VR adoption across multiple grade levels and subjects.',
      category: 'EdTech',
      techStack: ['Unity3D', 'C#', 'Custom Tools', 'XR SDK'],
      stats: {
        'grantsSecured': 200000,
        'schoolWideAdoption': true,
      },
      achievements: [
        r'$200,000+ in grants secured',
        'School-wide VR adoption',
        'Multi-grade level curriculum integration',
      ],
    ),
    const Project(
      id: 'ib-cs-tools',
      name: 'IB Computer Science Curriculum Tools',
      description:
          'Educational companion apps and tools for International Baccalaureate Computer Science program.',
      category: 'EdTech',
      techStack: ['Flutter Web', 'Firebase', 'Dart'],
      stats: {
        'enrollmentIncrease': 1.50,
      },
      achievements: [
        '150% enrollment increase',
        'Highest exam pass rates in network history',
        'Custom assessment tools',
      ],
    ),
  ];

  // ============================================
  // EXPERIENCE DATA
  // ============================================

  static final List<Experience> _experiences = [
    Experience(
      id: 'independent-dev',
      role: 'Independent Software Developer',
      company: 'Self-Employed',
      location: 'Dallas, TX, USA',
      startDate: DateTime(2024, 8),
      description:
          'Full-stack Flutter development with focus on cross-platform deployment and MVVM architecture.',
      responsibilities: [
        'Product lifecycle management',
        'MVVM architecture design and implementation',
        'Community management with 200+ beta testers',
        'Cross-platform deployment across 5 platforms',
      ],
      achievements: [
        'Launched Mythic GME 2e across 5 platforms',
        '4.8★ rating on app stores',
        '85% user retention rate',
      ],
    ),
    Experience(
      id: 'dp-cs-teacher',
      role: 'DP Computer Science Teacher & Department Chair',
      company: 'Uplift Education (Atlas Preparatory)',
      location: 'Dallas, TX, USA',
      startDate: DateTime(2021, 7),
      endDate: DateTime(2024, 6),
      description:
          'Led computer science department, developed curriculum, and integrated VR technology into education.',
      responsibilities: [
        'Curriculum development for IB Computer Science',
        'VR integration across multiple grade levels',
        'Faculty training and development',
        'Grant writing and technology acquisition',
      ],
      achievements: [
        'Top Hat Award (October 2023)',
        'Record IB CS exam results',
        r'$200K+ in VR grants secured',
        '150% enrollment increase',
      ],
    ),
    Experience(
      id: 'cs-teacher-crowley',
      role: 'Computer Science Teacher',
      company: 'Crowley High School',
      location: 'Crowley, TX, USA',
      startDate: DateTime(2017, 6),
      endDate: DateTime(2019, 6),
      description:
          'Established computer science program and coached competitive programming teams.',
      responsibilities: [
        'Unity certification program development',
        'UIL competition coaching',
        'Curriculum development',
        'Student mentorship',
      ],
      achievements: [
        'Established Unity certification program',
        'UIL competition team coaching',
        'First CS program at the school',
      ],
    ),
  ];

  // ============================================
  // SKILLS DATA
  // ============================================

  static const List<Skill> _skills = [
    Skill(
      id: 'flutter-dart',
      name: 'Flutter/Dart',
      category: 'Mobile Development',
      proficiency: 95,
      technologies: [
        'Riverpod',
        'Provider',
        'Get_It',
        'Platform Channels',
        'Custom Animations',
        'Material Design 3',
      ],
    ),
    Skill(
      id: 'state-management',
      name: 'State Management',
      category: 'Architecture',
      proficiency: 90,
      technologies: [
        'MVVM',
        'Clean Architecture',
        'Riverpod',
        'Provider Pattern',
        'BLoC',
      ],
    ),
    Skill(
      id: 'platform-channels',
      name: 'Platform Channels',
      category: 'Native Integration',
      proficiency: 80,
      technologies: [
        'Native iOS Integration',
        'Native Android Integration',
        'Method Channels',
        'Event Channels',
      ],
    ),
    Skill(
      id: 'firebase',
      name: 'Firebase Integration',
      category: 'Backend Services',
      proficiency: 85,
      technologies: [
        'Crashlytics',
        'Analytics',
        'Cloud Functions',
        'Firestore',
        'Authentication',
      ],
    ),
    Skill(
      id: 'performance',
      name: 'Performance Optimization',
      category: 'Engineering',
      proficiency: 85,
      technologies: [
        'Load Time Optimization',
        'Memory Management',
        'Frame Rate Optimization',
        'Code Profiling',
      ],
    ),
    Skill(
      id: 'ui-ux',
      name: 'UI/UX Design',
      category: 'Design',
      proficiency: 90,
      technologies: [
        'Custom Widgets',
        'Material Design 3',
        'Glassmorphism',
        'Responsive Design',
        'Animation Design',
      ],
    ),
  ];

  // ============================================
  // CERTIFICATIONS DATA
  // ============================================

  static final List<Certification> _certifications = [
    // Cloud & Infrastructure
    Certification(
      id: 'aws-cloud-practitioner',
      name: 'AWS Certified Cloud Practitioner',
      issuer: 'Amazon Web Services',
      category: 'Cloud & Infrastructure',
      issueDate: DateTime(2024, 7),
      expiryDate: DateTime(2027, 7),
      skills: ['AWS', 'Cloud Computing', 'Infrastructure'],
    ),
    Certification(
      id: 'cisco-ccst',
      name: 'Cisco CCST Networking',
      issuer: 'Cisco',
      category: 'Cloud & Infrastructure',
      issueDate: DateTime(2024, 4),
      skills: ['Networking', 'Infrastructure', 'Security'],
    ),
    // Mobile Development
    Certification(
      id: 'apple-swift',
      name: 'App Development with Swift Certified User',
      issuer: 'Apple',
      category: 'Mobile Development',
      issueDate: DateTime(2023, 12),
      skills: ['Swift', 'iOS Development', 'Xcode'],
    ),
    Certification(
      id: 'android-basics',
      name: 'Android Basics Nanodegree',
      issuer: 'Udacity',
      category: 'Mobile Development',
      issueDate: DateTime(2018, 1),
      skills: ['Android', 'Kotlin', 'Java'],
    ),
    // Development Tools & Methods
    Certification(
      id: 'psm-1',
      name: 'Professional Scrum Master I',
      issuer: 'Scrum.org',
      category: 'Development Tools & Methods',
      issueDate: DateTime(2022, 6),
      skills: ['Scrum', 'Agile', 'Project Management'],
    ),
    Certification(
      id: 'unity-programmer',
      name: 'Unity Certified User: Programmer',
      issuer: 'Unity Technologies',
      category: 'Development Tools & Methods',
      issueDate: DateTime(2022, 7),
      skills: ['Unity3D', 'C#', 'Game Development'],
    ),
    Certification(
      id: 'python-specialist',
      name: 'IT Specialist - Python',
      issuer: 'Certiport',
      category: 'Development Tools & Methods',
      issueDate: DateTime(2023, 11),
      skills: ['Python', 'Programming', 'Automation'],
    ),
    // Adobe Creative Suite
    Certification(
      id: 'adobe-photoshop',
      name: 'Adobe Certified Professional: Visual Design',
      issuer: 'Adobe',
      category: 'Adobe Creative Suite',
      issueDate: DateTime(2023, 1),
      skills: ['Photoshop', 'Visual Design', 'Image Editing'],
    ),
    Certification(
      id: 'adobe-premiere',
      name: 'Adobe Certified Professional: Video Design',
      issuer: 'Adobe',
      category: 'Adobe Creative Suite',
      issueDate: DateTime(2023, 1),
      skills: ['Premiere Pro', 'Video Editing', 'Motion Graphics'],
    ),
    Certification(
      id: 'adobe-illustrator',
      name: 'Adobe Certified Professional: Graphic Design',
      issuer: 'Adobe',
      category: 'Adobe Creative Suite',
      issueDate: DateTime(2023, 1),
      skills: ['Illustrator', 'Vector Graphics', 'Logo Design'],
    ),
  ];
}
