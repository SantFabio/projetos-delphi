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
    cdsClientes: TClientDataSet;
    DataSource1: TDataSource;
    cdsClientesbdCod: TIntegerField;
    cdsClientesbdPlaca: TStringField;
    cdsClientesbdMarca: TStringField;
    cdsClientesbdTipoCliente: TIntegerField;
    cdsClientesbdHrEntrada: TCurrencyField;
    cdsClientesbdHrSaida: TCurrencyField;
    cdsClientesbdTipoPagamento: TIntegerField;
    cdsClientesbdValorTotal: TCurrencyField;
    procedure btSalvarClick(Sender: TObject);
    procedure edCodChange(Sender: TObject);
  private
    function fVerificarCampos:Boolean;
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
    end;
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
   else if (cbTipoPagamento = -1) then
    begin
      ShowMessage('É necessário preencher o campo "Placa"!');
      edPlaca.SetFocus;
      Result := False;
      Exit;
    end
end;

procedure TfrEstacionamento.edCodChange(Sender: TObject);
begin
  cdsClientes.IndexFieldNames := 'bdCod';
  if cdsClientes.FindKey([edCod.Text]) then
    begin
        edCod.Text := IntToStr(cdsClientesbdCod.AsInteger);
        edPlaca.Text := cdsClientesbdPlaca.AsString;
        edMarca.Text := cdsClientesbdMarca.AsString;
        rgTipoCliente.ItemIndex = cdsClientesbdTipoCliente.AsInteger;
        edHrEntrada.Text := CurrToStr(cdsClientesbdHrEntrada.AsCurrency);
        cbTipoPagamento.ItemIndex := cdsClientesbdTipoPagamento.AsInteger;
        edValor.Text := CurrToStr(cdsClientesbdValorTotal.AsCurrency);
    end;
end;

end.
