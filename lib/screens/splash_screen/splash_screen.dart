import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/screens/account/view/login.dart';
import '../../constant/image_assets.dart';
import '../home/components/nav_bar_component.dart';

class DualRotationAnimationPage extends StatefulWidget {
  const DualRotationAnimationPage({super.key});

  @override
  _DualRotationAnimationPageState createState() =>
      _DualRotationAnimationPageState();
}

class _DualRotationAnimationPageState extends State<DualRotationAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<double> _animation1;
  late AnimationController _controller2;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation1 = Tween<double>(begin: 0, end: 1).animate(_controller1);

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation2 = Tween<double>(begin: 0, end: 1).animate(_controller2);
    Future.delayed(const Duration(seconds: 5), () {
      navigateToNextPage();
    });
  }

  void navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  LoginScreen()),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRotationItem(
              animation: _animation1,
              child: Image.asset(width: 80, ImageAssests.dlogoimge.toString()),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _controller2.forward(from: 0);
              },
              child: buildRotationItem(
                animation: _animation2,
                child:
                    Image.asset(width: 70.w, ImageAssests.logoImge.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRotationItem({
    required Animation<double> animation,
    required Widget child,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: animation.value * 2 * 3.14159, // Convert to radians
          child: child,
        );
      },
      child: child,
    );
  }
}
