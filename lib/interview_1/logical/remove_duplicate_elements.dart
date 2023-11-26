void main(){
  List<String> countries = [
    "Nepal",
    "Nepal",
    "USA",
    "Canada",
    "Canada",
    "China",
    "Russia",
  ];

  var seen = Set<String>();
  List<String> list = countries.where((element) => seen.add(element)).toList();
  print(list);  
}