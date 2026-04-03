import 'package:flutter/material.dart';
import '../controllers/utilities.dart';

class CustomColors {
  static const insightBoxGrad = [
    Color(0xFF56CCF2),
    Color(0xFF2F80ED),
    Color.fromARGB(255, 77, 87, 236),
  ];

  static const TextColor = Color(0xFFFFFFFF);
  static const TextColorSecondary = Color(0xFF2F80ED);
  static const ButtonColor = Color(0xFFFFFFFF);
}

class InsightBox extends StatelessWidget {
  const InsightBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,

      // Box decoration with gradient background and rounded corners
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: CustomColors.insightBoxGrad,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 30,
              bottom: -135,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset('lib/assets/fingerprint.png', width: 200),
              ),
            ),
            InsightBoxContent(),
          ],
        ),
      ),
    );
  }
}

class InsightBoxContent extends StatelessWidget {
  const InsightBoxContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.fingerprint,
                      color: CustomColors.TextColor,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "CHỦNG VÂN TAY: WHORL",
                      style: TextStyle(
                        color: CustomColors.TextColor,
                        fontSize: responsiveFont(context, 12),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Daily Insight",
                    style: TextStyle(
                      color: CustomColors.TextColor,
                      fontSize: responsiveFont(context, 18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sức mạnh của sự tập trung hôm nay sẽ giúp bạn hoàn thành mục tiêu nhanh gấp đôi",
                    style: TextStyle(
                      color: CustomColors.TextColor,
                      fontSize: responsiveFont(context, 10),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: CustomColors.ButtonColor,
                      foregroundColor: CustomColors.TextColorSecondary,

                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ), // 🔹 smaller padding
                      minimumSize: Size.zero, // 🔹 removes default min size
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // 🔹 removes extra touch area

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Xem chi tiết",
                      style: TextStyle(fontSize: responsiveFont(context, 12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
