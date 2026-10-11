import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MissionControl()));

class Planet {
  final String name;
  final String type;
  final String description;

  const Planet({
    required this.name,
    required this.type,
    required this.description,
  });
}

class PlanetCatalog {
  static const List<Planet> planets = [
    Planet(
      name: 'Mercury',
      type: 'Terrestrial',
      description: 'Smallest planet, closest to the Sun.',
    ),
    Planet(
      name: 'Mars',
      type: 'Terrestrial',
      description: 'A cold, red desert planet.',
    ),
    Planet(
      name: 'Jupiter',
      type: 'Gas Giant',
      description: 'The biggest planet in our solar system.',
    ),
    Planet(
      name: 'Kepler-186f',
      type: 'Terrestrial',
      description: 'An Earth-sized planet around another star.',
    ),
    Planet(
      name: 'Proxima Centauri b',
      type: 'Terrestrial',
      description: 'The closest known planet outside our solar system.',
    ),
  ];
}

class MissionControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cosmic Explorer - Mission Control'),
      ),
      body: ListView.builder(
        itemCount: PlanetCatalog.planets.length,
        itemBuilder: (context, index) {
          final planet = PlanetCatalog.planets[index];
          return ListTile(
            title: Text(planet.name),
            subtitle: Text(planet.type),
            onTap: () async {
              final result = await Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanetDetail(planet: planet),
                ),
              );

              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result)),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class PlanetDetail extends StatelessWidget {
  final Planet planet;

  const PlanetDetail({
    super.key,
    required this.planet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Type: ${planet.type}'),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(planet.description),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'You visited ${planet.name}!');
              },
              child: const Text('Confirm Visit'),
            ),
          ),
        ],
      ),
    );
  }
}