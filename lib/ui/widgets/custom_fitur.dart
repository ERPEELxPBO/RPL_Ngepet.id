import 'package:flutter/widgets.dart';
import '../../shared/theme.dart';

class CustomFitur extends StatelessWidget {
  final String title;
  final String iconPath;

  final Function() onTap;

  const CustomFitur({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 104,
        margin: const EdgeInsets.only(right: 23),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: kSilver3Color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        iconPath,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: semiBoldTextStyle.copyWith(
                  fontSize: 14,
                  color: kBlack2Color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
