import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class _SignInButtonSizedBox extends StatelessWidget {
  const _SignInButtonSizedBox({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 256,
      child: child,
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _SignInButtonSizedBox(
      child: SignInButton(
        Buttons.google,
        text: text,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10000),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        clipBehavior: Clip.hardEdge,
        onPressed: onPressed,
      ),
    );
  }
}

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _SignInButtonSizedBox(
      child: SignInButton(
        Buttons.appleDark,
        text: text,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10000),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        clipBehavior: Clip.hardEdge,
        onPressed: onPressed,
      ),
    );
  }
}
