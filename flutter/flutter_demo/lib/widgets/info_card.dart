import 'package:flutter/material.dart';

/// 图 + 主标题 + 副标题卡片，支持横向或纵向布局
class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool isHorizontal;
  final VoidCallback? onTap;

  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.isHorizontal = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
    );

    final textColumn = Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );

    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: isHorizontal
            ? Row(children: [image, textColumn])
            : Column(children: [image, textColumn]),
      ),
    );
  }
}
