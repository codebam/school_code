program random_number;

var
  iNumber, i : integer;

begin
  randomize;
  while (true) do
  begin
        iNumber := random(10);
        writeln(iNumber);
  end;
  readln;
end.

{ random will generate the same sequence of random numbers if you dont use the
  randomize command. use it at the beggining of the program to generate random
  numbers. only needs to be executed once and never in a loop }
