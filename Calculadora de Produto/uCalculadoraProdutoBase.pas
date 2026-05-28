unit uCalculadoraProdutoBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrCalculoProduto = class(TForm)
    gbDadosProdutos: TGroupBox;
    lbCodigoProduto: TLabel;
    ldDescricao: TLabel;
    lbQuantidade: TLabel;
    lbValorUnitario: TLabel;
    edCodigoProduto: TEdit;
    edDescricao: TEdit;
    edQuantidade: TEdit;
    edValorUnitario: TEdit;
    ckTributado: TCheckBox;
    lbAliquota: TLabel;
    edAliquota: TEdit;
    gbTotais: TGroupBox;
    lbValorTotal: TLabel;
    lbValorICMS: TLabel;
    edValorTotal: TEdit;
    edValorICMS: TEdit;
    btCalcular: TButton;
    btLimpar: TButton;
    btFechar: TButton;
    procedure btCalcularClick(Sender: TObject);
    procedure ckTributadoClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
  private
    wCodProd: String;
    wDesc: String;
    wQuant: Currency;
    wVlrUni: Currency;
    wIsTributado: Boolean;
    wAliquota: Currency;
    wVlrTotal: Currency;
    wVlrICMS: Currency;
  public
    { Public declarations }
  end;

var
  frCalculoProduto: TfrCalculoProduto;

implementation

{$R *.dfm}

procedure TfrCalculoProduto.btCalcularClick(Sender: TObject);

begin
  if (edDescricao.Text = '')     or
     (edQuantidade.Text = '')    or
     (edValorUnitario.Text = '') then
       begin
          ShowMessage('Existe campos vazios, adicione valor para calculo');
          Exit;
       end;

  wCodProd     := edCodigoProduto.Text;
  wDesc        := edDescricao.Text;
  wQuant       := StrToCurrDef(edQuantidade.Text, 1);
  wVlrUni      := StrToCurr(edValorUnitario.Text);
  wIsTributado := ckTributado.Checked;
  // Regra de Calculo ICMS
  // ICMS = Valor da mercadoria × (Alíquota ÷ 100).
  if wIsTributado = true then
    begin
      wAliquota          := StrToCurr(edAliquota.Text);
      wVlrICMS           := (wVlrUni * wAliquota) / 100;
      edValorTotal.Text  := CurrToStr(wVlrUni);
      edValorICMS.Text   :=  CurrToStr(wVlrICMS)
    end
  else
    edValorTotal.Text := CurrToStr(wVlrUni * wQuant)
  ;

end;

procedure TfrCalculoProduto.ckTributadoClick(Sender: TObject);
begin
   if edAliquota.Enabled = False then
    begin
      edAliquota.Enabled := True
    end
   else
    begin
      edAliquota.Enabled := False;
    end;
end;

procedure TfrCalculoProduto.btLimparClick(Sender: TObject);
begin
  edCodigoProduto.Text := '';
  edDescricao.Text     := '';
  edQuantidade.Text    := '';
  edValorUnitario.Text := '';
  edAliquota.Text      := '';
  edValorTotal.Text    := '';
  edValorICMS.Text     := '';
  ckTributado.Checked  := False;
end;

procedure TfrCalculoProduto.btFecharClick(Sender: TObject);
begin
    Close;
end;

end.


