unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btRealizarPedido: TButton;
    btLimpar: TButton;
    btSair: TButton;
    cbOvo: TCheckBox;
    cbQueijo: TCheckBox;
    cbSalsicha: TCheckBox;
    cbClienteFidelidade: TCheckBox;
    cgAdicionais: TCheckGroup;
    edValorTotal: TEdit;
    edvalorpagar: TEdit;
    lancheria: TLabel;
    lbValoraPagar: TLabel;
    lbValortotal: TLabel;
    rgLanches: TRadioGroup;
    procedure btLimparClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure cbClienteFidelidadeChange(Sender: TObject);
    procedure cbOvoChange(Sender: TObject);
    procedure cbQueijoChange(Sender: TObject);
    procedure cbSalsichaChange(Sender: TObject);
    procedure edValorTotalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgLanchesClick(Sender: TObject);
    procedure Calcula();
  private

  public

  end;

var
  Form1: TForm1;
  valorpagar: real=0;
  valortotal: real=0;
  adicional1: real=0;
  adicional2: real=0;
  adicional3: real=0;
  valorpagar2: real=0;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.Calcula();
begin
    case rgLanches.ItemIndex of
  0:begin;
    cbSalsicha.Checked:=false;
    cbSalsicha.Enabled:=false;
    valorpagar:= 12;
  end;
  1:begin
    cbSalsicha.Enabled:=true;
    valorpagar:= 5;
  end;
  2:begin
    cbSalsicha.Checked:=false;
    cbSalsicha.Enabled:=false;
    valorpagar:= 8.5;
  end;
  end;
  //ovo
     if(cbOvo.Checked) then
     adicional1:=1.50;
     if( not cbOvo.Checked) then
     adicional1:=0;
  //queijo
     if(cbQueijo.Checked) then
     adicional2:=1.50;
     if( not cbQueijo.Checked) then
     adicional2:=0;
  //salsicha
     if(cbSalsicha.Checked) then
     adicional3:=1.50;
     if( not cbSalsicha.Checked) then
     adicional3:=0;
     //pagamento
  valortotal:=valorpagar+adicional1+adicional2+adicional3;
  valorpagar2:=valortotal*0.9;
  edValorTotal.text := FormatFloat('0.00', valortotal);
  if (cbClienteFidelidade.Checked)then
  edValorpagar.text := FormatFloat('0.00', valorpagar2);
  if (not cbClienteFidelidade.Checked)then
  edValorpagar.text := FormatFloat('0.00', valortotal);




end;

procedure TForm1.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.btLimparClick(Sender: TObject);
begin
     cbClienteFidelidade.checked := false;
     rgLanches.ItemIndex := -1;
     cbOvo.checked := false;
     cbQueijo.checked := false;
     cbSalsicha.checked := false;
     cbSalsicha.enabled := false;
     edvalorpagar.text := '0,00';
     edValorTotal.text := '0,00';
end;

procedure TForm1.cbClienteFidelidadeChange(Sender: TObject);
begin
  Calcula();
end;

procedure TForm1.cbOvoChange(Sender: TObject);
begin
     Calcula();
end;

procedure TForm1.cbQueijoChange(Sender: TObject);
begin

     Calcula();
end;

procedure TForm1.cbSalsichaChange(Sender: TObject);
begin

     Calcula();
end;

procedure TForm1.edValorTotalChange(Sender: TObject);
begin
     Calcula();
end;


procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.rgLanchesClick(Sender: TObject);
begin
  Calcula();
  end;
end.

