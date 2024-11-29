import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantLandscapeCard extends StatelessWidget {
  const RestaurantLandscapeCard({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
          .textTheme
          .apply(
            displayColor: Theme.of(context).colorScheme.onSurface
          );
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                child: AspectRatio(
                aspectRatio: 2,
                  child: Image.asset(restaurant.imageUrl, fit: BoxFit.cover,),
                ),
              ),
              ListTile(
                // 1
                title: Text(restaurant.name, style: textTheme.titleSmall,),
                // 2
                subtitle: Text(restaurant.attributes,
                  maxLines: 1, style: textTheme.bodySmall,),
                // 3
                onTap: () {
                  // ignore: avoid_print
                  print('Tap on ${restaurant.name}');
                },),
        ],),
      );
  }
}
