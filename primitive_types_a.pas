{
MIT License

Copyright (c) 2017 Luiz Carlos Mendonça Júnior

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
}

unit primitive_types_a;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, primitive_types;

type

  { TIntegerType }

  TIntegerType = class(TInterfacedObject, IntegerType)
  private
    FValue: integer;
  public
    constructor Create(const Value: integer); overload;
    constructor Create; overload;
    function SetValue(const Value: integer): IntegerType;
    function Value: integer;
    function Inc: IntegerType; overload;
    function Inc(const AValue: integer): IntegerType; overload;
    function Dec: IntegerType; overload;
    function Dec(const AValue: integer): IntegerType; overload;
  end;

  { TStringType }

  TStringType = class(TInterfacedObject, StringType)
  private
    FValue: string;
  public
    constructor Create; overload;
    constructor Create(const AString: string); overload;
    function SetValue(const Value: string): StringType;
    function Value: string;
    function Copy(const FromPosition, Count: IntegerType): StringType;
    function Format(const Args: array of const): StringType;
    function Length: IntegerType;
  end;

  { TDoubleType }

  TDoubleType = class(TInterfacedObject, DoubleType)
  private
    FValue: double;
  public
    function SetValue(const Value: double): DoubleType;
    function Value: double;
  end;

  { TDateTimeType }

  TDateTimeType = class(TInterfacedObject, DateTimeType)
  private
    FValue: TDateTime;
  public
    function SetValue(const Value: TDateTime): DateTimeType;
    function Value: TDateTime;
  end;

  { TBooleanType }

  TBooleanType = class(TInterfacedObject, BooleanType)
  private
    FValue: boolean;
  public
    constructor Create(const ABoolean: boolean); overload;
    function SetValue(const Value: boolean): BooleanType;
    function Value: boolean;
    function ToString(const IfTrue, IfFalse: StringType): StringType; overload;
    function ToInteger(const IfTrue, IfFalse: IntegerType): IntegerType;
  end;

implementation

{ TStringType }

constructor TStringType.Create;
begin
  Create('');
end;

constructor TStringType.Create(const AString: string);
begin
  SetValue(AString);
end;

function TStringType.SetValue(const Value: string): StringType;
begin
  Result:=Self;
  FValue:=Value;
end;

function TStringType.Value: string;
begin
  Result:=FValue;
end;

function TStringType.Copy(const FromPosition, Count: IntegerType): StringType;
begin
  Result:=TStringType.Create(System.Copy(Value, FromPosition.Value, Count.Value));
end;

function TStringType.Format(const Args: array of const): StringType;
begin
  Result:=TStringType.Create(SysUtils.Format(Value, Args));
end;

function TStringType.Length: IntegerType;
begin
  Result:=TIntegerType.Create(System.Length(Value));
end;

{ TBooleanType }

constructor TBooleanType.Create(const ABoolean: boolean);
begin
  Create;
  FValue:=ABoolean;
end;

function TBooleanType.SetValue(const Value: boolean): BooleanType;
begin
  Result:=Self;
  FValue:=Value;
end;

function TBooleanType.Value: boolean;
begin
  Result:=FValue;
end;

function TBooleanType.ToString(const IfTrue, IfFalse: StringType): StringType;
begin
  if Value then
    Result:=IfTrue
  else
    Result:=IfFalse;
end;

function TBooleanType.ToInteger(const IfTrue, IfFalse: IntegerType
  ): IntegerType;
begin
  if Value then
    Result:=IfTrue
  else
    Result:=IfFalse;
end;

{ TDateTimeType }

function TDateTimeType.SetValue(const Value: TDateTime): DateTimeType;
begin
  Result:=Self;
  FValue:=Value;
end;

function TDateTimeType.Value: TDateTime;
begin
  Result:=FValue;
end;

{ TDoubleType }

function TDoubleType.SetValue(const Value: double): DoubleType;
begin
  Result:=Self;
  FValue:=Value;
end;

function TDoubleType.Value: double;
begin
  Result:=FValue;
end;

{ TIntegerType }

constructor TIntegerType.Create(const Value: integer);
begin
  FValue:=Value;
end;

constructor TIntegerType.Create;
begin
  Create(0);
end;

function TIntegerType.SetValue(const Value: integer): IntegerType;
begin
  Result := Self;
  FValue := Value;
end;

function TIntegerType.Value: integer;
begin
  Result := FValue;
end;

function TIntegerType.Inc: IntegerType;
begin
  Result:=Inc(1);
end;

function TIntegerType.Inc(const AValue: integer): IntegerType;
begin
  Result:=Self;
  System.Inc(FValue,AValue);
end;

function TIntegerType.Dec: IntegerType;
begin
  Result:=Dec(1);
end;

function TIntegerType.Dec(const AValue: integer): IntegerType;
begin
  Result:=Self;
  System.Dec(FValue,AValue);
end;

end.
