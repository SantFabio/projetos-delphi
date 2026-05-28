unit uCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    lbPeso: TLabel;
    Label1: TLabel;
    edPeso: TEdit;
    edAltura: TEdit;
    btCalcular: TButton;
    lbValorTotal: TLabel;
    edValorTotal: TEdit;
    Label2: TLabel;
    lbResultado: TLabel;
    procedure btCalcularClick(Sender: TObject);
  private
    wPeso: Currency;
    wAltura: Currency;
    wValorTotal: Currency;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btCalcularClick(Sender: TObject);
begin
   if edPeso.Text = '' then
    ShowMessage('Adcione seu peso!')
   else if edPeso.Text = '0' then
    ShowMessage('O peso não pode ser zero!')
   else if edAltura.Text = '' then
    ShowMessage('Adcione sua altura!')
   else if edAltura.Text = '0' then
    ShowMessage('Sua altura não pode ser zero!');


   wPeso:= StrToCurr(edPeso.Text);
   wAltura:= StrToCurr(edAltura.Text);
   wValorTotal := wPeso / (wAltura*wAltura);
   edValorTotal.Text:= CurrToStr(wValorTotal);

   if wValorTotal < 18.5 then

   else if wValorTotal < 18.5 then

   else if wValorTotal < 25 then

   else if wValorTotal < 25 then

   else if wValorTotal < 25 then

   else if wValorTotal < 25 then

   else if wValorTotal < 25 then
                                 ;
end;

end.
