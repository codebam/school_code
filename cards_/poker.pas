program poker;
uses cards, poker_lib;

// Library of card playing routines
// Librarys are Data types, variables, routines made availible to other programmers

type
  THand : array[0..4] of integer;

function identify_hand(hand : THand) : string;
var
        tally_rank : array[2..14] of integer;
        tally_suit : array[0..3] of integer;
begin

end; // procedure identify_hand

var
        i : integer;
        hand : THand;
        handtype : string;

begin
        hand[0] := 32;
        hand[1] := 30;
        hand[2] := 6;
        hand[3] := 19;
        hand[4] := 11;

        handtype := identify_hand(hand);
        writeln(handtype);
end.

