(*
Sorting and searching

  Why do we sort?
    To organize information so we can find things faster.

  Why do we search?
    To learn something or find information.
*)
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TPerp = record
    name, act, crime : string;
    fine, TotalFine : real;
    NumOffences : integer;

  end; // TPerp
  // Perp is called a record with 6 fields

  TPerpArray = array [1 .. 10] of TPerp;
  // An array of records, 10 rows with 6 columns per row
  // - good for integrating 2-dimensional data into a common structure.

  { TForm1 }

  TForm1 = class(TForm)
    btnSearchClick: TButton;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure TForm1.btnSearchClick(Sender : TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  perp : TPerpArray;
  NumPerps : integer;
  temp : TPerp;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  stream : text;
  i : integer;
  swap : boolean;
begin
  // Code to execute when the form is created
  // Basically,this occurs when the program starts up.
  // What you want the computer to do before the user gets crontrol.

  // Read the crimes text file
  AssignFile (stream, 'Crimes.txt');
  reset (stream);

  NumPerps := 0;
  while (not (eof (stream))) do
  begin
    NumPerps += 1;

    readln (stream, perp[NumPerps].name);
    readln (stream, perp[NumPerps].act);
    readln (stream, perp[NumPerps].crime);
    readln (stream, perp[NumPerps].fine);
    readln (stream, perp[NumPerps].NumOffences);
  end;

  // Close text file
  CloseFile (stream);

  // Sort info
  repeat
    swap := false;
    for i := 1 to NumPerps - 1 do
    begin
      if (perp[i].name > perp[i + 1].name) then
      begin
        // Swap Elements
        temp := perp [i];
        perp [i] := perp [i + 1];
        perp [i + 1] := temp;
        swap := true;
      end; // if
    end; // for
  until (not swap);


  // Output information
  for i := 1 to NumPerps do
  begin
    ListBox1.Items.Add (perp[i].name + ': ' + perp[i].crime);
  end; // for i
end;

procedure TForm1.btnSearchClick(Sender : TObject);
// Input a search name and find that person's info
var
  SearchName : string;
  i, FoundIndex : integer;
begin
  FoundIndex := -1;

  // Input a name
  SearchName := InputBox ('SEARCH  NAME', 'Enter Name', '');

  // Find SearchName in the list
  for i := 1 to NumPerps do
  begin
    if perp[i].name = SearchName then
    begin
      FoundIndex := i;
    end; // if
  end; // for i

  // Clear List Box
  for i := 1 to ListBox1.Items.Count do
  begin
    ListBox1.Items.Delete (0);
  end; // for i

  if FoundIndex = -1 then
  begin
    // Name not found
    ListBox1.Items.Add (SearchName + ' not found.');
  end

  else
  begin
    // Name found, display record
    ListBox1.Items.Add (perp[FoundIndex].name);
    ListBox1.Items.Add (perp[FoundIndex].act);
    ListBox1.Items.Add (perp[FoundIndex].crime);
    ListBox1.Items.Add (FloatToStr (perp[FoundIndex].fine));
    ListBox1.Items.Add (IntToStr (perp[FoundIndex].NumOffences));

  end;
end;

end.

