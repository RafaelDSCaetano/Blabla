unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btIniciar: TButton;
    btDesligar: TButton;
    btSair: TButton;
    EdResist: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    simb: TLabel;
    lbCorte: TLabel;
    lbResist: TLabel;
    lbResistSimb: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Tittle: TLabel;
    procedure btDesligarClick(Sender: TObject);
    procedure btIniciarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure EdResistEnter(Sender: TObject);
    procedure EdResistKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure RadioGroup1SelectionChanged(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Resist: Real;
  Resistcorte: Real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btSairClick(Sender: TObject);
begin
  Timer3.Enabled:=true;
end;

procedure TForm1.EdResistEnter(Sender: TObject);
begin

end;

procedure TForm1.EdResistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
  begin
  Resistcorte:= StrToFloat(EdResist.Text);
  end;
end;

procedure TForm1.RadioGroup1SelectionChanged(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0: Timer2.Interval:=1000;
  1: Timer2.Interval:=5000;
  2: Timer2.Interval:=10000;
  end;
end;

procedure TForm1.btIniciarClick(Sender: TObject);
begin
  timer1.Enabled:=true;
  timer2.Enabled:=true;
  btIniciar.Enabled:=false;
  btDesligar.Enabled:=true;
end;

procedure TForm1.btDesligarClick(Sender: TObject);
begin
     timer1.Enabled:=False;
     timer2.Enabled:=False;
     EdResist.Caption:='0';
     RadioGroup1.ItemIndex:=0;
      btIniciar.Enabled:=true;
     btDesligar.Enabled:=false;
     EdResist.SetFocus;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    Randomize;
    Resist:= random (1000001);
    lbResist.Caption:=FloatToStr(Resist);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin

  if (Resist>=Resistcorte)then
  Image1.Picture.LoadFromFile('figuras/lampada_l.png')
  else Image1.Picture.LoadFromFile('figuras/lampada_d.png');
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  Close;
end;

end.

