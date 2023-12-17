String getWeatherCondition(int weatherId) {
  print('weather cond ${weatherId}');

  if (weatherId == 0) {
    return 'assets/images/0.png';
  }

  // Thunderstorm
  if (weatherId >= 200 && weatherId <= 232) {
    return 'assets/images/1.png';
  }

  // Drizzle
  if (weatherId >= 300 && weatherId <= 321) {
    return 'assets/images/3.png';
  }

  // Rain
  if (weatherId >= 500 && weatherId <= 504) {
    return 'assets/images/0.png';
  }

  if (weatherId == 511) {
    return 'assets/images/4.png';
  }

  if (weatherId >= 520 && weatherId <= 531) {
    return 'assets/images/3.png';
  }
  // Block Rain End

  // Snow
  if (weatherId >= 600 && weatherId <= 622) {
    return 'assets/images/4.png';
  }

  // Atmosphere
  if (weatherId >= 701 && weatherId <= 781) {
    return 'assets/images/5.png';
  }

  // Clear
  if (weatherId == 800) {
    return 'assets/images/6.png';
  }

  // Clouds
  if (weatherId == 801) {
    return 'assets/images/7.png';
  }

  if (weatherId == 802) {
    return 'assets/images/8.png';
  }

  if (weatherId == 803 || weatherId == 804) {
    return 'assets/images/5.png';
  }
  // Block Clouds End

  return 'assets/images/0.png';
}
