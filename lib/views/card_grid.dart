import 'package:flutter/material.dart';
import '../controllers/utilities.dart';
import '../controllers/card.dart';

class CardGrid extends StatelessWidget {
  final Function(CardContents)? onCardTap;
  final List<CardContents>? contents;

  const CardGrid({super.key, this.contents, this.onCardTap});

  @override
  Widget build(BuildContext context) {
    final displayContents = contents ?? DefaultContents().defaultContents();

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

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              onCardTap?.call(card);
              String userName = card.user?.name.isNotEmpty ?? false
                  ? card.user!.name
                  : "Unknown User";
              print("Tapped on: ${card.lable} (User: $userName)");
            },
            child: Container(
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
