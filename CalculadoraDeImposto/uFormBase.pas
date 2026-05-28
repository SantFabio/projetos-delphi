unit uFormBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBClient, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    cbEstados: TComboBox;
    rgMovimento: TRadioGroup;
    lbValorNota: TLabel;
    edValorNota: TEdit;
    lbImposto: TLabel;
    edImposto: TEdit;
    btCalcular: TButton;
    lbValorTotal: TLabel;
    edValorTotal: TEdit;
    cdsCadastroNota: TClientDataSet;
    lbDataEmissao: TLabel;
    edDataEmissao: TEdit;
    lbNumeroNota: TLabel;
    edNumeroNota: TEdit;
    cdsCadastroNotabdNUMERONOTA: TIntegerField;
    cdsCadastroNotabdDATAEMISSAO: TStringField;
    cdsCadastroNotabdESTADO: TIntegerField;
    cdsCadastroNotabdMOVIMENTACAO: TIntegerField;
    cdsCadastroNotabdVALORNOTA: TCurrencyField;
    cdsCadastroNotabdIMPOSTO: TCurrencyField;
    cdsCadastroNotabdVALORTOTAL: TCurrencyField;
    btSalvar: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    lbValorTotalNota: TLabel;
    edValorTotalNota: TEdit;
    btCalcularTotalNota: TButton;
    procedure btCalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbEstadosChange(Sender: TObject);
    procedure rgMovimentoClick(Sender: TObject);
    procedure edValorNotaChange(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edNumeroNotaExit(Sender: TObject);
    procedure btCalcularTotalNotaClick(Sender: TObject);
  private
    wValorNota: Currency;
    wValorImposto: Currency;
    wValorTotal: Currency;
    wValorTotalNota: Currency;
    
    function fCalcularValorTotal:Currency;
    function fValidarCampos:Boolean;
    procedure pCalcularValorImposto;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//PROCEDIMENTOS ************************

procedure TForm1.pCalcularValorImposto;
var
  wEstado: Integer;
  wMovimento: Integer;
begin
  wEstado := cbEstados.ItemIndex;
  wMovimento := rgMovimento.ItemIndex;

  if (wEstado = 0) and (wMovimento = 0) then
    wValorImposto := 5
  else if (wEstado = 0) and (wMovimento = 1) then
    wValorImposto := 7
  else if (wEstado = 1) and (wMovimento = 0) then
    wValorImposto := 7
  else if (wEstado = 1) and (wMovimento = 1) then
    wValorImposto := 10
  else if (wEstado = 2) and (wMovimento = 0) then
    wValorImposto := 7
  else if (wEstado = 2) and (wMovimento = 1) then
      wValorImposto := 10;

  edImposto.Text := CurrToStr(wValorImposto);
end;

//**************************************

// fUNÇÕES *****************************

function TForm1.fValidarCampos: Boolean;
begin
  Result := false;
  if (cbEstados.Enabled = false) Or (rgMovimento.Enabled = false) then
    ShowMessage('Escolha o Estado e a Movimentação!')
  else if wValorNota = -100000 then
    ShowMessage('Adicione um valor')
  else
    Result:= True
  ;
end;

function TForm1.fCalcularValorTotal: Currency;
begin
      pCalcularValorImposto;
      Result:= (wValorNota * wValorImposto) / 100 ;
end;

//**************************************

procedure TForm1.btCalcularClick(Sender: TObject);
begin
  fValidarCampos;
  edValorTotal.Text:= CurrToStr(fCalcularValorTotal);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  wValorImposto:= 5;
  edImposto.Text := CurrToStr(wValorImposto);
end;

procedure TForm1.cbEstadosChange(Sender: TObject);
begin
  rgMovimento.Enabled := True;
  rgMovimento.ItemIndex := -1;
end;

procedure TForm1.rgMovimentoClick(Sender: TObject);
begin
  pCalcularValorImposto;
end;

procedure TForm1.edValorNotaChange(Sender: TObject);
begin
  if fValidarCampos then
    begin
      wValorNota := StrToCurrDef(edValorNota.Text, -100000);
    end
  else
    begin
      ShowMessage('Selecione o Estado e o tipo de Movimentação!');
    end
  ;
  if wValorNota = -100000 then
    ShowMessage('Adicione um valor númerico');
  ;
end;

procedure TForm1.btSalvarClick(Sender: TObject);
begin
  cdsCadastroNota.IndexFieldNames := 'bdNUMERONOTA';
  if not cdsCadastroNota.FindKey([edNumeroNota.Text]) then
      cdsCadastroNota.Insert
  else
    begin
      ShowMessage('O registro já existe!');
      Exit;
    end;

  cdsCadastroNotabdNUMERONOTA.AsInteger := StrToInt(edNumeroNota.Text);
  //cdsCadastroNota.FieldByName('bdNUMERONOTA').AsInteger := StrToInt(edNumeroNota.Text);
  cdsCadastroNotabdDATAEMISSAO.AsString := edDataEmissao.Text;
  cdsCadastroNotabdESTADO.AsInteger := cbEstados.ItemIndex;
  cdsCadastroNotabdMOVIMENTACAO.AsInteger := rgMovimento.ItemIndex;
  cdsCadastroNotabdVALORNOTA.AsCurrency := wValorNota;
  cdsCadastroNotabdIMPOSTO.AsCurrency := wValorImposto;
  cdsCadastroNotabdVALORTOTAL.AsCurrency := wValorTotal;
  cdsCadastroNota.Post;
end;

procedure TForm1.edNumeroNotaExit(Sender: TObject);
begin
  cdsCadastroNota.IndexFieldNames := 'bdNUMERONOTA'; //Define em qual colunar vamos procurar a informação;
  if cdsCadastroNota.FindKey([edNumeroNota.Text]) then
    begin
      edDataEmissao.Text := cdsCadastroNotabdDATAEMISSAO.AsString;
      cbEstados.ItemIndex := cdsCadastroNotabdESTADO.AsInteger;
      rgMovimento.ItemIndex := cdsCadastroNotabdMOVIMENTACAO.AsInteger;
      edValorNota.Text :=  CurrToStr(cdsCadastroNotabdVALORNOTA.AsCurrency);
      edImposto.Text := CurrToStr(cdsCadastroNotabdIMPOSTO.AsCurrency);
      edValorTotal.Text := CurrToStr(cdsCadastroNotabdVALORTOTAL.AsCurrency);
    end
  ;
end;

procedure TForm1.btCalcularTotalNotaClick(Sender: TObject);
var
  wValorImpostoParana,
  wValorImpostoSaoPaulo,
  wValorImpostoSantaCatarina: Currency;
begin
  wValorImpostoParana := 0;
  wValorImpostoSaoPaulo := 0;
  wValorImpostoSantaCatarina := 0;
  cdsCadastroNota.First;
  while not cdsCadastroNota.Eof do
    begin
      
      cdsCadastroNota.Next;
    end;
end;

end.
