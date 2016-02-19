{
Name: Sean Behan
Date: 14/02/2016
Purpose:
    Roll dice and show patterns
}

program dice;

type
        IntArray = array[0..2] of integer;

function bubble_sort(var _array : IntArray) : IntArray;
        var
                i, j, temp, n : integer;
begin
        n := length(_array);
        for i := n downto 2 do
        begin
                for j := 0 to i - 1 do
                begin
                        if _array[j] > _array[j + 1] then
                        begin
                                temp := _array[j];
                                _array[j] := _array[j + 1];
                                _array[j + 1] := temp;
                        end;
                end;
        end;
        bubble_sort := _array;
end;

function find_patterns(die : IntArray) : string;
var
        _pattern : string;

begin
        _pattern := 'none';
        if ((die[0] = die[1])
        and (die[1] = die[2])) then
        begin
                _pattern := 'triple';
        end
        else if ((die[0] = die[1]) or (die[1] = die[2])) then
        begin
                _pattern := 'double';
        end
        else if ((die[0]+1 = die[1]) and (die[1]+1 = die[2])) then
        begin
                _pattern := 'straight';
        end;
        // check for pattern
        find_patterns := _pattern;
end;

var
        i, j : integer;
        die : array [0..2] of integer;

begin
        randomize;
        writeln('Die 1  Die 2  Die 3  Pattern');
        // chart header

        i := 0;
        while (i < 16) do
        begin
                j := 0;
                while (j < 3) do
                begin
                        die[j] := random(6)+1;
                        write(die[j],'      ');
                        // display rolls
                        j += 1;
                end;

                die := bubble_sort(die);
                // sort the die array with bubble sort
                write(find_patterns(die));
                // display patterns
                writeln;
                // new line for each roll
                i += 1;
        end;
        readln; // for windows

end.
