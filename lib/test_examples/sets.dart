/*
void main() {
  // Creating a simple set of integers
  Set<int> numbers = {1, 2, 3, 4, 5};

  // Adding an element to the set
  numbers.add(6);

  // Removing an element from the set
  numbers.remove(3);

  // Checking if an element exists in the set
  bool containsFour = numbers.contains(10);

  // Printing the set
  print("Numbers: $numbers");
  print("Contains 4: $containsFour");
}
*/

class Student {
  final int id;
  final String name;

  Student(this.id, this.name);

  @override
  String toString() {
    return 'Student{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Student && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

void main() {
  // Creating sets of Student objects
  Set<Student> classA = {Student(1, "Alice"), Student(2, "Bob"), Student(3, "Charlie")};
  Set<Student> classB = {Student(2, "Bob"), Student(4, "David"), Student(5, "Eve")};

  // Union of classA and classB
  Set<Student> union = classA.union(classB);

  // Intersection of classA and classB
  Set<Student> intersection = classA.intersection(classB);

  // Difference between classA and classB
  Set<Student> difference = classA.difference(classB);

  // Printing the results
  print("Class A: $classA");
  print("Class B: $classB");
  print("Union: $union");
  print("Intersection: $intersection");
  print("Difference: $difference");
}
