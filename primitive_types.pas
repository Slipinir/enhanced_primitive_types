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

unit primitive_types;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { IntegerType }

  IntegerType = interface
    ['{FD9280BA-D955-4BD3-8F3C-FBE6E4B75A4E}']
    function SetValue(const Value: integer): IntegerType;
    function Value: integer;
    function Inc: IntegerType; overload;
    function Inc(const AValue: integer): IntegerType; overload;
    function Dec: IntegerType; overload;
    function Dec(const AValue: integer): IntegerType; overload;
  end;

  { StringType }

  StringType = interface
    ['{AF4A47EB-36A2-4C97-8527-0223FD1B7AF4}']
    function SetValue(const Value: string): StringType;
    function Value: string;
    function Length: IntegerType;
    function Copy(const FromPosition, Count: IntegerType): StringType;
    function Format(const Args: array of const): StringType;
  end;

  { DoubleType }

  DoubleType = interface
    ['{F30422F7-1ECE-47F2-8B68-12CBC325C828}']
    function SetValue(const Value: double): DoubleType;
    function Value: double;
  end;

  { DateTimeType }

  DateTimeType = interface
    ['{8FD1AECE-028D-47BD-9318-19FF8ECEA69E}']
    function SetValue(const Value: TDateTime): DateTimeType;
    function Value: TDateTime;
  end;

  { BooleanType }

  BooleanType = interface
    ['{31E2A743-8EF4-436F-9F66-38B708DBD765}']
    function SetValue(const Value: boolean): BooleanType;
    function Value: boolean;
    function ToString(const IfTrue, IfFalse: StringType): StringType; overload;
    function ToInteger(const IfTrue, IfFalse: IntegerType): IntegerType;
  end;

  { StreamType }

  StreamType = interface
    ['{8B067126-C0FA-42A1-8139-04F4EFEAE96A}']
    function SerValue(const Value: TStream): StreamType;
    function Value: TStream;
  end;

implementation

end.
