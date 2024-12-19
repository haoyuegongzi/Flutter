main() {
  // 通过字符串构造日期
  final DateTime date5 = DateTime.now();
  DateTime date1 = DateTime.parse('2023-10-17');

  // 通过指定年、月、日构造日期
  DateTime date2 = DateTime(2023, 10, 17);

  // 通过时间戳构造日期
  DateTime date3 = DateTime.fromMillisecondsSinceEpoch(1697404800000); // 对应 2023-10-17

  // 比较日期
  compareDates(date1, date2);
  compareDates(date1, date3);
}

void compareDates(DateTime dateA, DateTime dateB) {
  // 使用 == 运算符比较
  if (dateA == dateB) {
    print('$dateA is equal to $dateB');
  } else {
    print('$dateA is not equal to $dateB');
  }
  // 使用 compareTo 方法比较
  int comparison = dateA.compareTo(dateB);
  if (comparison < 0) {
    print('$dateA is before $dateB');
  } else if (comparison > 0) {
    print('$dateA is after $dateB');
  } else {
    print('$dateA is equal to $dateB');
  }
}