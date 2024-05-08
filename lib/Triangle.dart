import 'Shape.dart';

class Triangle extends Shape{
  Triangle(super.width,super.height);

  @override
  double calculateArea() {
    return (0.5*width*height);
  }
   @override
  void draw() {
    print("Trangle Shape");
  }
}