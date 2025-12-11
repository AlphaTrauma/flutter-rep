void main() {
    final List<int?> list = [1, null, 2, 3, 6, null, 15];

    print(transform(list));
}

List<int> transform(List<int?> list) {

    List<int> result = [];

    for(int? item in list) {
        result.add(item ?? 0);
    }

    return result;
}