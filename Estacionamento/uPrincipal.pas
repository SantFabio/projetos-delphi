unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrEstacionamento = class(TForm)
    lbCod: TLabel;
    edCod: TEdit;
    lbPlaca: TLabel;
    edPlaca: TEdit;
    lbMarca: TLabel;
    edMarca: TEdit;
    rgTipoCliente: TRadioGroup;
    lbHoraEntrada: TLabel;
    edHrEntrada: TEdit;
    lbHrSaida: TLabel;
    edHrSaida: TEdit;
    cbTipoPagamento: TComboBox;
    lbTipoPagamento: TLabel;
    edValor: TEdit;
    lbValor: TLabel;
    btSalvar: TButton;
    btDemPagamento: TButton;
    btDemTipoPagamento: TButton;
    btDemValorTotal: TButton;
    grClientes: TDBGrid;
    DataSource1: TDataSource;
    cdsClientes: TClientDataSet;
    cdsClientesbdCod: TIntegerField;
    cdsClientesbdPlaca: TStringField;
    cdsClientesbdMarca: TStringField;
    cdsClientesbdTipoCliente: TIntegerField;
    cdsClientesbdHrEntrada: TCurrencyField;
    cdsClientesbdHrSaida: TCurrencyField;
    cdsClientesbdTipoPagamento: TIntegerField;
    cdsClientesbdValorTotal: TCurrencyField;
    cdsClientesbdValorAPagar: TCurrencyField;
    procedure btSalvarClick(Sender: TObject);
    procedure edCodChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoClienteExit(Sender: TObject);
  private
    wValorDiaria: Currency;
    wValorMensal: Currency;
    function fVerificarCampos:Boolean;
    function fCalcularValorTotalAPagar(wEntrada:Currency; wSaida:Currency):Currency;

    procedure pLimparCampos;
  public
    { Public declarations }
  end;

var
  frEstacionamento: TfrEstacionamento;

implementation

{$R *.dfm}

procedure TfrEstacionamento.btSalvarClick(Sender: TObject);
begin
  cdsClientes.IndexFieldNames := 'bdCod';
  if cdsClientes.FindKey([edCod.Text]) then
    begin
      cdsClientes.Edit;
      cdsClientesbdHrSaida.AsCurrency := StrToCurr(edHrSaida.Text);
      cdsClientesbdValorAPagar.AsCurrency := fCalcularValorTotalAPagar(cdsClientesbdHrEntrada.AsCurrency, cdsClientesbdHrSaida.AsCurrency);
      cdsClientes.Post;
      pLimparCampos;
    end
  else
    begin
      cdsClientes.Insert;
        cdsClientesbdCod.AsInteger  := StrToInt(edCod.Text);
        cdsClientesbdPlaca.AsString := edPlaca.Text;
        cdsClientesbdMarca.AsString := edMarca.Text;
        cdsClientesbdTipoCliente.AsInteger := rgTipoCliente.ItemIndex;
        cdsClientesbdHrEntrada.AsCurrency  := StrToCurr(edHrEntrada.Text);
        cdsClientesbdTipoPagamento.AsInteger := cbTipoPagamento.ItemIndex;
        cdsClientesbdValorTotal.AsCurrency := StrToCurr(edValor.Text);
      cdsClientes.Post;
      pLimparCampos;
    end;
end;

function TfrEstacionamento.fVerificarCampos: Boolean;
begin
  Result := True;
  if (edCod.Text = '') then
    begin
      ShowMessage('É necessário preencher o campo "Código"!');
      edCod.SetFocus;
      Result := False;
      Exit;
    end
   else if (edPlaca.Text = '') then
    begin
      ShowMessage('É necessário preencher o campo "Placa"!');
      edPlaca.SetFocus;
      Result := False;
      Exit;
    end
   else if (edMarca.Text = '') then
    begin
      ShowMessage('É necessário preencher o campo "Placa"!');
      edMarca.SetFocus;
      Result := False;
      Exit;
    end
   else if (edHrEntrada.Text = '') then
    begin
      ShowMessage('É necessário preencher o campo "Placa"!');
      edHrEntrada.SetFocus;
      Result := False;
      Exit;
    end
   else if (cbTipoPagamento.ItemIndex = -1) then
    begin
      ShowMessage('É necessário preencher o campo "Placa"!');
      edPlaca.SetFocus;
      Result := False;
      Exit;
    end;
end;

procedure TfrEstacionamento.edCodChange(Sender: TObject);
begin
  cdsClientes.IndexFieldNames := 'bdCod';
  if cdsClientes.FindKey([edCod.Text]) then
    begin
        edPlaca.Text := cdsClientesbdPlaca.AsString;
        edMarca.Text := cdsClientesbdMarca.AsString;
        rgTipoCliente.ItemIndex := cdsClientesbdTipoCliente.AsInteger;
        edHrEntrada.Text := CurrToStr(cdsClientesbdHrEntrada.AsCurrency);
        cbTipoPagamento.ItemIndex := cdsClientesbdTipoPagamento.AsInteger;
        edValor.Text := CurrToStr(cdsClientesbdValorTotal.AsCurrency);

        edPlaca.Enabled := False;
        edMarca.Enabled := False;
        rgTipoCliente.Enabled := False;
        edHrEntrada.Enabled := False;
        cbTipoPagamento.Enabled := False;
        edHrSaida.Enabled := True;
        edHrSaida.Color := clWhite;
    end;
end;

procedure TfrEstacionamento.FormCreate(Sender: TObject);
begin
  wValorDiaria := 10;
  wValorMensal := 5;
    if rgTipoCliente.ItemIndex = 0 then
    begin
      edValor.Text := IntToStr(10);
    end
  else
    begin
      edValor.Text := IntToStr(5);
    end;
end;

procedure TfrEstacionamento.rgTipoClienteExit(Sender: TObject);
begin
  if rgTipoCliente.ItemIndex = 0 then
    begin
      edValor.Text := IntToStr(10);
    end
  else
    begin
      edValor.Text := IntToStr(5);
    end;
end;

procedure TfrEstacionamento.pLimparCampos;
begin
  edCod.Clear;
  edPlaca.Clear;
  edMarca.Clear;
  rgTipoCliente.ItemIndex := 0;
  edHrEntrada.Clear;
  cbTipoPagamento.ItemIndex := -1;
  edValor.Text := '5';
  edHrSaida.Clear;
end;

function TfrEstacionamento.fCalcularValorTotalAPagar(wEntrada:Currency; wSaida:Currency): Currency;
var
  wMinutosEntrada: Integer;
  wMinutosSaida: Integer;
  wDiferencaMinutos: Integer;
  wHoras: Integer;
  wMinutos: Integer;
  wTempoDoEstacionamento: Currency;
begin
  // 1. Desmembrar e converter os dois tempos para Minutos Totais
  wMinutosEntrada := (Trunc(wEntrada) * 60) + Round(Frac(wEntrada) * 100);
  wMinutosSaida := (Trunc(wSaida) * 60) + Round(Frac(wSaida) * 100);

  // 2. Encontrar a diferenca exata
  wDiferencaMinutos := wMinutosSaida - wMinutosEntrada;
  if wDiferencaMinutos < 0 then
    wDiferencaMinutos := wDiferencaMinutos + (24 * 60);

  // 3. Converter de volta para a sua simulacao (com virgula)
  wHoras := wDiferencaMinutos div 60;
  wMinutos := wDiferencaMinutos mod 60;
  wTempoDoEstacionamento := wHoras + (wMinutos / 100);

  // 4. Calcular valor total a pagar
  Result := StrToCurr(edValor.Text) * wTempoDoEstacionamento;
end;


end.