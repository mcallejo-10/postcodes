import 'package:flutter/material.dart';
import 'package:postcodes/models/search_response.dart';
import 'package:postcodes/styles/app_styles.dart';

class PlaceDetailScreen extends StatelessWidget {
  final Result place;

  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(place.name.toUpperCase(), style: AppStyles.appBarTitle),
        ),
      ),
      body: Padding(
        padding: AppStyles.padding.padding,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${place.admin2}, ${place.admin1}',
                style: AppStyles.heading,
              ),
              AppStyles.mediumSeparator,
              Text('Detalls del municipi:', style: AppStyles.subheading),
              AppStyles.smallSeparator,
              Text('Habitants: ${place.population ?? 'Desconegut'}'),
              AppStyles.smallSeparator,
              Text('Coordenades: ${place.latitude}, ${place.longitude}'),
              AppStyles.smallSeparator,
              Text(
                (place.postcodes?.length ?? 0) == 1
                    ? 'Codi postal del municipi:'
                    : 'Codis postals del municipi:',
              ),

              AppStyles.tinySeparator,
              Text((place.postcodes ?? []).join('\n')),
            ],
          ),
        ),
      ),
    );
  }
}
