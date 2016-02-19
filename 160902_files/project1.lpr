program project1;

var
  name, joke : string;
  number : integer;
  stream : text;

begin
  // open for reading
  assign(stream, 'new.txt');
  reset(stream); // use rewrite (stream) if you are saving

  // read the data
  readln(stream, name); // use writeln if you are saving
  readln(stream, joke);
  readln(stream, number);

  // close the file
  close(stream);

  // display data
  writeln(name);
  writeln(joke);
  writeln(number);
  readln;
end.

