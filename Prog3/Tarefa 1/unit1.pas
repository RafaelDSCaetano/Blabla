unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TTarefa1 }

  TTarefa1 = class(TForm)
    BtInserir: TButton;
    Bt_Verifica: TButton;
    Bt_restaurar: TButton;
    Bt_sair: TButton;
    Ed_Verifica: TEdit;
    Ed_Limite_Inferior: TEdit;
    Ed_Limite_Superior: TEdit;
    Lb_informe_o_valor: TLabel;
    LbLimiteInferior: TLabel;
    LbLimiteSuperior: TLabel;
    procedure BtInserirClick(Sender: TObject);
    procedure Bt_restaurarClick(Sender: TObject);
    procedure Bt_sairClick(Sender: TObject);
    procedure Bt_VerificaClick(Sender: TObject);
  private

  public

  end;

var
  Tarefa1: TTarefa1;
  limiteinferior: integer;
  limitesuperior: integer;

implementation

{$R *.lfm}

{ TTarefa1 }

procedure TTarefa1.Bt_sairClick(Sender: TObject);
begin
  close;
end;

procedure TTarefa1.Bt_VerificaClick(Sender: TObject);
var
  valor : integer;
begin
  try
  Valor := StrToInt(Ed_Verifica.Caption);

  if (Valor > limiteinferior) and (valor < limitesuperior) then
     showmessage('O valor ' + IntToStr(valor) + ' ESTÁ entre ' + IntToStr(limiteinferior) + ' e ' + IntToStr(limitesuperior))
                       else
                           showmessage('O valor ' + IntToStr(valor) + ' NÃO ESTÁ entre ' + IntToStr(limiteinferior) + ' e ' + IntToStr(limitesuperior));
except
  ShowMessage('Digite um valor valido!!!');
  end
  end;

procedure TTarefa1.BtInserirClick(Sender: TObject);
begin
  try

  limiteinferior := StrToInt(Ed_Limite_Inferior.Caption);
  limitesuperior := StrToInt(Ed_Limite_Superior.Caption);
  if(limiteinferior>limitesuperior)then
     begin
       showmessage('O limite inferior deve ser menor que o limite superior!');
     end else
     begin
  LbLimiteSuperior.visible := False;
  LbLimiteInferior.visible := False;
  Ed_Limite_Inferior.visible := False;
  Ed_Limite_Superior.visible := False;
  BtInserir.Visible := False;
  Bt_Verifica.Enabled:= true;
     end;
  except
    ShowMessage('Digite um valor valido!!!');
  end;
end;

procedure TTarefa1.Bt_restaurarClick(Sender: TObject);
begin
  LbLimiteSuperior.visible := True;
  LbLimiteInferior.visible := True;
  Ed_Limite_Inferior.visible := True;
  Ed_Limite_Superior.visible := True;
  BtInserir.Visible := True;
  Bt_Verifica.Enabled:= false;
end;

end.

