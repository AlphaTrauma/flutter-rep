import 'dart:io';

void main() {
    final numbers = readNumbers();
    calculate(numbers.$1, numbers.$2);
}

(int, int) readNumbers() {
    while (true) {
        stdout.write('Введите два числа через запятую: ');
        final line = stdin.readLineSync();

        if (line == null) continue;

        final parts = line.split(',');
        if (parts.length != 2) {
            print('Нужно ввести два числа.');
            continue;
        }

        try {
            final first = int.parse(parts[0].trim());
            final second = int.parse(parts[1].trim());
            return (first, second);
        } catch (_) {
            print('Некорректный ввод.');
        }
    }
}

void calculate(int a, int b) {
    print("$a + $b = ${a + b}");
    print("$a - $b = ${a - b}");
    print("$a * $b = ${a * b}");

    if (b != 0) {
        print("$a / $b = ${a / b}");
    } else {
        print("Деление невозможно: второй аргумент равен 0");
    }

    if (a == b) {
        print("Числа равны");
    } else {
        print("$a ${a > b ? "больше" : "меньше"} $b");
    }
}
