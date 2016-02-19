program InputCalcOutput;
{ input 2 numbers and divide them }
var
  x, y : integer;
  q : real;
  name : string;
begin
  { input users name }
  write('What is your name? ');
  readln(name);

  write(name, ', enter the first number: ');
  readln(x);

  write('Enter the second number: ');
  readln(y);

  q := x / y;
  write('The answer is ',q:0:3);

  readln;
end.

