void main(){
  // List numbers = [10, 30, 40, 10, 30, 20, 10, 40];
  //
  // var result = Set.of(numbers).toList();
  //
  // print(result);

  List names = ['John', 'Rick', 'Grimes', 'Rick', 'John', 'Carol'];

  var result = [...{...names}];
  print(result);
}