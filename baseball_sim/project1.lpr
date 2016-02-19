{
Name: Sean Behan
Date: 14/02/2016
Purpose:
    Run a simulation for a game baseball
}

program baseball_sim;

var
   stream : text;
   i, j, k, _singles, _doubles, _triples, _homeruns, out_count, score, score2, inning : integer;
   _base : array[0..6] of integer;
   _player : array[0..1,0..8] of string; // fix refrences to this
   _ab, _h, _2b, _3b, _hr, random_number, singles : array[0..1,0..8] of integer;  // fix references to these
   half : integer;

begin
     assign(stream, 'jays2015.txt');
     reset(stream);
     // open jays file
     i := 0;
     while ( not EOF (stream) ) do
     begin
          readln(stream, _player[0,i]);
          readln(stream, _ab[0,i]);
          readln(stream, _h[0,i]);
          readln(stream, _2b[0,i]);
          readln(stream, _3b[0,i]);
          readln(stream, _hr[0,i]);
          i += 1;
     end;
     close(stream);
     // read into array and close file

     assign(stream, 'kc_royals.txt');
     reset(stream);

     // open kc royals file
     i := 0;
     while ( not EOF (stream) ) do
     begin
          readln(stream, _player[1,i]);
          readln(stream, _ab[1,i]);
          readln(stream, _h[1,i]);
          readln(stream, _2b[1,i]);
          readln(stream, _3b[1,i]);
          readln(stream, _hr[1,i]);
          i += 1;
     end;
     close(stream);
     // read into array and close file

     assign(stream, 'output.txt');
     rewrite(stream);
     // open output file

     j := 0;
     while ( j < 8 ) do
     begin
        singles[0,j] := _ab[0,j] - _h[0,j] - _2b[0,j] - _3b[0,j] -_hr[0,j];
        singles[1,j] := _ab[1,j] - _h[1,j] - _2b[1,j] - _3b[1,j] -_hr[1,j];
        // calculate for each batter
        j += 1;
     end;

     randomize;
     inning := 1;
     score := 0;
     score2 := 0;
     half := 1;

     while( inning < 10 ) do
     begin
     while( half > 0 ) do
     begin
     if ((inning = 9) and (score > score2)) then
     begin
          writeln('The Blue Jays win!');
          writeln(stream,'The Blue Jays win!');
     end
     else
     begin
          if ((inning mod 2) <> 0) then
          begin
               writeln;
               writeln('-------------------------------');
               writeln('Inning ',(inning div 2)+1);
               writeln('-------------------------------');
               writeln;
               writeln('The KC Royals are up to bat');
               writeln;

               writeln(stream);
               writeln(stream,'-------------------------------');
               writeln(stream,'Inning ',(inning div 2)+1);
               writeln(stream,'-------------------------------');
               writeln(stream);
               writeln(stream,'The KC Royals are up to bat');
               writeln(stream);
          end
          else
          begin
               writeln;
               writeln('The Blue Jays are up to bat');
               writeln;

               writeln(stream);
               writeln(stream,'The Blue Jays are up to bat');
               writeln(stream);
          end;

          _base[0] := 404;
          _base[1] := 404;
          _base[2] := 404;
          _base[3] := 404;
          _base[4] := 404;
          _base[5] := 404;
          _base[6] := 404;
          // 404 Base not found (404 is an empty base)

          j := 0;
          // j is the batter number (the loop counter)
          out_count := 0;
          while (out_count < 3) do
          begin
               if (j > 8) then
               begin
                    j := 0
               end;
               // repeat batting lineup if no one is out

               random_number[j] := random(_ab[j])+1;  // fix all these
               if (random_number[j] < 101) then
               begin
                    _base[6] := _base[5];
                    _base[5] := _base[4];
                    _base[4] := _base[3];
                    _base[3] := _base[2];
                    _base[2] := _base[1];
                    _base[1] := _base[0];
                    _base[0] := j;
                    _singles += 1;
                    writeln(_player[j],' gets a single.');
                    writeln(stream,_player[j],' gets a single.');
                    //single
                end
                else if (random_number[j] < (singles[j] + _2b[j])) then
                begin
                     _base[6] := _base[5];
                     _base[6] := _base[4];
                     _base[5] := _base[3];
                     _base[4] := _base[2];
                     _base[3] := _base[1];
                     _base[2] := _base[0];
                     _base[1] := j;
                     _base[0] := 404;
                     _doubles += 1;
                     writeln(_player[j],' gets a double.');
                     writeln(stream,_player[j],' gets a double.');
                     // double
                end
                else if (random_number[j] < (singles[j] + 1 + _2b[j])) then
                begin
                     _base[6] := _base[4];
                     _base[6] := _base[3];
                     _base[5] := _base[2];
                     _base[4] := _base[1];
                     _base[3] := _base[0];
                     _base[2] := j;
                     _base[1] := 404;
                     _base[0] := 404;
                     _triples += 1;
                     writeln(_player[j],' gets a triple.');
                     writeln(stream,_player[j],' gets a triple.');
                     // triple
                end
                else if (random_number[j] < _h[j]) then
                begin
                     _base[6] := _base[2];
                     _base[5] := _base[1];
                     _base[4] := _base[0];
                     _base[3] := j;
                     _base[2] := 404;
                     _base[1] := 404;
                     _base[0] := 404;
                     _homeruns += 1;
                     writeln(_player[j],' gets a HOME RUN!');
                     writeln(stream,_player[j],' gets a HOME RUN!');
                     // home run
                end
                else
                begin
                     out_count += 1;
                     writeln(_player[j],' gets out.');
                     writeln(stream,_player[j],' gets out.');
                     // out
                end;

                while ((_base[3] <> 404) or (_base[4] <> 404) or (_base[5] <> 404) or (_base[6] <> 404)) do
                begin
                     k := 3;
                     while (k < 7) do
                     begin
                          if (_base[k] <> 404) then
                          begin
                               writeln(_player[_base[k]], ' gets a run!');
                               writeln(stream,_player[_base[k]], ' gets a run!');
                               _base[k] := 404;
                               if ((inning mod 2) = 0) then
                               begin
                                  score2 += 1; //fix
                               end
                               else
                               begin
                                    score += 1;
                               end;
                               writeln('The score is:  ',score2,' - ',score);
                               writeln(stream,'The score is:  ',score2,' - ',score);
                          end;
                          k += 1;
                     end;
                // count the score
                end;

     j += 1;
     end;
     end;
     half -= 1;
     end;
     inning += 1;
     end;

     if ((inning = 18) and (score < score2)) then
     begin
          writeln('The KC Royals win!');
          writeln(stream,'The KC Royals win!');
     end;

     close(stream);
     // close output file

     readln; // for windows
end.
