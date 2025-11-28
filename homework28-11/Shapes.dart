import 'dart:math';

void main() {
    List<Shape> result = [Circle(20), Rectangle(10, 20), Triangle(5, 6, 10)];
    
    for(var item in result){
         print("${item.toString()}: perimeter: ${item.perimeter()}, area: ${item.area()}");
    }
}

abstract class Shape {

    double area();
    double perimeter();

}

class Circle extends Shape {
    double radius;
  
    Circle(this.radius);
  
    @override
    double area() 
    {
        return pi * radius * radius;
    }
  
    @override
    double perimeter() 
    {
        return 2 * pi * radius;
    }
}

class Rectangle extends Shape {
    double width;
    double height;
    
    Rectangle(this.width, this.height);
    
    @override
    double area()
    {
        return width * height;
    }
    
    @override
    double perimeter()
    {
        return (width + height) * 2;
    }
}

class Triangle extends Shape {
    double sideA;
    double sideB;
    double sideC;
    
    Triangle(this.sideA, this.sideB, this.sideC);

    @override 
    double area()
    {
        var sp = perimeter() / 2; // semiperimeter
      
        return sqrt(sp * (sp - sideA) * (sp - sideB) * (sp - sideC));
    }
    
    @override 
    double perimeter()
    {
        return sideA + sideB + sideC;
    }
}