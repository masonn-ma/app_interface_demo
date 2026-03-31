import 'package:flutter/material.dart';
import 'utilities.dart';

class CardGrid extends StatelessWidget {
  final List<CardContents>? contents;

  const CardGrid({super.key, this.contents});

  List<CardContents> get defaultContents => [
    CardContents(
      icon: Icons.description_outlined,
      lable: "Xem Báo Cáo",
      color: Colors.blue,
    ),
    CardContents(
      icon: Icons.smart_toy_outlined,
      lable: "Trợ Lý AI",
      color: Colors.deepPurpleAccent,
    ),
    CardContents(
      icon: Icons.event_available,
      lable: "Đặt lịch Chuyên Gia",
      color: Colors.green,
    ),
    CardContents(
      icon: Icons.menu_book_outlined,
      lable: "Khoá Học",
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final displayContents = contents ?? defaultContents;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.8,
      ),
      itemCount: displayContents.length,
      itemBuilder: (context, index) {
        final card = displayContents[index];

        return Container(
          decoration: BoxDecoration(
            color: Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Color.fromARGB(255, 47, 60, 78),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: StyledIcon(icon: card.icon, color: card.color),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    card.lable,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsiveFont(context, 10),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StyledIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const StyledIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5), // 🔹 controls spacing
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(icon, color: color, size: responsiveIcon(context, 20)),
    );
  }
}

class CardContents {
  final IconData icon;
  final String lable;
  final Color color;

  CardContents({required this.icon, required this.lable, required this.color});
}
