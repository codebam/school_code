program project1;

var
  number : array [0 .. 20] of integer;
  i : integer;

begin
  i := 0;
  randomize;
  while (i < 21) do
  begin
    number[i] := random(100) + 1;
    writeln(number[i]);
    i += 1;
  end;
  readln;
end.

