program project1;
var
  name:string;
begin
  write('Enter name: ');
  readln(name);
  if (name = '') then
  begin
    writeln('You need to enter a name!');
  end
  else if (name = 'Sean') then
  begin

    writeln('foobar');
  end

  else if (name = 'Brian') then
  begin

    writeln('random');
  end

  else
  begin
    writeln('Hello, ',name);
  end;
  readln;
end.

{   Write a program:
    Input an age, display comment based on age:
    0-4: tot; 5-12: kid; 13-19: teenager; 20-64 adult; 65+ senior;

    Use a loop to input positive numbers. Add up all the numbers and leave the
    loop on a negative number
}
