program conditional_loop;

var
  name:string;
  i:integer;

begin
  { Pascal has 2 types of conditional loops. while and repeat }
  name := '';

  while (true) do
  begin
    i := i + 1;
    writeln(i);
    //readln(name);
    //writeln('Hello, ',name)
  end;

  //writeln('Nobody is perfect');
  //readln;

  { while : ends at the top, condition to stay
    do    : ends at the bottom, condition to leave }

end.

