unit uFolhaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ExtCtrls, Grids, DBGrids, StdCtrls;

type
  TfrFolhaPagamento = class(TForm)
    gbFuncionario: TGroupBox;
    cbNomeFuncionario: TComboBox;
    lbNome: TLabel;
    lbCargo: TLabel;
    edCargoFuncionario: TEdit;
    btCadastrar: TButton;
    gbProventos: TGroupBox;
    gbDescontos: TGroupBox;
    lbSalarioBase: TLabel;
    lbHorasExtras: TLabel;
    lbOutros: TLabel;
    lbTotalProventos: TLabel;
    edHorasExtras: TEdit;
    edOutros: TEdit;
    edSalarioBase: TEdit;
    edINSS: TEdit;
    edIRRF: TEdit;
    edValeTransp: TEdit;
    edTotaisDescontos: TEdit;
    lbINSS: TLabel;
    lbIRRF: TLabel;
    lbValeTransp: TLabel;
    lbTotalDescontos: TLabel;
    gbResultado: TGroupBox;
    lbTotalPvResultados: TLabel;
    lbSalarioLiquido: TLabel;
    edTotalPVResultado: TEdit;
    edSalarioLiquido: TEdit;
    edTotalDsResultado: TEdit;
    lbTotalDsResultado: TLabel;
    btCalcular: TButton;
    btSalvar: TButton;
    btLimpar: TButton;
    folhaGrid: TDBGrid;
    pnCadastroUsuario: TPanel;
    lbCadastroFucionario: TLabel;
    lbCod: TLabel;
    edCodFuncionario: TEdit;
    lbNomeUserCadastro: TLabel;
    edNomeCadastro: TEdit;
    lbCargoCadastro: TLabel;
    cbCargo: TComboBox;
    lbEndereco: TLabel;
    edEndereco: TEdit;
    lbTelefone: TLabel;
    edTelefone: TEdit;
    btSalvarCadastro: TButton;
    btFechar: TButton;
    cdsFuncionarios: TClientDataSet;
    dsFuncionarios: TDataSource;
    cdsFuncionariosbdCODFUNCIONARIO: TIntegerField;
    cdsFuncionariosbdNOME: TStringField;
    cdsFuncionariosbdCARGO: TStringField;
    cdsFuncionariosbdENDERECO: TStringField;
    cdsFuncionariosbdTELEFONE: TStringField;
    edTotaisProventos: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    cdsFolhaPagamento: TClientDataSet;
    cdsFolhaPagamentobdCODFOLHA: TIntegerField;
    cdsFolhaPagamentobdCODFUNCIONARIO: TIntegerField;
    cdsFolhaPagamentobdCARGO: TStringField;
    cdsFolhaPagamentobdNOMEFUNCIONARIO: TStringField;
    cdsFolhaPagamentobdSALARIOBASE: TCurrencyField;
    cdsFolhaPagamentobdHORASEXTRAS: TCurrencyField;
    cdsFolhaPagamentobdOUTROSVALORES: TCurrencyField;
    cdsFolhaPagamentobdINSS: TCurrencyField;
    cdsFolhaPagamentobdIRRF: TCurrencyField;
    cdsFolhaPagamentobdVALETRANSPORTE: TCurrencyField;
    cdsFolhaPagamentobdTOTALPROVENTOS: TCurrencyField;
    cdsFolhaPagamentobdTOTALDESCONTOS: TCurrencyField;
    cdsFolhaPagamentobdSALARIOLIQUIDO: TCurrencyField;
    dsFolhaPagamento: TDataSource;
    procedure btCadastrarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btSalvarCadastroClick(Sender: TObject);

    procedure cbNomeFuncionarioSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSalarioBaseExit(Sender: TObject);
    procedure edHorasExtrasExit(Sender: TObject);
    procedure edOutrosExit(Sender: TObject);
    procedure edSalarioBaseClick(Sender: TObject);
    procedure edHorasExtrasClick(Sender: TObject);
    procedure edOutrosClick(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure folhaGridCellClick(Column: TColumn);

  private
    { private variable declarations }
    wCodFuncionarioEmFoco:Integer;
    wCodFolhaEmFoco: Integer;
    wCodigoFolha: Integer;

    wValorINSSPorcentagem: Integer;
    wValorIRRFPorcentagem: Integer;
    wValorValeTPorcentagem: Integer;

    wSalarioBase: Currency;
    wValorHorasExtras: Currency;
    wValorOutros: Currency;
    wValorTotalPv: Currency;

    wValorINSS: Currency;
    wValorIRRF: Currency;
    wValorValeT: Currency;
    wValorDescontosTotalRD: Currency;

    wCamposHabilitados: Boolean;

    { function and procedure declarations }
    function fVerificaSeExiste(coluna:String; alvo: String): Boolean;
    function fVerificaCargoEscolhido: String;
    function fEstaCamposPreenchidos: Boolean;
    function fCalcularTotalDescontos: Currency;
    function fCalcularTotalProventos: Currency;
    function fGerarCodigoUnico: Integer;
    procedure pCarregarCargoFuncionario;
    procedure pCarregarFolhaExistente;
    procedure pLimparEditClick(PreEdit: TEdit);
    procedure pLimparCamposCadastroFuncionarios;
    procedure pHabilitarCampos;
    procedure pLimparCampos;
    procedure pVerificarEditVazio(Sender: TEdit);
  public
    { Public declarations }
  end;

var
  frFolhaPagamento: TfrFolhaPagamento;

implementation

uses Math;

{$R *.dfm}

procedure TfrFolhaPagamento.btCadastrarClick(Sender: TObject);
begin
  pnCadastroUsuario.Enabled := True;
  pnCadastroUsuario.Left := 60;
end;

procedure TfrFolhaPagamento.btFecharClick(Sender: TObject);
var
  wCount: Integer;
begin
  pnCadastroUsuario.Left := 640;
  pnCadastroUsuario.Enabled := False;

  // Limpa o ComboBox para não duplicar os itens
  cbNomeFuncionario.Clear;

  // Recarrega os funcionários do banco
  wCount := 0;
  cdsFuncionarios.First;
  while not cdsFuncionarios.Eof do
  begin
    cbNomeFuncionario.Items.InsertObject(wCount, cdsFuncionariosbdNOME.AsString, TObject(cdsFuncionariosbdCODFUNCIONARIO.AsInteger));
    wCount := wCount + 1;
    cdsFuncionarios.Next;
  end;

  // Seleciona o funcionário de volta usando a variável global 'wIdFuncionarioEmFoco'
  cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOfObject(TObject(wCodFuncionarioEmFoco));
  
  if cbNomeFuncionario.ItemIndex <> -1 then
    cbNomeFuncionarioSelect(cbNomeFuncionario) // Restaura e recalcula tudo
  else
    edCargoFuncionario.Clear;

  pLimparCamposCadastroFuncionarios;
end;


procedure TfrFolhaPagamento.btSalvarCadastroClick(Sender: TObject);
begin
  if not fEstaCamposPreenchidos then
    begin
      Exit;
    end;

  if fVerificaSeExiste('bdCODFUNCIONARIO', edCodFuncionario.Text) then
    begin
      ShowMessage('Já existe um funcionario com esse código'
                                            + sLineBreak +
                  'Tente Outro!'
                  );
      edCodFuncionario.Clear;
      edCodFuncionario.SetFocus;
      Exit;
    end;
  cdsFuncionarios.Insert;

  cdsFuncionariosbdCODFUNCIONARIO.AsInteger := StrToInt(edCodFuncionario.Text);
  cdsFuncionariosbdNOME.AsString := edNomeCadastro.Text;
  cdsFuncionariosbdCARGO.AsString := fVerificaCargoEscolhido;
  cdsFuncionariosbdENDERECO.AsString := edEndereco.Text;
  cdsFuncionariosbdTELEFONE.AsString := edTelefone.Text;
  cdsFuncionarios.Post;

  pLimparCamposCadastroFuncionarios;
  cbNomeFuncionario.Enabled := True;
end;

function TfrFolhaPagamento.fEstaCamposPreenchidos:Boolean;
begin
  Result:= True;
  if edCodFuncionario.Text = '' then
    begin
      Result:= False;
      ShowMessage('Preenchar o campo Código para poder Salvar!');
      edCodFuncionario.SetFocus;
      Exit;
    end
  else if (edNomeCadastro.Text = '') then
    begin
      Result:= False;
      ShowMessage('Preenchar o campo Nome para poder Salvar!');
      edNomeCadastro.SetFocus;
      Exit;
    end
  else if (cbCargo.ItemIndex = -1) then
    begin
      Result:= False;
      ShowMessage('Preenchar o campo Cargo para poder Salvar!');
      cbCargo.SetFocus;
      Exit;
    end
  else if (edEndereco.Text = '') then
    begin
      Result:= False;
      ShowMessage('Preenchar o campo "Endereço" para poder Salvar!');
      edEndereco.SetFocus;
      Exit;
    end
  else if (edTelefone.Text = '') then
    begin
      Result:= False;
      ShowMessage('Preenchar o campo Telefone para poder Salvar!');
      edTelefone.SetFocus;
      Exit;
    end;

end;

function TfrFolhaPagamento.fVerificaCargoEscolhido: String;
var
  wCargoEscolhido: Integer;
begin
  wCargoEscolhido := cbCargo.ItemIndex;
  Result := '';
  if (cbCargo.ItemIndex = 0) then
    begin
      Result := cbCargo.Items[wCargoEscolhido];
      Exit;
    end
  else if (cbCargo.ItemIndex = 1) then
    begin
      Result := cbCargo.Items[wCargoEscolhido];
      Exit;
    end
  else if (cbCargo.ItemIndex = 2) then
    begin
      Result := cbCargo.Items[wCargoEscolhido];
      Exit;
    end
  else if (cbCargo.ItemIndex = 3) then
    begin
      Result := cbCargo.Items[wCargoEscolhido];
      Exit;
    end
end;

function TfrFolhaPagamento.fVerificaSeExiste(coluna:String; alvo: String): Boolean;
begin
  cdsFuncionarios.IndexFieldNames := coluna;
  Result := cdsFuncionarios.FindKey([alvo]);
end;

procedure TfrFolhaPagamento.pLimparCamposCadastroFuncionarios;
begin
  edCodFuncionario.Text := '';
  edNomeCadastro.Text   := '';
  cbCargo.ItemIndex     := -1;
  edEndereco.Text       := '';
  edTelefone.Text       := '';
end;



procedure TfrFolhaPagamento.cbNomeFuncionarioSelect(Sender: TObject);
var
  wIndexFuncionario: Integer;
begin
    // Essa função busca o o funcionario em foco e coloca o cargo dele no campo cargo
     wIndexFuncionario := cbNomeFuncionario.ItemIndex;
     if wIndexFuncionario = -1 then Exit;
     //Retira o cod do funcionario do Tobject do combobox, e adicionar em uma variavel
     wCodFuncionarioEmFoco := Integer(cbNomeFuncionario.Items.Objects[wIndexFuncionario]);

     pLimparCampos;
     pCarregarCargoFuncionario;
     pHabilitarCampos;
     pCarregarFolhaExistente;
end;

procedure TfrFolhaPagamento.FormCreate(Sender: TObject);
begin
  edSalarioBase.Text := FormatCurr('#,##0.00',0);
  wValorINSSPorcentagem:= 9;
  wValorIRRFPorcentagem:= 15;
  wValorValeTPorcentagem:= 6;
  wValorINSS:= 0;
  wValorIRRF:= 0;
  wValorValeT:= 0;
  wValorDescontosTotalRD := 0;
  wCamposHabilitados := false;
  wSalarioBase:= 0;
  wValorHorasExtras:= 0;
  wValorOutros:= 0;
  wValorTotalPv:= 0;
  wCodFolhaEmFoco:= 0;
  wCodigoFolha:= 0;
end;

procedure TfrFolhaPagamento.edSalarioBaseExit(Sender: TObject);
begin
  wSalarioBase:= StrToCurrDef(edSalarioBase.Text, 0);
  edSalarioBase.Text := FormatCurr('#,##0.00',wSalarioBase);
  pVerificarEditVazio(Self.edSalarioBase);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edHorasExtrasExit(Sender: TObject);
begin
  wValorHorasExtras:= StrToCurrDef(edHorasExtras.Text, 0);
  edHorasExtras.Text := FormatCurr('#,##0.00',wValorHorasExtras);
  pVerificarEditVazio(Self.edHorasExtras);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edOutrosExit(Sender: TObject);
begin
  wValorOutros := StrToCurrDef(edOutros.Text, 0);
  edOutros.Text := FormatCurr('#,##0.00',wValorOutros);
  pVerificarEditVazio(Self.edOutros);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.pHabilitarCampos;
begin
    wCamposHabilitados:= True;
    //Habilita os campos De Proventos
    if (cbNomeFuncionario.ItemIndex = -1) then
      begin
        wCamposHabilitados:= False;
      end;

     edSalarioBase.Enabled := wCamposHabilitados;
     edHorasExtras.Enabled := wCamposHabilitados;
     edOutros.Enabled := wCamposHabilitados;
end;

procedure TfrFolhaPagamento.edSalarioBaseClick(Sender: TObject);
begin
  pLimparEditClick(Self.edSalarioBase);
end;

procedure TfrFolhaPagamento.pLimparEditClick(PreEdit: TEdit);
begin
  if (PreEdit.Text = '0,00') then
    begin
      PreEdit.Clear;
    end;
end;

procedure TfrFolhaPagamento.edHorasExtrasClick(Sender: TObject);
begin
    pLimparEditClick(Self.edHorasExtras);
end;

procedure TfrFolhaPagamento.edOutrosClick(Sender: TObject);
begin
    pLimparEditClick(Self.edOutros);
end;


function TfrFolhaPagamento.fCalcularTotalProventos;
begin
  wValorTotalPv:= wSalarioBase + wValorHorasExtras + wValorOutros;
  edTotaisProventos.Text := FormatCurr('#,##0.00',wValorTotalPv);
  Result:= wValorTotalPv;
end;

function TfrFolhaPagamento.fCalcularTotalDescontos: Currency;
begin
   wValorINSS := (wValorTotalPv * wValorINSSPorcentagem) / 100;
   edINSS.Text := FormatCurr('#,##0.00',wValorINSS);
   wValorIRRF := (wValorTotalPv * wValorIRRFPorcentagem) / 100;
   edIRRF.Text := FormatCurr('#,##0.00',wValorIRRF);
   wValorValeT := (wSalarioBase * wValorValeTPorcentagem) / 100;
   edValeTransp.Text := FormatCurr('#,##0.00',wValorValeT);
   wValorDescontosTotalRD := wValorINSS + wValorIRRF + wValorValeT;
   edTotaisDescontos.Text := FormatCurr('#,##0.00',wValorDescontosTotalRD);
   Result:= wValorDescontosTotalRD;
end;

procedure TfrFolhaPagamento.btCalcularClick(Sender: TObject);
begin
  if (edSalarioBase.Text <> '0,00') and (edSalarioBase.Text <> '') then
    begin
      edTotalPVResultado.Text := FormatCurr('"R$ "#,##0.00',fCalcularTotalProventos);
      edTotalDsResultado.Text := FormatCurr('"R$ "#,##0.00',fCalcularTotalDescontos);
      edSalarioLiquido.Text := FormatCurr('"R$ "#,##0.00',wValorTotalPv - wValorDescontosTotalRD);
    end;
end;

procedure TfrFolhaPagamento.btSalvarClick(Sender: TObject);
var
 wcod: Integer;
begin

    if wCodFolhaEmFoco > 0 then
      wcod := wCodFolhaEmFoco
    else
      wcod := fGerarCodigoUnico;


    cdsFolhaPagamento.IndexFieldNames := 'bdCODFUNCIONARIO';
    if cdsFolhaPagamento.FindKey([wCodFuncionarioEmFoco]) then
      begin
        cdsFolhaPagamento.Edit;
      end
    else
      begin
        cdsFolhaPagamento.Insert;
        cdsFolhaPagamentobdCODFOLHA.AsInteger := wcod;
      end;
    cdsFolhaPagamentobdCODFUNCIONARIO.AsInteger := cdsFuncionariosbdCODFUNCIONARIO.AsInteger;
    cdsFolhaPagamentobdNOMEFUNCIONARIO.AsString := cdsFuncionariosbdNOME.AsString;
    cdsFolhaPagamentobdCARGO.AsString := cdsFuncionariosbdCARGO.AsString;
    cdsFolhaPagamentobdSALARIOBASE.AsCurrency := wSalarioBase;
    cdsFolhaPagamentobdHORASEXTRAS.AsCurrency := wValorHorasExtras;
    cdsFolhaPagamentobdOUTROSVALORES.AsCurrency := wValorOutros;
    cdsFolhaPagamentobdINSS.AsCurrency := wValorINSS;
    cdsFolhaPagamentobdIRRF.AsCurrency := wValorIRRF;
    cdsFolhaPagamentobdVALETRANSPORTE.AsCurrency := wValorValeT;
    cdsFolhaPagamentobdTOTALPROVENTOS.AsCurrency := wValorTotalPv;
    cdsFolhaPagamentobdTOTALDESCONTOS.AsCurrency := wValorDescontosTotalRD;
    cdsFolhaPagamentobdSALARIOLIQUIDO.AsCurrency := wValorTotalPv - wValorDescontosTotalRD;
    cdsFolhaPagamento.Post;
end;

function TfrFolhaPagamento.fGerarCodigoUnico: Integer;
var
  wTotalRegistros: Integer;
begin
  wTotalRegistros := 0;
  cdsFolhaPagamento.First;
  while not cdsFolhaPagamento.Eof do
    begin
      wTotalRegistros := wTotalRegistros + 1;
      cdsFolhaPagamento.Next;
    end;
  Result := wTotalRegistros + 1;
end;

procedure TfrFolhaPagamento.btLimparClick(Sender: TObject);
begin
  // Limpar os campos
  cbNomeFuncionario.ItemIndex := -1;
  pLimparCampos;
end;

procedure TfrFolhaPagamento.pLimparCampos;
begin
  edCargoFuncionario.Text:= '';
  edSalarioBase.Text := '0,00';
  edHorasExtras.Text := '0,00';
  edOutros.Text := '0,00';
  edTotaisProventos.Text := '0,00';
  edINSS.Text := '0,00';
  edIRRF.Text := '0,00';
  edValeTransp.Text := '0,00';
  edTotaisDescontos.Text := '0,00';
  edTotalPVResultado.Text := FormatCurr('"R$ "#,##0.00', 0);
  edTotalDsResultado.Text := FormatCurr('"R$ "#,##0.00', 0);
  edSalarioLiquido.Text := FormatCurr('"R$ "#,##0.00', 0);
end;

procedure TfrFolhaPagamento.pVerificarEditVazio(Sender: TEdit);
begin
   if Trim(Sender.Text) = '' then
    begin
      Sender.Text:= FormatCurr('#,##0.00', 0);
    end;
end;

procedure TfrFolhaPagamento.pCarregarCargoFuncionario;
begin
  cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';
  if cdsFuncionarios.FindKey([wCodFuncionarioEmFoco]) then
    edCargoFuncionario.Text := cdsFuncionariosbdCARGO.AsString
  else
    edCargoFuncionario.Text := '';
  edCargoFuncionario.Text := cdsFuncionariosbdCARGO.AsString;
end;

procedure TfrFolhaPagamento.pCarregarFolhaExistente;
begin
  // Define o índice de busca para o código do funcionário
  cdsFolhaPagamento.IndexFieldNames := 'bdCODFUNCIONARIO';
  
  if cdsFolhaPagamento.FindKey([wCodFuncionarioEmFoco]) then
  begin
    wCodFolhaEmFoco := cdsFolhaPagamentobdCODFOLHA.AsInteger;

    wSalarioBase      := cdsFolhaPagamentobdSALARIOBASE.AsCurrency;
    wValorHorasExtras := cdsFolhaPagamentobdHORASEXTRAS.AsCurrency;
    wValorOutros      := cdsFolhaPagamentobdOUTROSVALORES.AsCurrency;

    edSalarioBase.Text := FormatCurr('#,##0.00', wSalarioBase);
    edHorasExtras.Text := FormatCurr('#,##0.00', wValorHorasExtras);
    edOutros.Text      := FormatCurr('#,##0.00', wValorOutros);

    fCalcularTotalProventos;
    fCalcularTotalDescontos;
    btCalcularClick(Nil);
  end;
end;

procedure TfrFolhaPagamento.folhaGridCellClick(Column: TColumn);
begin
  // Como o cursor do cdsFolhaPagamento já mudou para a linha clicada, sendo o first o primeiro
  // se acerssamos o cdsFolhaPagamentobdCODFUNCIONARIO.AsInteger será o da linha clicada;

  wCodFuncionarioEmFoco := cdsFolhaPagamentobdCODFUNCIONARIO.AsInteger;
  cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOfObject(TObject(wCodFuncionarioEmFoco));
  pCarregarCargoFuncionario;
  pHabilitarCampos;
  pCarregarFolhaExistente;
end;

end.
