void main() {
  //list
  var myList = [25, 63, 84];

  //traverse through each element of list
  for (var i = 0; i < myList.length; i++) {
    print(myList[i]);
  }

  var myListIter = myList.iterator;

  //iterate over the list
  while(myListIter.moveNext()){
    print(myListIter.current);
  }
}
