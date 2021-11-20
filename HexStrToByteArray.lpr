{Free Pascal Program To Convert Hex String To ByteArray}
{Program:  HexStringToByteArray;}
{Version: 0.1}
{Date: 10/11/2021}
{Author:   Dhananjay M. Bhate}
{Email:    dhanabh1010@gmail.com }


program HexStrToByteArray;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,Sysutils,StrUtils
  { you can add units after this };
Type
  TByteArray = array[1..256] of Byte;


var
  input_hex_str : string;
  nibble1, nibble2 : integer;
  ByteArray : TByteArray;
  cnt1, cnt2,num1,num2,len : integer;


begin
  cnt1 :=1;
  cnt2 := 1;
  input_hex_str := 'FFEEAA1500112ACB';
  len := length(input_hex_str);

  writeln('Input String: ',input_hex_str);

  while(cnt1 < len )do
  begin
    num1:= Hex2Dec(input_hex_str[cnt1]);
    num2:= Hex2Dec(input_hex_str[cnt1+1]);
    writeln('-------------------------------------------------------------');
    writeln('Num1 = ', num1);
    writeln('Num2 = ', num2);
    nibble1 := num1 << 4;
    nibble2 := nibble1 or num2;

    ByteArray[cnt2] := Byte(nibble2);

    writeln('Byte(Decimal) = ', ByteArray[cnt2]);
    writeln('Byte(Hex) = ', HexStr(ByteArray[cnt2],2));


    cnt2 := cnt2 +1;
    cnt1 := cnt1 +2;
  end;

end.

