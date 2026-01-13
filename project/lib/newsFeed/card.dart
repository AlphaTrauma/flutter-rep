import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
    final int index;

    const NewsCard({super.key, required this.index});

    @override
    Widget build(BuildContext context) {
        return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Expanded(
                        flex: 6,
                        child: Image.network(
                            'https://placehold.co/400x300/png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                        ),
                    ),

                    Expanded(
                        flex: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                        'Заголовок новости #$index',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleMedium,
                                    ),

                                    const Spacer(),

                                    Text(
                                        '13.01.2026',
                                        style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}
