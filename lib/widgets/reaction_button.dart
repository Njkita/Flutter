import 'package:flutter/material.dart';

class ReactionButton extends StatelessWidget {
  final bool isLike;
  final VoidCallback onPressed;
  final double size;

  const ReactionButton({
    super.key,
    required this.isLike,
    required this.onPressed,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
        _triggerFeedback(context);
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1, end: 1),
        duration: const Duration(milliseconds: 300),
        builder: (context, scale, child) {
          return AnimatedScale(
            scale: 1.1,
            duration: const Duration(milliseconds: 100),
            child: child!,
          );
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.0, 0.0),
              radius: 0.8,
              colors: isLike
                  ? [Colors.green.shade100, Colors.green.shade400]
                  : [Colors.red.shade100, Colors.red.shade400],
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: isLike ? Colors.green : Colors.red,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: isLike ? Colors.green.shade200 : Colors.red.shade200,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            isLike ? Icons.favorite : Icons.close,
            color: isLike ? Colors.green.shade800 : Colors.red.shade800,
            size: size * 0.6,
          ),
        ),
      ),
    );
  }

  void _triggerFeedback(BuildContext context) {
    Feedback.forTap(context); // лёгкая вибрация
  }

}