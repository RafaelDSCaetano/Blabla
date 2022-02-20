unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btTemperatura: TButton;
    btFechar: TButton;
    Data: TLabel;
    imClima: TImage;
    lbPercent: TLabel;
    lbUmidade: TLabel;
    lbC: TLabel;
    lbTemperatura: TLabel;
    lbDia: TLabel;
    lbData: TLabel;
    lbPelotas: TLabel;
    lbCidade: TLabel;
    procedure btFecharClick(Sender: TObject);
    procedure btTemperaturaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btFecharClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.btTemperaturaClick(Sender: TObject);
var
  Temp : real;
  Umid : real;
begin
  Temp:= Random(39) + Random - Random(11);
  Umid := 59 + Random(40) + Random;
  lbPercent.Caption:= FormatFloat('0.0', Umid) + '%';
  lbTemperatura.Caption:= FormatFloat('0.0', Temp);
  if (Temp<=0.0)then
  begin
      imClima.Picture.LoadFromFile('Figuras\neve.png');
  end;

  if ((0.0>Temp) and (Temp<20.0))then
      begin
      if ((90.0 <= Umid) And (Umid >100.0))then
      begin
      imClima.Picture.LoadFromFile('Figuras\chuva.png');
      end;
      if ((60.0 <= Umid) and (Umid >90.0))then
      begin
      imClima.Picture.LoadFromFile('Figuras\sol_nuvem.png');
      end;
  end;
        if ((20.0 <= Temp) and (Temp>=40.0))then
  begin
      imClima.Picture.LoadFromFile('Figuras\sol_forte.png');
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
Data.Caption:= DateToStr(Date);
case DayOfWeek(Date) of
1: begin
    lbDia.Caption:= 'Domingo';
end;
2: begin
    lbDia.Caption:= 'Segunda-feira';
end;
3: begin
    lbDia.Caption:= 'Terça-feira';
end;
4: begin
    lbDia.Caption:= 'Quarta-feira';
end;
5: begin
    lbDia.Caption:= 'Quinta-feira';
end;
6: begin
    lbDia.Caption:= 'Sexta-feira';
end;
7: begin
    lbDia.Caption:='Sabado';
end;
end;
end;
end.

