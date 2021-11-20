{Free Pascal Program To Convert Hex String To ByteArray}
{Program:  HexStringToByteArray;}
{Author: Dhananjay M. Bhate}
{Email: dhanabh1010@gmail.com }

program HexStringToByteArray;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,Sysutils,StrUtils
  { you can add units after this };
Type
  arr = array[1..256] of Byte;


var
  input_hex_str : string;
  nibble1, nibble2 : integer;
  ByteArray : arr;
  cnt1, cnt2,num1,num2,len : integer;


begin
  cnt1 :=1;
  cnt2 := 1;
  input_hex_str := 'FFEEAA15';
  len := length(input_hex_str);
  while(cnt1 < len )do
  begin
    num1:= Hex2Dec(input_hex_str[cnt1]);
    num2:= Hex2Dec(input_hex_str[cnt1+1]);
    writeln('Num1 = ', num1);
    writeln('Num2 = ', num2);
    nibble1 := num1 << 4;
    nibble2 := nibble1 or num2;

    ByteArray[cnt2] := Byte(nibble2);
    writeln('Added Byte = ', (ByteArray[cnt2]));


    cnt2 := cnt2 +1;
    cnt1 := cnt1 +2;
  end;

end.

