var hashRomanToArab = {
  M: 1000,
  CM: 900,
  D:  500,
  CD: 400,
  C:  100,
  XC:  90,
  L:   50,
  XL:  40,
  X:   10,
  IX:   9,
  V:    5,
  IV:   4,
  I:    1
}

var hashBigRomanToArab = {
    "&#x033F;&#x0333;": 1000000000000, // Combining double over + double low line
    "&#x033F;&#x0332;": 1000000000, //    Combining double over + low line
    "&#x0305;&#x0332;": 1000000, //       Combining over + low line
    "&#x0305;":         1000 //           Combining over line
  }


// to_roman functions

function to_roman(number) {
  if (Math.floor(number) < 1) {
    return "";
  } else if (number < 5000) {
    var number = Math.floor(number)
  } else if (number >= 5000000000000000) {
    puts("All hope is lost! Number " + number +
      " \nis too damn big for roman numerals!", "result")
  } else {
    return big_roman(Math.floor(number))
  }

  var memo = "";

  for (var roman_letter in hashRomanToArab) {
    if (hashRomanToArab.hasOwnProperty(roman_letter)) {
      var value = hashRomanToArab[roman_letter];
      memo += times(roman_letter, (number / value));
      number %= value;
    }
  }
  return memo;
}

function big_roman(number) {
  var memo = "";

  for (var combiningChar in hashBigRomanToArab) {
    if (hashBigRomanToArab.hasOwnProperty(combiningChar)) {
      var factor = hashBigRomanToArab[combiningChar];
      memo += combine(to_roman(number / factor), combiningChar);
      number %= factor;
    }
  }
  
  return memo + to_roman(number);
}


// Custom functions
function combine(str, combiningChar){
  var memo = "";
  for (var i = 0, len = str.length; i < len; i++) {
    memo +=  str.charAt(i) + combiningChar;
  }
  return memo;
}

function puts(line, /* into */ id) {
  document.getElementById(id).innerHTML = line + "\n<br>";
  return true
}

function times(str, repetitions) {
  return Array(Math.floor(repetitions) + 1).join(str);
}