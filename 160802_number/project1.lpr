{
Name: Sean Behan
Date: 08/02/2016
Purpose:
    Use a loop to input positive numbers. Add up all the numbers and leave the
    loop on a negative number
}

program project1;

var
  number, total : real;

begin

  writeln('This program will add all numbers you enter and display the result.');
  writeln('If you enter a negative number it will exit.');
  writeln;

  total := 0;
  repeat
        write('Enter a number: ');
        readln(number);
        total := total + number;
        writeln('The total is now: ',total : 0 : 2);
        writeln;
  until  number < 0;

end.

