import 'package:flutter/material.dart';
import './card.dart';

class NewsFeedPage extends StatelessWidget {
    const NewsFeedPage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: [
                    Column(
                        children: [
                            SafeArea(
                                child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Text(
                                        'Лента новостей',
                                        style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                ),
                            ),

                            Expanded(
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                        final int columns =
                                            constraints.maxWidth >= 600 ? 3 : 2;

                                        return GridView.builder(
                                            padding: const EdgeInsets.all(6),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: columns,
                                                    crossAxisSpacing: 16,
                                                    mainAxisSpacing: 16,
                                                    childAspectRatio: 0.75,
                                                ),
                                            itemCount: 20,
                                            itemBuilder: (context, index) {
                                                return NewsCard(index: index);
                                            },
                                        );
                                    },
                                ),
                            ),
                        ],
                    ),

                    Positioned(
                        right: 16,
                        bottom: 16,
                        child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.add),
                        ),
                    ),
                ],
            ),
        );
    }
}
