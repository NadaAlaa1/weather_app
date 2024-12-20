# Weather App 🌤️

A Flutter-based application that delivers real-time weather updates for cities worldwide. This app features dynamic theming, detailed weather information, and robust error handling, powered by the [WeatherAPI](https://www.weatherapi.com/).

## Table of Contents

- [Features](#features)
- [Repository Structure](#repository-structure)
- [Configuration](#configuration)
- [Demo](#demo)
- [Setup](#setup)

## Features

- **Search Cities**: Fetch real-time weather updates for any city.
- **Dynamic Theming**: Adaptive UI based on weather conditions.
- **Detailed Info**: Includes temperature, conditions, and high/low values.
- **Error Handling**: Informs users of invalid inputs or network issues.

## Repository Structure

- `weather_app_with_provider/`: Weather app implemented using the Provider package.
- `weather_app_with_cubit/`: Weather app implemented using Cubit (from Flutter Bloc).

## Configuration

- **API**: This app uses [WeatherAPI](https://www.weatherapi.com/) to fetch weather data.
- **Themes**: The app uses dynamic theming to enhance user experience based on weather conditions.

## Demo
Here’s a preview of the Weather App in action:

<p align="center">
  <img src="weather_app_with_provider/assets/screenshots/home.jpeg" alt="Home Screen" width="300">
  <img src="weather_app_with_provider/assets/screenshots/search.jpeg" alt="Search Screen" width="300">
  <img src="weather_app_with_provider/assets/screenshots/weather.jpeg" alt="Weather Info" width="300">
</p>

### Video/GIF Demo
Watch the app in action:

![Weather App Demo](weather_app_with_provider/assets/screenshots/demo.gif)

## Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/NadaAlaa1/weather-app.git
   cd weather-app

2. **Install dependencies** Ensure Flutter is installed on your system. Then, run the following command:
   ```bash
   flutter pub get

3. **Obtain WeatherAPI Key**
   - Visit [WeatherAPI](https://www.weatherapi.com/) and create a free account to obtain an API key.
   - Copy the API key.

4. **Add the API Key** Replace the placeholder `YOUR_API_KEY_HERE` in the `WeatherService` class with your actual API key.
   Open `lib/services/weather_service.dart` and update the following line:

   ```dart
   final String apiKey = 'YOUR_API_KEY_HERE';

5. **Run the App**
   ```bash
   flutter run

