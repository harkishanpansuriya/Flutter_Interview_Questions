void main(){
  final list = ["apple", "banana", "apple", "cherry", "banana", "apple", "date", "date"];
  final counts = <String, int>{};

  for (String item in list){
    counts[item] = (counts[item] ?? 0) + 1;
  }

  for (String key in counts.keys) {
    print('$key: ${counts[key]} times');
  }
}