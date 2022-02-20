unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btCalcula: TButton;
    btLimpar: TButton;
    btSair: TButton;
    btVerifica: TButton;
    cbCor: TCheckBox;
    edComprimento: TEdit;
    edArea: TEdit;
    edResistividade: TEdit;
    lbVerifica: TLabel;
    lbsimb3: TLabel;
    lbsimb2: TLabel;
    lbsimb1: TLabel;
    lbTiltle: TLabel;
    lbResult: TLabel;
    lbResultado: TLabel;
    lbResistividade: TLabel;
    lbcomprimento: TLabel;
    lbArea: TLabel;
    RadioGroup1: TRadioGroup;
    procedure btCalculaClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btVerificaClick(Sender: TObject);
    procedure cbCorChange(Sender: TObject);
    procedure lbsimb1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure tbVerificaChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  resultado : Real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.lbsimb1Click(Sender: TObject);
begin

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
     Case RadioGroup1.ItemIndex Of
          0 : begin
                                btVerifica.Enabled:=true;
                                lbResistividade.Caption:='Resistividade:';
                                lbcomprimento.Caption:='Comprimento:';
                                lbArea.Caption:='Área:';
                                lbsimb1.Caption:='Ωm';
                                lbsimb2.Caption:='m';
                                lbsimb3.Caption:='m²';
                                lbVerifica.caption:='';
              end;
          1 : begin
                                btVerifica.Enabled:=false;
                                lbResistividade.Caption:='Resistividade:';
                                lbcomprimento.Caption:='Resistência:';
                                lbArea.Caption:='Área:';
                                lbsimb1.Caption:= 'Ωm';
                                lbsimb2.Caption:='Ω';
                                lbsimb3.Caption:='m²';
                                lbVerifica.caption:='';
                             end;
          2 : begin
                                btVerifica.Enabled:=false;
                                lbResistividade.Caption:='Resistividade:';
                                lbcomprimento.Caption:='Resistência:';
                                lbArea.Caption:='Comprimento:';
                                lbsimb1.Caption:='Ωm';
                                lbsimb2.Caption:='Ω';
                                lbsimb3.Caption:='m';
                                lbVerifica.caption:='';
                             end;
   End;
end;

procedure TForm1.tbVerificaChange(Sender: TObject);
begin

end;

procedure TForm1.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btVerificaClick(Sender: TObject);
begin
if ((resultado > 0) and (resultado <= 1000)) then
                       begin
                          lbVerifica.Caption:= 'Resistência baixa';
                       end;
if ((resultado > 1000) and (resultado <1000000)) then
                       begin
                          lbVerifica.Caption:= 'Resistência media';
                       end;
if(resultado>=1000000) then
                       begin
                          lbVerifica.Caption:='Resistência Alta';
                       end;
end;

procedure TForm1.btLimparClick(Sender: TObject);
begin
  edResistividade.Clear;
  edComprimento.Clear;
  edArea.Clear;
  lbResult.Caption := '______________________';
  edResistividade.SetFocus;
  lbVerifica.caption:='';
end;

procedure TForm1.btCalculaClick(Sender: TObject);
var
   Ed1 : Real;
   Ed2 : Real;
   Ed3 : Real;
begin
try
  Ed1:= StrToFloat (edResistividade.text);
  Ed2:= StrToFloat (edComprimento.text);
  Ed3:= StrToFloat (edArea.text);
  Case RadioGroup1.ItemIndex Of
          0 : begin
            resultado:=((Ed1*Ed2)/Ed3);
            lbResult.Caption := 'Resistência de ' + FloatToStr(Resultado) + 'Ω.';
              end;
          1 : begin
            resultado:=((Ed2*Ed3)/Ed1);
            lbResult.Caption := 'Comprimento de ' + FloatToStr(Resultado) + 'm.';
              end;
          2 : begin
            resultado:=((Ed1*Ed2)/Ed3);
            lbResult.Caption := 'Resistividade de ' + FloatToStr(Resultado) + 'Ωm.';
              end;

end;
except
ShowMessage('Erro, verifique os valores digitados!!!');
end;
end;

procedure TForm1.cbCorChange(Sender: TObject);
begin
    if(cbCor.Checked) then
                           begin
                              lbTiltle.Font.Color:= clWhite;
                           end
  else
                             begin
                                lbTiltle.Font.Color:= clBlack;
                             end;
end;

end.

