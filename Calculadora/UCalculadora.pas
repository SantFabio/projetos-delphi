unit UCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrCalculadora = class(TForm)
    lbPriValor: TLabel;
    edValor1: TEdit;
    btSoma: TButton;
    lbSegValor: TLabel;
    edValor2: TEdit;
    lbResultado: TLabel;
    edResultado: TEdit;
    btDiminuir: TButton;
    btMultiplicar: TButton;
    btDividir: TButton;
    procedure btSomaClick(Sender: TObject);
    procedure btDiminuirClick(Sender: TObject);
    procedure btMultiplicarClick(Sender: TObject);
    procedure btDividirClick(Sender: TObject);
  private
    function fSomar:Currency;
    function fDiminuir:Currency;
    function fMultiplicar:Currency;
    function fDividir:Currency;
    procedure pSomar;
    procedure pDiminuir;
    procedure pMultiplicar;
    procedure pDividir;
  public
    { Public declarations }
  end;

var
  FrCalculadora: TFrCalculadora;

implementation

{$R *.dfm}

function TFrCalculadora.fsomar: Currency;
begin
  Result := StrToCurr(edValor1.Text) + StrToCurr(edValor2.Text);
end;

function TFrCalculadora.fDiminuir: Currency;
begin
  Result := StrToCurr(edValor1.Text) - StrToCurr(edValor2.Text);
end;

function TFrCalculadora.fDividir: Currency;
begin
  Result := StrToCurr(edValor1.Text) / StrToCurr(edValor2.Text);
end;

function TFrCalculadora.fMultiplicar: Currency;
begin
   Result := StrToCurr(edValor1.Text) * StrToCurr(edValor2.Text);
end;

procedure TFrCalculadora.pSomar;
begin
  edResultado.Text := CurrToStr(fsomar);
end;

procedure TFrCalculadora.pDiminuir;
begin
  edResultado.Text := CurrToStr(fDiminuir);
end;

procedure TFrCalculadora.pMultiplicar;
begin
  edResultado.Text := CurrToStr(fMultiplicar);
end;

procedure TFrCalculadora.pDividir;
begin
   edResultado.Text := CurrToStr(fDividir);
end;

procedure TFrCalculadora.btSomaClick(Sender: TObject);
begin
  pSomar;
end;

procedure TFrCalculadora.btDiminuirClick(Sender: TObject);
begin
  pDiminuir;
end;

procedure TFrCalculadora.btMultiplicarClick(Sender: TObject);
begin
  pMultiplicar;
end;

procedure TFrCalculadora.btDividirClick(Sender: TObject);
begin
  pDividir;
end;

end.
