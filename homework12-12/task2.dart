import "dart:async"; 

Future<void> main () async
{
    try {
        String result = await fetchData();
        print(result);
    } catch (err) {
        print(err);
    }

    final StreamController<int> stController = StreamController<int>();
    final Stream<int> stream = stController.stream;

    stream.listen((int number) {
        print(number);
        if(number == 10) stController.close(); 
    });

    List<int> numbers = List.generate(10, (i) => i++);

    for(int number in numbers) {
        await Future.delayed(Duration(seconds: 1));
        stController.add(number + 1);
    }

}

Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));

    return "Свежие мемы двухсекундной давности";
} 
