// Functions: another type of subprogram like a procedure.
// Example: add the integers from 1 to n, where n is passed.
program project1;

function SumTo(number : integer) : integer;
var i, sum : integer;
begin
        SumTo := (number * (number + 1))div 2;
end;

// main
var
        number: integer;
begin
        // input a number from the user
        write('Enter a number: ');
        readln(number);

        writeln(SumTo(number));

        readln;
end.

{
        Functions are treated as values: you can display, store, or do math with it
        Procedures are treated as commands: a procedure call takes up its own line.

        Note: in the major programming languages (C, Java, Python), there are no
        such thing as procedures. They have functions only. However, you can use a
        function as a procedure in those languages.
}

