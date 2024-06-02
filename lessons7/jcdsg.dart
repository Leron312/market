class Employee {
  String name;
  int age;
  String position;
  int salary;

  Employee(this.name, this.age, this.position, this.salary);
}

void main() {
  var myList = [
    Employee('Max', 22, 'Team Leader', 500000),
    Employee('Andre', 17, 'Intern', 10000),
    Employee('Nurgazy', 16, 'Intern', 10000),
    Employee('Oleg', 18, 'Junior', 25000),
    Employee('Baatyr', 16, 'Senior', 150000),
    Employee('Akmaral', 17, 'Middle', 70000),
    Employee('Sheerin', 15, 'Junior', 30000),
    Employee('Dilnaza', 23, 'Senior Flutter Developer', 200000),
    Employee('Vadim', 21, 'Middle', 100000),
  ];

  print('Список сотрудников, которых нужно уволить:');
  for (final employee in myList) {
    switch (employee.salary * employee.age > 1000000) {
      case true:
        switch (employee.position) {
          case 'Team Leader':
          case 'Senior':
            if (employee.position == 'Senior' && employee.salary > 180000) {
              print('${employee.name} - ${employee.position} - ${employee.salary} - ${employee.age}');
            }
            default:
            print(
                '${employee.name} - ${employee.position} - ${employee.salary} - ${employee.age}');
        }
        break;
      case false:
        break;
    }
  }
}