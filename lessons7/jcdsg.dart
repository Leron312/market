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
    Employee('Vadim', 21, 'Middle', 100000)
  ];

  // Вывод исходного списка сотрудников
  print('Исходный список сотрудников:');
  for (final employee in myList) {
    print(
        '${employee.name} - ${employee.position} - ${employee.salary} - ${employee.age}');
  }

  // Логика увольнения сотрудников
  var toBeFired = myList.where((employee) {
    // Увольнение сотрудников, зарплата которых умноженная на возраст больше 1_000_000
    if (employee.salary * employee.age > 1000000) {
      // Если сотрудник не тим лид или сеньор, увольняем
      if (employee.position != 'Team Leader' && employee.position != 'Senior') {
        return true;
      }

      // Если сотрудник сеньор и зарплата больше 180 000, тоже увольняем
      if (employee.position == 'Senior' && employee.salary > 180000) {
        return true;
      }
    }
    return false;
  }).toList();

  // Вывод списка сотрудников, которых нужно уволить
  print('\nСписок сотрудников, которых нужно уволить:');
  for (final employee in toBeFired) {
    print(
        '${employee.name} - ${employee.position} - ${employee.salary} - ${employee.age}');
  }
}