// Poker - a card playing game.
// Before we cal program poker, we have to program cards.
// We have to program card routines first.
// What routines do we need:
//      Dealing cards, selecting a card, storing cards
//      represent the cards, identify rank and suit
program project1;

(*
How do we represent the cards?
use the numbers from 0-51 to represent the 52 cards.
0:2 diamonds, 1:3 diamonds ... 51: Ace of Spades
*)

type
        TDeck = array[0..51] of integer;

function GetSuit(CardNumber : integer) : integer;
// returns the suit number of a given card
begin
        GetSuit := CardNumber div 13;
end; // function getsuit

function GetRank(CardNumber : integer) : integer;
// returns the rank number of a given card
begin
        GetRank := CardNumber mod 13 + 2;
end; // function getrank

function RankStr(rank : integer) : string;
// convert an integer card rank to its equivalent string
begin
        if (Rank >= 2) and (rank <= 9) then
        begin
                RankStr := chr(Rank + 48);
        end
        else if (rank = 10) then
        begin
                RankStr := '10';
        end
        else if (rank = 11) then
        begin
                RankStr := 'Jack';
        end
        else if (rank = 12) then
        begin
                RankStr := 'Queen';
        end
        else if (rank = 13) then
        begin
                RankStr := 'King';
        end
        else if (rank = 14) then
        begin
                RankStr := 'Ace';
        end
        else
        begin
                RankStr := 'Value Error';
        end;
end; // function rankstr

function SuitStr(SuitNum : integer) : string;
// convert a suit number to its cooresponding string
begin
        if (SuitNum = 0) then
                SuitStr := 'Diamonds'
        else if (SuitNum = 1) then
                SuitStr := 'Clubs'
        else if (SuitNum = 2) then
                SuitStr := 'Hearts'
        else if (SuitNum = 3) then
                SuitStr := 'Spades'
        else
                SuitStr := 'Joker';
end;

function CardStr(RankNum, SuitNum : integer) : string;
begin
        CardStr := RankStr(RankNum)+' of '+SuitStr(SuitNum);
end; // function cardstr

procedure InitDeck(var Deck : TDeck);
// Initialize the deck of cards
var
        i : integer;
begin
        for i := 0 to 51 do
        begin
                Deck[i] := i;
        end;
end; // function initdeck

// MAIN PROGRAM ----------------------------------

var
        suit, rank, CardNum : integer;
        Deck : TDeck;

begin
        InitDeck(Deck);
        CardNum := 35;
        suit := GetSuit(CardNum);
        rank := GetRank(CardNum);
        writeln(CardStr(rank, suit));

        readln;
end.

