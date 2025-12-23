import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';
import 'app_shell.dart';

/// Global navigator keys
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

/// App router configuration
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    // Splash screen (no shell)
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // Main shell with bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        // Home branch
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              name: 'home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        // Skills branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/skills',
              name: 'skills',
              builder: (context, state) => const SkillsScreen(),
            ),
          ],
        ),
        // Projects branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/projects',
              name: 'projects',
              builder: (context, state) => const ProjectsScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  name: 'project-detail',
                  builder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return ProjectDetailScreen(projectId: id);
                  },
                ),
              ],
            ),
          ],
        ),
        // Experience branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/experience',
              name: 'experience',
              builder: (context, state) => const ExperienceScreen(),
            ),
          ],
        ),
        // Certifications branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/certifications',
              name: 'certifications',
              builder: (context, state) => const CertificationsScreen(),
            ),
          ],
        ),
        // Contact branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/contact',
              name: 'contact',
              builder: (context, state) => const ContactScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
);

/// Route paths for easy reference
class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String home = '/';
  static const String skills = '/skills';
  static const String projects = '/projects';
  static const String projectDetail = '/projects/:id';
  static const String experience = '/experience';
  static const String certifications = '/certifications';
  static const String contact = '/contact';
}
