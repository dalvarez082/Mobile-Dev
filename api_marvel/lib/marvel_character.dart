class MarvelCharacter {
  final String name;
  final String image; // URL de la imagen
  final String description;
  final int comicsCount;
  final int seriesCount;
  final int storiesCount;
  final int eventsCount;
  final List<MarvelSeries> firstThreeSeries;

  MarvelCharacter({
    required this.name,
    required this.image,
    required this.description,
    required this.comicsCount,
    required this.seriesCount,
    required this.storiesCount,
    required this.eventsCount,
    required this.firstThreeSeries,
  });

  factory MarvelCharacter.fromJson(Map<String, dynamic> json) {
    // Obtener los nombres de las primeras tres series del listado de series
    final List<dynamic> seriesList = json['series']['items'];

    List<MarvelSeries> firstThreeSeries = [];
    for (int i = 0; i < 3 && i < seriesList.length; i++) {
      final seriesName = seriesList[i]['name'];
      final seriesImage = seriesList[i]['resourceURI'];
      final series = MarvelSeries(name: seriesName, image: seriesImage);
      firstThreeSeries.add(series);
    }

    final description = json['description'];
    const defaultDescription = 'Lorem ipsum dolor sit amet consectetur adipiscing elit, metus maecenas vehicula taciti vestibulum urna, lacinia sollicitudin tristique hendrerit sapien senectus. Ut curabitur vestibulum montes imperdiet vivamus consequat himenaeos, interdum massa hac nullam augue magnis, netus erat primis dui libero sociis. Nisl curae fermentum vivamus venenatis id turpis, posuere facilisi nascetur duis ut sodales, purus leo consequat interdum orci.'; // Texto alternativo en caso de que la descripción esté vacía

    return MarvelCharacter(
      name: json['name'] ?? '',
      image: "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
      description: description.isNotEmpty ? description : defaultDescription,
      comicsCount: json['comics']['available'] ?? 0,
      seriesCount: json['series']['available'] ?? 0,
      storiesCount: json['stories']['available'] ?? 0,
      eventsCount: json['events']['available'] ?? 0,
      firstThreeSeries: firstThreeSeries,
    );
  }
}

class MarvelSeries {
  final String name;
  final String image; // URL de la imagen

  MarvelSeries({
    required this.name,
    required this.image,
  });
}
