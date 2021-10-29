class WeatherAppException implements Exception {
  final String message;
  final dynamic innerException;

  WeatherAppException(this.message, {this.innerException});
}
