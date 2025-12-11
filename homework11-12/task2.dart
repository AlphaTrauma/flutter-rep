import 'dart:io';

void main() {
    int number = readNumber();

    print(positiveOrNegative(number));

    print(humanReadableWeekDay(number));

    outputCycle();
}

int readNumber() {
  
    while (true) {
        stdout.write('Введите число: ');
        final line = stdin.readLineSync();

        if (line == null) continue;

        try {
            final number = int.parse(line.trim()); 

            return number;
        } catch (_) {
            print('Некорректный ввод.');
        }
    }
}

String positiveOrNegative(int number) {

    if(number == 0) return "Это ноль.";

    if(number > 0) {

        return "Число ${number} положительное";
    } else {

        return "Число ${number} отрицательное";
    }
}

void outputCycle() {

    List nums = List.generate(10, (i) => i + 1);
    for(var number in nums) {
        print(number);
    }
}

String humanReadableWeekDay(int number) {

    switch(number) {
        case(1): return "Понедельник";  
        case(2): return "Вторник";
        case(3): return "Среда";
        case(4): return "Четверг";
        case(5): return "Пятница";
        case(6): return "Суббота";
        case(7): return "Воскресенье";
        default: return "Число не является днём недели";
    } 
}