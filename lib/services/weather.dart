import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '519e8e8a4817a4d137978f320ac233a8';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  void getCityWeather(
    String cityName,
    completion(var response),
    failure(String error),
  ) {
    Networking network = Networking();
    String url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';

    network.performGetRequest(url, (var response) {
      completion(response);
    }, (String error) {
      failure(error);
    });
  }

  void getLocationWeather(
    completion(var response),
    failure(String error),
  ) async {
    Location location = Location();
    await location.getCurrentLocation();
    Networking network = Networking();
    String url =
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    network.performGetRequest(url, (var response) {
      completion(response);
    }, (String error) {
      failure(error);
    });
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
