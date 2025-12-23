import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Typewriter text animation effect
class TypewriterText extends StatefulWidget {
  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.speed = const Duration(milliseconds: 50),
    this.cursor = '|',
    this.showCursor = true,
    this.onComplete,
  });

  final String text;
  final TextStyle? style;
  final Duration speed;
  final String cursor;
  final bool showCursor;
  final VoidCallback? onComplete;

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayText = '';
  int _currentIndex = 0;
  Timer? _timer;
  bool _showCursor = true;
  Timer? _cursorTimer;

  @override
  void initState() {
    super.initState();
    _startTyping();
    _startCursorBlink();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.speed, (timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayText = widget.text.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
      } else {
        timer.cancel();
        widget.onComplete?.call();
      }
    });
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          _showCursor = !_showCursor;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cursorText =
        widget.showCursor && _showCursor ? widget.cursor : '';

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: _displayText,
            style: widget.style,
          ),
          TextSpan(
            text: cursorText,
            style: (widget.style ?? const TextStyle()).copyWith(
              color: AppColors.neonCyan,
            ),
          ),
        ],
      ),
    );
  }
}

/// Typewriter text with decode effect (random characters before revealing)
class DecodeText extends StatefulWidget {
  const DecodeText({
    super.key,
    required this.text,
    this.style,
    this.decodeSpeed = const Duration(milliseconds: 30),
    this.revealDelay = const Duration(milliseconds: 100),
    this.onComplete,
  });

  final String text;
  final TextStyle? style;
  final Duration decodeSpeed;
  final Duration revealDelay;
  final VoidCallback? onComplete;

  @override
  State<DecodeText> createState() => _DecodeTextState();
}

class _DecodeTextState extends State<DecodeText> {
  late List<String> _characters;
  int _revealedCount = 0;
  Timer? _decodeTimer;
  Timer? _revealTimer;

  static const String _chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*';

  @override
  void initState() {
    super.initState();
    _characters = List.generate(widget.text.length, (_) => _randomChar());
    _startAnimation();
  }

  @override
  void dispose() {
    _decodeTimer?.cancel();
    _revealTimer?.cancel();
    super.dispose();
  }

  String _randomChar() {
    return _chars[(DateTime.now().microsecond % _chars.length)];
  }

  void _startAnimation() {
    // Scramble effect
    _decodeTimer = Timer.periodic(widget.decodeSpeed, (timer) {
      if (mounted) {
        setState(() {
          for (int i = _revealedCount; i < widget.text.length; i++) {
            if (widget.text[i] != ' ') {
              _characters[i] = _randomChar();
            } else {
              _characters[i] = ' ';
            }
          }
        });
      }
    });

    // Progressive reveal
    _revealTimer = Timer.periodic(widget.revealDelay, (timer) {
      if (_revealedCount < widget.text.length) {
        setState(() {
          _characters[_revealedCount] = widget.text[_revealedCount];
          _revealedCount++;
        });
      } else {
        _decodeTimer?.cancel();
        timer.cancel();
        widget.onComplete?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _characters.join(),
      style: widget.style,
    );
  }
}
