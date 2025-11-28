// Не очень понял граничные условия задачи, реализовал как получилось. 
// Откуда должна браться максимальная скорость, не сказано, поэтому это предзаданное свойство класса. 
// транспорт стоит при создании, поэтому в конструктор передаётся только цвет.

abstract class Vehicle {
    void drive(double speed);
    void stop();
}

class Car extends Vehicle {
    bool _engineStatus = false;
    String color;
    double speed = 0; 
    double maxAllowedSpeed = 120;

    Car(this.color); 

    @override
    void drive(double speed) {
        if (speed > maxAllowedSpeed) {
            speed = maxAllowedSpeed;
        }
        
        this._engineStatus = true;
        print("${this.color} машина движется со скоростью ${speed}");
    }
  
    @override
    void stop() {
        this._engineStatus = false;
        speed = 0;
        print("${this.color} машина остановилась");
    }
}

class Bicycle extends Vehicle {
    bool engineStatus = false;
    double speed = 0;
    double maxAllowedSpeed = 40;
    String color;
  
    Bicycle(this.color);
  
    @override
    void drive(double speed) {
        engineStatus = true;
        if (speed > maxAllowedSpeed) {
            speed = maxAllowedSpeed;
        }
        print("${this.color} велосипед движется со скоростью ${speed}");
    }
  
    @override
    void stop() {
        engineStatus = false;
        print("'${this.color} велосипед остановился");
    }
}