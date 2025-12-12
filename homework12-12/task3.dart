import 'dart:async';

void main () {
    Counter counter = Counter();
    counter.stream.listen(
        (int echo) {
            print(echo);
            if(echo < 0) {
                print('Счётчик отрицательный, закрываем поток');
                counter.closeController();
            }
        }
    );

    counter.increment();  
    counter.decrement(); 
    counter.decrement(); 
    
}

class Counter {
    int _count = 0;
    final StreamController<int> _controller;

    Counter() : _controller = StreamController<int> () {
        _controller.add(_count);
    }

    Stream<int> get stream => _controller.stream;

    void increment(){
        _count++;
        _controller.add(_count);
    }

    void decrement(){
        _count--;
        _controller.add(_count);
    }

    void closeController() {
        _controller.close();
    }
}