unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btInicializar: TButton;
    btLeitura: TButton;
    btSair: TButton;
    edCliente: TEdit;
    edValor: TEdit;
    lbCliente: TLabel;
    lbKWH: TLabel;
    lbMedidor: TLabel;
    lbkwhmedidor: TLabel;
    Label5: TLabel;
    Tabela: TMemo;
    rgCliente: TRadioGroup;
    Timer1: TTimer;
    procedure btInicializarClick(Sender: TObject);
    procedure btLeituraClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  myStringList: TStringList;
  MedAtual : Real;
  MedAnterior : Real;
  contador : Integer = 0;
  mes : Integer=1;
  meses : string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.btLeituraClick(Sender: TObject);
begin
  case mes OF
     1: meses := 'Janeiro';
     2: meses := 'Feveiro';
     3: meses := 'Março';
     4: meses := 'Abril';
     5: meses := 'Maio';
     6: meses := 'Junho';
     7: meses := 'Julho';
     8: meses := 'Agosto';
     9: meses := 'Setembro';
     10: meses := 'Outubro';
     11: meses := 'Novembro';
     12: meses := 'Dezembro';
  end;
  mes:= mes+1;
  if(mes>12)then
  mes:=1;
  MedAnterior:=MedAtual;
  MedAtual:= StrToFloat(lbkwhmedidor.Caption);
  myStringList:=TStringList.Create;
  myStringList.Add('Cliente:'+ '     ' +edCliente.text);
  myStringList.Add('.....................................................................................');
  myStringList.Add('Tipo de cliente:' + '     ' + rgCliente.Items[rgCliente.ItemIndex] );
  myStringList.Add('.....................................................................................');
  myStringList.Add('Medição anterior:' + '     ' + floatToStr(MedAnterior));
  myStringList.Add('.....................................................................................');
  myStringList.Add('Valor consumido:' + '     ' + floatToStr(MedAtual-MedAnterior));
  myStringList.Add('.....................................................................................');
  myStringList.Add('Mês:' +  '     ' + meses);
  myStringList.Add('.....................................................................................');
if(rgCliente.ItemIndex = 0) then
  myStringList.Add('Valor a pagar:' + '     ' + floatToStr(MedAtual*strtofloat(edValor.Caption)))
else
  myStringList.Add('Valor a pagar:' + '     ' + floatToStr(1.2*(MedAtual*strtofloat(edValor.Caption))));
  myStringList.Add('.....................................................................................');
  Tabela.Lines.Assign(myStringList);
  myStringList.Free;

end;

procedure TForm1.btInicializarClick(Sender: TObject);
begin
    edCliente.Clear;
    edValor.Clear;
    contador:=0; //lbkwhmedidor.Caption:= '0';
    Timer1.Enabled:=true;

end;

procedure TForm1.FormActivate(Sender: TObject);

begin
  myStringList:=TStringList.Create;
  myStringList.Add('Cliente:');
  myStringList.Add('.....................................................................................');
  myStringList.Add('Tipo de cliente:');
  myStringList.Add('.....................................................................................');
  myStringList.Add('Medição anterior:');
  myStringList.Add('.....................................................................................');
  myStringList.Add('Valor consumido:');
  myStringList.Add('.....................................................................................');
  myStringList.Add('Mês:');
  myStringList.Add('.....................................................................................');
  myStringList.Add('Valor a pagar:');
  myStringList.Add('.....................................................................................');
  Tabela.Lines.Assign(myStringList);
  myStringList.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    lbkwhmedidor.Caption:= intToStr(contador);
    contador:=contador+1;
end;

end.

