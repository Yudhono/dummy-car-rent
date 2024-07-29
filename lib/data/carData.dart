// data.dart
class Car {
  final String name;
  final String imagePath;
  final String logoPath;
  final double price;
  final String duration;
  final bool withDriver;
  final String carType;

  Car(
      {required this.name,
      required this.imagePath,
      required this.logoPath,
      required this.price,
      required this.duration,
      required this.withDriver,
      required this.carType});
}

List<Car> carData = [
  Car(
      name: 'Audi S4 2018',
      imagePath: 'assets/audi-s4.png',
      logoPath: 'assets/audi-logo.png',
      price: 150,
      duration: ' /Day',
      withDriver: false,
      carType: 'SEDAN'),
  Car(
      name: 'Audi Q5 2019',
      imagePath: 'assets/audi-q5.png',
      logoPath: 'assets/audi-logo.png',
      price: 200,
      duration: ' /Day',
      withDriver: false,
      carType: 'SUV'),
  Car(
      name: 'Audi A7 2022',
      imagePath: 'assets/audi-a7.png',
      logoPath: 'assets/audi-logo.png',
      price: 250,
      duration: ' /Day',
      withDriver: true,
      carType: 'LUXURY'),
];
