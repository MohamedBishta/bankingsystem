
import 'Shape.dart';

class Rectangle extends Shape{
  Rectangle(super.width, super.height);
 // Rectangle(int width,int height):super(width,height);
 @override
  double calculateArea() {
   return  (1.0*width*height) ;
  }
  @override
  void draw() {
    print("Rectangle shape");
  }
}