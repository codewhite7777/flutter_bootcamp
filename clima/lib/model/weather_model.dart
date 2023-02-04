class WeatherModel {
  WeatherModel({
    required this.name,
    required this.main,
    required this.description,
    required this.temp,
    required this.id,
  });

  final String name;
  final String main;
  final String description;
  final double  temp;
  final int     id;
}
