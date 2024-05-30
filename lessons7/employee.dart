class Employee {
  final String name;
  final int age;
  final String position;
  final int salary;

  Employee(this.name, this.age, this.position, this.salary);

  @override
  String toString() {
    // чтобы печатать состояние объекта в терминале
    return 'Employee{$name, $age, $position, $salary}';
  }


}

void main(){
var myList = [
  Employee('Max', 22, 'Team Leader', 500000),
  Employee('Andre', 17, 'Intern', 10000),
  Employee('Nurgazy', 16, 'Intern', 10000),
  Employee('Oleg', 18, 'Junior', 25000),
  Employee('Baatyr', 16, 'Senior', 150000),
      Employee('Akmaral', 17, 'Middle', 70000),
      Employee('Sheerin', 15, 'Junior', 30000),
  Employee('Dilnaza', 23, 'Senior Flutter Developer', 200000),
  Employee('Vadim', 21, 'Middle', 100000)
];

for (var element in myList) {
//   if (employee)
// }


}

