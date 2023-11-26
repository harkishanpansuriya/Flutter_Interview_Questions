// void main() {
//   // Reverse a string
//   String reversedString = reverseString("hello");
//   print("Reversed String: $reversedString");
//
//   // Check if a string is a palindrome
//   bool isPalindrome = isStringPalindrome("racecar");
//   print("Is Palindrome: $isPalindrome");
//
//   // Find the longest common substring of two strings
//   String commonSubstring = findLongestCommonSubstring("abcdef", "acdfg");
//   print("Longest Common Substring: $commonSubstring");
//
//   // Count the number of occurrences of a substring in a string
//   int substringCount = countSubstringOccurrences("hello world", "l");
//   print("Substring Occurrences: $substringCount");
//
//   // Find the longest substring without repeating characters
//   String longestSubstring = findLongestSubstringWithoutRepeats("abcabcbb");
//   print("Longest Substring Without Repeats: $longestSubstring");
//
//   // Replace all occurrences of a substring in a string
//   String replacedString = replaceSubstring("hello hello", "hello", "hi");
//   print("Replaced String: $replacedString");
//
//   // Split a string into an array of substrings using a delimiter
//   List<String> substrings = splitString("apple,banana,cherry", ",");
//   print("Substrings: $substrings");
//
//   // Check if a string is valid JSON
//   bool isValidJson = isStringValidJson('{"name": "John", "age": 30}');
//   print("Is Valid JSON: $isValidJson");
//
//   // Encode and decode a string using Base64
//   String encodedString = encodeBase64("hello");
//   String decodedString = decodeBase64(encodedString);
//   print("Encoded String: $encodedString");
//   print("Decoded String: $decodedString");
//
//   // Generate a random string
//   String randomString = generateRandomString(8);
//   print("Random String: $randomString");
//
//   // Format a date and time as a string
//   String formattedDateTime = formatDateTime(DateTime.now());
//   print("Formatted DateTime: $formattedDateTime");
//
//   // Validate a string as an email address or phone number
//   bool isEmailValid = isValidEmail("john.doe@example.com");
//   bool isPhoneValid = isValidPhoneNumber("+1234567890");
//   print("Is Email Valid: $isEmailValid");
//   print("Is Phone Number Valid: $isPhoneValid");
// }
//
// String reverseString(String input) => String.fromCharCodes(input.runes.toList().reversed);
//
// bool isStringPalindrome(String input) => input == reverseString(input);
//
// String findLongestCommonSubstring(String str1, String str2) {
//   // Implementation to find the longest common substring
//   int m = str1.length;
//   int n = str2.length;
//   List<List<int>> dp = List.generate(m + 1, (i) => List<int>.filled(n + 1, 0));
//
//   int maxLength = 0;
//   int endIndex = 0;
//
//   for (int i = 1; i <= m; i++) {
//     for (int j = 1; j <= n; j++) {
//       if (str1[i - 1] == str2[j - 1]) {
//         dp[i][j] = dp[i - 1][j - 1] + 1;
//         if (dp[i][j] > maxLength) {
//           maxLength = dp[i][j];
//           endIndex = i - 1;
//         }
//       }
//     }
//   }
//
//   return str1.substring(endIndex - maxLength + 1, endIndex + 1);
// }
//
// int countSubstringOccurrences(String input, String substring) {
//   int count = 0;
//   int index = input.indexOf(substring);
//   while (index != -1) {
//     count++;
//     index = input.indexOf(substring, index + 1);
//   }
//   return count;
// }
//
// String findLongestSubstringWithoutRepeats(String input) {
//   // Implementation to find longest substring without repeating characters
//   // ...
//   return "substringWithoutRepeats";
// }
//
// String replaceSubstring(String input, String target, String replacement) {
//   return input.replaceAll(target, replacement);
// }
//
// List<String> splitString(String input, String delimiter) {
//   return input.split(delimiter);
// }
//
// bool isStringValidJson(String input) {
//   try {
//     json.decode(input);
//     return true;
//   } catch (e) {
//     return false;
//   }
// }
//
// String encodeBase64(String input) => base64Encode(utf8.encode(input));
//
// String decodeBase64(String encodedString) => utf8.decode(base64Decode(encodedString));
//
// String generateRandomString(int length) {
//   final random = Random();
//   const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
//   return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length)));
// }
//
// String formatDateTime(DateTime dateTime) {
//   final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
//   return formatter.format(dateTime);
// }
//
// bool isValidEmail(String input) {
//   final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
//   return emailRegex.hasMatch(input);
// }
//
// bool isValidPhoneNumber(String input) {
//   final phoneRegex = RegExp(r'^\+\d{10}$');
//   return phoneRegex.hasMatch(input);
// }
