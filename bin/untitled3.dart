
import 'package:untitled3/Rectangle.dart';
import 'package:untitled3/Triangle.dart';

void main(List<String> arguments) {
  Rectangle rectangle = Rectangle(20, 10);
  print('Rectangle Area is ${rectangle.calculateArea()}');
  rectangle.draw();

  print("--------------------------------");
  Triangle triangle = Triangle(20, 25);
  print('Triangle Area is  ${triangle.calculateArea()}');
  triangle.draw();
}
