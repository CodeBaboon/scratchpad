import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper network = NetworkHelper(
      '${kOpenWeatherMapUrl}?q=${cityName}&APPID=$kAppId&units=metric',
    );
    dynamic weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper network = NetworkHelper(
      '${kOpenWeatherMapUrl}?lat=${location.latitude}&lon=${location.longitude}&APPID=$kAppId&units=metric',
    );

    dynamic weatherData = await network.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
