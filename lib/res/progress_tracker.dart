import 'package:flutter/material.dart';
import 'utilities.dart';

enum TimelineStatus { done, inProgress, locked }

class ProgressTracker extends StatelessWidget {
  const ProgressTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color.fromARGB(255, 47, 60, 78),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimelineIcon(icon: Icons.check, color: const Color(0xFF10B981)),
                const SizedBox(width: 12),
                Expanded(
                  child: TimelineItems(
                    title: "Đã nhận kết quả",
                    subtitle: "Phân tích sinh trắc đã sẵn sàng",
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimelineIcon(
                  icon: Icons.trending_up,
                  color: const Color(0xFF13A4EC),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TimelineItems(
                    title: "Đang học",
                    subtitle: "Khoá học: Hiểu về bản thân (4/10 bài)",
                    status: TimelineStatus.inProgress,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimelineIcon(
                  icon: Icons.lock,
                  color: const Color(0xFF64748B),
                  locked: true,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TimelineItems(
                    title: "Thâm vấn chuyên sâu",
                    subtitle: "Khai phá tiềm năng cùng chuyên gia",
                    status: TimelineStatus.locked,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final bool? locked;

  const TimelineIcon({
    super.key,
    required this.icon,
    required this.color,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: locked == true ? 0.4 : 1.0,
          child: Container(
            decoration: locked == true
                ? null
                : BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.5),
                        blurRadius: 12,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: color,
              child: Icon(
                icon,
                size: responsiveIcon(context, 15),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(width: 2, height: 40, color: const Color(0xFF64748B)),
      ],
    );
  }
}

class TimelineItems extends StatelessWidget {
  final String title;
  final String subtitle;
  final TimelineStatus status;

  const TimelineItems({
    super.key,
    required this.title,
    required this.subtitle,
    this.status = TimelineStatus.done,
  });

  @override
  Widget build(BuildContext context) {
    final isLocked = status == TimelineStatus.locked;
    final isInProgress = status == TimelineStatus.inProgress;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            title,
            style: TextStyle(
              color: isLocked ? Colors.white54 : Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          subtitle,
          style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
        ),

        const SizedBox(height: 6),

        if (isInProgress)
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const LinearProgressIndicator(
              value: 0.4,
              minHeight: 4,
              backgroundColor: Color(0xFF334155),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF13A4EC)),
            ),
          )
        else if (isLocked)
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                side: const BorderSide(color: Color(0xFF13A4EC), width: 1),
                backgroundColor: const Color(0xFF13A4EC).withOpacity(0.1),
              ),
              child: const Text(
                "Mở khóa ngay",
                style: TextStyle(
                  color: Color(0xFF13A4EC),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
