// Procedures - breaking a program into smaller and simpler chunks
// Example: Input a number of girls he knows, prob of getting a date and
//          calculate how many expected dates he will get.

program project1;

procedure InputData (var name: string; NumGirls : integer;
        var ProbDate : real );
begin
        write('Enter name: ');
        readln(name);

        write('Number of girls ', name, ' knows: ');
        readln(NumGirls);

        write('Probability ',name,' gets a date: ');
        readln(ProbDate);
end; // procedure InputData

procedure CalculateNumberOfDates(NumGirls : integer; ProbDate : real;
        var ExpectedNumDates: real);
begin
        ExpectedNumDates := NumGirls * ProbDate;
end;

procedure DisplayResults(ExpectedNumDates: real);
begin
        writeln('Expected Number of dates is ', round(ExpectedNumDates * 100) / 100 :0 :2, ' dates.');
end; // procedure DisplayResults

// Main
var
  n : string;
  NG : integer;
  PB, ExpDates : real;
begin
     InputData(n,NG,PB);
     CalculateNumberOfDates(NG, PB, ExpDates);
     DisplayResults(ExpDates);
     readln;
end.

(*
        This Example divided the program into 3 parts and procedures were written
        for each part. The idea is to simplify each task.

        Parameters are the variables in each procedure heading.
        2 types: fixed parameters (no var, treat as constants, "input")
                 variable parameters (var, treat as variables, "output")

        arguements: values/variables in main program passed up to the procedures.
                    Data type of arguement with corresponding parameter must match.

        local variables: declared within a structure and does not exist outside
                         the structure. Eg. parameters are declared in procedures
                         and do not exist outside a procedure.

        global variables: declared at the top of the program and are recognised
                          anywhere in the program. Are considered bad.

*)
