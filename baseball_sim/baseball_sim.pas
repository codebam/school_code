{
Name: Sean Behan
Date: 14/02/2016
Purpose:
    Run a simulation for a game baseball
}

program baseball_sim;

var
        stream : text;
        i, player, k, _singles, _doubles, _triples, _homeruns, out_count, score, score2, inning, active_pitcher : integer;
        _base : array[0..6] of integer;
        _player : array[0..1,0..8] of string;
        _ab, _h, _2b, _3b, _hr, random_number, singles : array[0..1,0..8] of integer;
        pitcher : array[0..1,0..1] of string;
        pitcher_so : array[0..1,0..1] of integer;
        half : integer;
        team : array[0..1] of string;

begin
        assign(stream, 'jays2015.txt');
        reset(stream);
        // open jays file
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

        assign(stream, 'kc_royals.txt');
        reset(stream);

        // open kc royals file
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

        pitcher[0,0] := 'Davis';
        pitcher_so[0,0] := 78;
        pitcher[0,1] := 'Madson';
        pitcher_so[0,1] := 58;
        // KC Pitchers
        pitcher[1,0] := 'Cecil';
        pitcher_so[1,0] := 70;
        pitcher[1,1] := 'Osuna';
        pitcher_so[1,1] := 75;
        // Jays Pitchers

        assign(stream, 'output.txt');
        rewrite(stream);
        // open output file

        player := 0;
        while ( player < 8 ) do
        begin
                singles[0,player] := _ab[0,player] - _h[0,player] - _2b[0,player] - _3b[0,player] -_hr[0,player];
                singles[1,player] := _ab[1,player] - _h[1,player] - _2b[1,player] - _3b[1,player] -_hr[1,player];
                player += 1;
        end;
        // calculate singles for each player

        randomize;
        team[0] := 'Kansas City Royals';
        team[1] := 'Toronto Blue Jays';
        inning := 1;
        score := 0;
        score2 := 0;
        _singles := 0;
        _doubles := 0;
        _triples := 0;
        _homeruns := 0;
        active_pitcher := 0;
        // initialize variables

        writeln(team[0],' vs ',team[1]);
        writeln(stream,team[0],' vs ',team[1]);

        while( inning < 10 ) do // loop through innings
        begin
                half := 0;
                writeln;
                writeln(stream);
                writeln('-----------------------------');
                writeln(stream,'-----------------------------');
                writeln('Inning ',inning);
                writeln(stream,'Inning ',inning);
                writeln('-----------------------------');
                writeln(stream,'-----------------------------');
                writeln;
                writeln(stream);

                while( half < 2 ) do // 2 halfs per inning
                begin
                                if (inning = 1) then
                                begin
                                        if (half = 0) then
                                        begin
                                             writeln;
                                             writeln(stream);
                                             writeln(pitcher[1,active_pitcher],' is pitching for the ',team[1]);
                                             writeln(stream,pitcher[1,active_pitcher],' is pitching for the ',team[1]);
                                        end
                                        else
                                        begin
                                             writeln;
                                             writeln(stream);
                                             writeln(pitcher[0,active_pitcher],' is pitching for the ',team[0]);
                                             writeln(stream,pitcher[0,active_pitcher],' is pitching for the ',team[0]);
                                        end;
                                end
                                else if (inning = 7) then
                                begin
                                        active_pitcher := 1;
                                        writeln(pitcher[half,active_pitcher],' is pitching for the ',team[half]);
                                        writeln(stream,pitcher[half,active_pitcher],' is pitching for the ',team[half]);
                                end;

                                writeln('The ',team[half],' are up to bat');
                                writeln(stream,'The ',team[half],' are up to bat');
                                writeln;
                                writeln(stream);

                                _base[0] := 404;
                                _base[1] := 404;
                                _base[2] := 404;
                                _base[3] := 404;
                                _base[4] := 404;
                                _base[5] := 404;
                                _base[6] := 404;
                                // 404 Base not found, set all bases to empty after each half inning

                                player := 0;
                                out_count := 0;
                                while (out_count < 3) do
                                begin
                                        if (player > 8) then
                                        begin
                                                player := 0
                                                // repeat batting lineup if there aren't 3 outs
                                        end;

                                        random_number[half,player] := random(_ab[half,player])+1-pitcher_so[half,active_pitcher];
                                        // subtracted pitcher stats and calculated single percentage

                                        if ((random_number[half,player] < 101) and (random_number[half,player] > 0)) then
                                        begin
                                                _base[6] := _base[5];
                                                _base[5] := _base[4];
                                                _base[4] := _base[3];
                                                _base[3] := _base[2];
                                                _base[2] := _base[1];
                                                _base[1] := _base[0];
                                                _base[0] := player;
                                                _singles += 1;
                                                writeln(_player[half,player],' gets a single.');
                                                writeln(stream,_player[half,player],' gets a single.');
                                                //single
                                        end
                                        else if (random_number[half,player] < (singles[half,player] + _2b[half,player])) then
                                        begin
                                                _base[6] := _base[5];
                                                _base[6] := _base[4];
                                                _base[5] := _base[3];
                                                _base[4] := _base[2];
                                                _base[3] := _base[1];
                                                _base[2] := _base[0];
                                                _base[1] := player;
                                                _base[0] := 404;
                                                _doubles += 1;
                                                writeln(_player[half,player],' gets a double.');
                                                writeln(stream,_player[half,player],' gets a double.');
                                                // double
                                        end
                                        else if (random_number[half,player] < (singles[half,player] + 1 + _2b[half,player])) then
                                        begin
                                                _base[6] := _base[4];
                                                _base[6] := _base[3];
                                                _base[5] := _base[2];
                                                _base[4] := _base[1];
                                                _base[3] := _base[0];
                                                _base[2] := player;
                                                _base[1] := 404;
                                                _base[0] := 404;
                                                _triples += 1;
                                                writeln(_player[half,player],' gets a triple.');
                                                writeln(stream,_player[half,player],' gets a triple.');
                                                // triple
                                        end
                                        else if (random_number[half,player] < _h[half,player]) then
                                        begin
                                                _base[6] := _base[2];
                                                _base[5] := _base[1];
                                                _base[4] := _base[0];
                                                _base[3] := player;
                                                _base[2] := 404;
                                                _base[1] := 404;
                                                _base[0] := 404;
                                                _homeruns += 1;
                                                writeln(_player[half,player],' gets a HOME RUN!');
                                                writeln(stream,_player[half,player],' gets a HOME RUN!');
                                                // home run
                                        end
                                        else
                                        begin
                                                out_count += 1;
                                                writeln(_player[half,player],' gets out.');
                                                writeln(stream,_player[half,player],' gets out.');
                                                // out
                                        end;

                                        while ((_base[3] <> 404) or (_base[4] <> 404) or (_base[5] <> 404) or (_base[6] <> 404)) do
                                        begin
                                                k := 3;
                                                while (k < 7) do
                                                begin
                                                                if (_base[k] <> 404) then
                                                                begin
                                                                        writeln(_player[half,_base[k]], ' gets a run!');
                                                                        writeln(stream,_player[half,_base[k]], ' gets a run!');
                                                                        _base[k] := 404;
                                                                        if (half = 0) then
                                                                        begin
                                                                                 score += 1;
                                                                         end
                                                                        else
                                                                        begin
                                                                                 score2 += 1;
                                                                        end;
                                                                        writeln('The score is:  ',score2,' - ',score);
                                                                        writeln(stream,'The score is:  ',score2,' - ',score);
                                                                 end;
                                                                 k += 1;
                                                        end;
                                                // count the score after each hit
                                        end;
                                        player += 1;
                                end;
                        half += 1;
                        if (( inning = 9 ) and ( half = 1 ) and ( score > score2 )) then
                        begin
                                writeln;
                                writeln(stream);
                                writeln('The ',team[1],' win!');
                                writeln(stream,'The ',team[1],' win!');
                                close(stream);
                                exit;
                                // if the home team is winning and it is the last half, end the game
                        end;
                end;
                inning += 1;
        end;
        if ((score < score2)) then
        begin
                writeln;
                writeln(stream);
                writeln('The ',team[0],' win!');
                writeln(stream,'The ',team[0],' win!');
        end
        else
        begin
                writeln;
                writeln(stream);
                writeln('The ',team[1],' win!');
                writeln(stream,'The ',team[1],' win!');
                // the blue jays won in the last half
        end;
        close(stream);
        // close output file
        readln;
        // for windows
end.
