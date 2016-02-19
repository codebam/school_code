{
Name: Sean
Date: 08/02/2016
Purpose:
    Input an age, display comment based on age:
    0-4: tot; 5-12: kid; 13-19: teenager; 20-64 adult; 65+ senior;
}

program main;

function getage(age: real): string;

     begin
          if ( age < 0 ) then
          begin
               getage := ( 'Hello time traveller!' );
          end

          else if ( age < 13 ) then
          begin
               getage := ( 'hey kid!' );
          end

          else if ( age < 20 ) then
          begin
               getage := ( 'whats up teenager!' );
          end

          else if ( age < 65 ) then
          begin
               getage := ( 'yo adult!' );
          end

          else if ( age > 65 ) then
          begin
               getage := ( 'ah senior!' );
          end

          else
          begin
               getage := ( 'Error in var age' );
          end;
     end;

var
     age : integer;

begin
     write('Input your age: ');
     readln(age);
     writeln(getage(age));
     readln;
end.

