{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
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
    btDemostrarValorPorTipo: TButton;
    cdsMarcas: TClientDataSet;
    dsMarcas: TDataSource;
    btCadastrarMarca: TButton;
    plCadastrarMarcas: TPanel;
    DBGrid1: TDBGrid;
    lbCodigo: TLabel;
    lbNomeMarca: TLabel;
    edCodMarca: TEdit;
    edNomeMarca: TEdit;
    btCadastarMarca: TButton;
    cdsMarcasbdCOD: TIntegerField;
    cdsMarcasbdNOMEMARCA: TStringField;
    btFecharPanel: TButton;
    procedure btSalvarClick(Sender: TObject);
    procedure edCodChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btDemostrarValorPorTipoClick(Sender: TObject);
    procedure rgTipoClienteClick(Sender: TObject);
    procedure edHrSaidaChange(Sender: TObject);
    procedure btCadastrarMarcaClick(Sender: TObject);
    procedure btCadastarMarcaClick(Sender: TObject);
    procedure edCodMarcaChange(Sender: TObject);
    procedure edMarcaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btFecharPanelClick(Sender: TObject);
  private
    wValorDiaria: Currency;
    wValorMensal: Currency;
    function fVerificarCampos:Boolean;
    function fCalcularValorTotalAPagar(wEntrada:Currency; wSaida:Currency):Currency;
    function fVerificarCamposPanel:Boolean;

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
  if not fVerificarCampos then Exit;
  cdsClientes.IndexFieldNames := 'bdCod';
  if cdsClientes.FindKey([StrToInt(edCod.Text)]) then
    begin
      cdsClientes.Edit;
        cdsClientesbdPlaca.AsString := edPlaca.Text;
        cdsClientesbdMarca.AsString := edMarca.Text;
        cdsClientesbdTipoCliente.AsInteger := rgTipoCliente.ItemIndex;
        cdsClientesbdHrEntrada.AsCurrency  := StrToCurr(edHrEntrada.Text);
        cdsClientesbdTipoPagamento.AsInteger := cbTipoPagamento.ItemIndex;
        cdsClientesbdValorTotal.AsCurrency := StrToCurr(edValor.Text);
        cdsClientesbdHrSaida.AsCurrency := StrToCurr(edHrSaida.Text);
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
        cdsClientesbdHrSaida.AsCurrency := StrToCurr(edHrSaida.Text);
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
      ShowMessage('É necessário preencher o campo "Marca"!');
      edMarca.SetFocus;
      Result := False;
      Exit;
    end
   else if (edHrEntrada.Text = '') then
    begin
      ShowMessage('É necessário preencher o campo "Hora Entrada"!');
      edHrEntrada.SetFocus;
      Result := False;
      Exit;
    end
   else if (cbTipoPagamento.ItemIndex = -1) then
    begin
      ShowMessage('É necessário selecionar o "Tipo Pagamento"!');
      cbTipoPagamento.SetFocus;
      Result := False;
      Exit;
    end;
end;

procedure TfrEstacionamento.edCodChange(Sender: TObject);
begin
  cdsClientes.IndexFieldNames := 'bdCod';
  if (edCod.Text <> '') and cdsClientes.FindKey([StrToIntDef(edCod.Text, 0)]) then
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
    end
  else
    begin
        edPlaca.Enabled := True;
        edMarca.Enabled := True;
        rgTipoCliente.Enabled := True;
        edHrEntrada.Enabled := True;
        cbTipoPagamento.Enabled := True;
        edHrSaida.Enabled := True;
        edHrSaida.Color := cl3DLight;
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

  edPlaca.Enabled := True;
  edMarca.Enabled := True;
  rgTipoCliente.Enabled := True;
  edHrEntrada.Enabled := True;
  cbTipoPagamento.Enabled := True;
  edHrSaida.Enabled := False;
  edHrSaida.Color := cl3DLight;
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
  { Pegue apenas o número antes da vírgula (as horas) e multiplique por 60.

    Pegue o número depois da vírgula (os minutos) e o considere como um número inteiro.

    Some os dois resultados. Agora você tem o valor exato de minutos de cada variável.
(   Exemplo do 9,50: 9 x 60 = 540. Somado aos 50 da casa decimal = 590 minutos totais).}

  // Desmembrar e converter os dois tempos para Minutos Totais
  wMinutosEntrada := (Trunc(wEntrada) * 60) + Round(Frac(wEntrada) * 100);
  wMinutosSaida := (Trunc(wSaida) * 60) + Round(Frac(wSaida) * 100);

  // Encontrar a diferenca exata
  wDiferencaMinutos := wMinutosSaida - wMinutosEntrada;
  if wDiferencaMinutos < 0 then
    wDiferencaMinutos := wDiferencaMinutos + (24 * 60);

  // Converter de volta para a sua simulacao (com virgula)
  wHoras := wDiferencaMinutos div 60;
  wMinutos := wDiferencaMinutos mod 60;
  wTempoDoEstacionamento := wHoras + (wMinutos / 100);


  Result := StrToCurr(edValor.Text) * wTempoDoEstacionamento;
end;


procedure TfrEstacionamento.btDemostrarValorPorTipoClick(Sender: TObject);
var
  wCount: Integer;
  wMessagem: String;
  wValorApagarPTipo: Currency;
begin
  cdsClientes.IndexFieldNames := 'bdCod';
  if (edCod.Text <> '') and cdsClientes.FindKey([StrToIntDef(edCod.Text, 0)]) and (edHrSaida.Text <> '') then //Se o cliente e o valor hora saida está preenchido
    begin
      rgTipoCliente.Enabled := True;
      for wCount := 0 to rgTipoCliente.Items.Count - 1 do
        begin
          rgTipoCliente.ItemIndex := wCount;
          wValorApagarPTipo := fCalcularValorTotalAPagar(cdsClientesbdHrEntrada.AsCurrency, StrToCurr(edHrSaida.Text));
          wMessagem := wMessagem + ('Diaria vai ser ' + rgTipoCliente.Items[wCount] + ': ' + sLineBreak + CurrToStr(wValorApagarPTipo) + sLineBreak);
        end;
      ShowMessage(Trim(wMessagem));
    end
  else
    begin
      ShowMessage('Precisa preencher a hora da saída!');
    end;
end;

procedure TfrEstacionamento.rgTipoClienteClick(Sender: TObject);
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

procedure TfrEstacionamento.edHrSaidaChange(Sender: TObject);
var
  wEntrada, wSaida: Currency;
begin
  if TryStrToCurr(edHrEntrada.Text, wEntrada) and TryStrToCurr(edHrSaida.Text, wSaida) then
    begin
      edValor.Text := CurrToStr(fCalcularValorTotalAPagar(wEntrada, wSaida));
    end
  else
    begin
      if rgTipoCliente.ItemIndex = 0 then
        edValor.Text := CurrToStr(wValorDiaria)
      else
        edValor.Text := CurrToStr(wValorMensal);
    end;
end;

procedure TfrEstacionamento.btCadastrarMarcaClick(Sender: TObject);
begin
  plCadastrarMarcas.Left := 60;
end;

procedure TfrEstacionamento.btCadastarMarcaClick(Sender: TObject);
begin
      if not fVerificarCamposPanel then Exit;
      cdsMarcas.IndexFieldNames := 'bdCOD';
      if cdsMarcas.FindKey([StrToInt(edCodMarca.Text)]) then
          begin
            cdsMarcas.Edit;
              cdsMarcasbdNOMEMARCA.AsString := edNomeMarca.Text;
            cdsMarcas.Post;
          end
        else
          begin
            cdsMarcas.Insert;
              cdsMarcasbdCOD.AsInteger := StrToInt(edCodMarca.Text);
              cdsMarcasbdNOMEMARCA.AsString := edNomeMarca.Text;
            cdsMarcas.Post;
          end;
          edCodMarca.Text := '';
          edNomeMarca.Text := '';
          plCadastrarMarcas.Left := 552;
end;

function TfrEstacionamento.fVerificarCamposPanel: Boolean;
begin
  Result := True;
  if (edCodMarca.Text = '') then
    begin
      ShowMessage('É necessário preencher o campo "Código da Marca"!');
      edCodMarca.SetFocus;
      Result := False;
      Exit;
    end
   else if (edNomeMarca.Text = '') then
    begin
      ShowMessage('É necessário preencher o campo "Nome da Marca"!');
      edNomeMarca.SetFocus;
      Result := False;
      Exit;
    end
end;

procedure TfrEstacionamento.edCodMarcaChange(Sender: TObject);
begin
  if edCodMarca.Text <> '' then
    begin
      cdsMarcas.IndexFieldNames := 'bdCOD';
      if cdsMarcas.FindKey([StrToIntDef(edCodMarca.Text, 0)]) then
        begin
          edNomeMarca.Text := cdsMarcasbdNOMEMARCA.AsString;
        end;
    end;
end;

procedure TfrEstacionamento.edMarcaChange(Sender: TObject);
var
  wCodMarca: Integer;
begin
  if TryStrToInt(edMarca.Text, wCodMarca) then
    begin
      cdsMarcas.IndexFieldNames := 'bdCOD';
      if cdsMarcas.FindKey([wCodMarca]) then
        begin
          edMarca.OnChange := nil;
          try
            edMarca.Text := cdsMarcasbdNOMEMARCA.AsString;
          finally
            edMarca.OnChange := edMarcaChange;
          end;
        end;
    end;
end;

procedure TfrEstacionamento.DBGrid1DblClick(Sender: TObject);
begin
  if not cdsMarcas.IsEmpty then
    begin
      edMarca.Text := cdsMarcasbdNOMEMARCA.AsString;
      plCadastrarMarcas.Left := 552;
    end;
end;

procedure TfrEstacionamento.btFecharPanelClick(Sender: TObject);
begin
  plCadastrarMarcas.Left := 552;
end;

end.
