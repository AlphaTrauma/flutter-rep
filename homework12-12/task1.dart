void main() {

   List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
   print(filterEvenNumbers(list));

   List<Student> students = [Student('John', 20, 3.7), Student('Susan', 18, 4.6),  Student('Iren', 19, 4.0), Student('Will', 18, 2.0)];
   print(sortStudentsByGPA(students));
}

List<int> filterEvenNumbers(List<int> list) {
    return list.where((item) => item % 2 == 0).toList();
}

class Student {
    final String name;
    final int age;
    final double gpa;

    @override
    String toString() {
        return "$name $gpa";
    }

    Student(this.name, this.age, this.gpa);
}

List<Student> sortStudentsByGPA(List<Student> students) {

    students.sort((first, second) => second.gpa.compareTo(first.gpa)); 

    return students;
}