unit uFolhaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ExtCtrls, Grids, DBGrids, StdCtrls,
  ComCtrls, DBCtrls,
  Spin;

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
    DBNavigator1: TDBNavigator;
    lbCompetencia: TLabel;
    cbMes: TComboBox;
    Panel3: TPanel;
    cdsFolhaPagamento: TClientDataSet;
    dsFolha: TDataSource;
    cdsFolhaPagamentobdCODFOLHA: TIntegerField;
    cdsFolhaPagamentobdMESCOMPETENCIA: TStringField;
    cdsFolhaPagamentobdANOCOMPETENCIA: TIntegerField;
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
    seAno: TSpinEdit;
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
    procedure cdsFolhaPagamentoAfterScroll(DataSet: TDataSet);
    procedure folhaGridTitleClick(Column: TColumn);

  private
    { private variable declarations }
    // Serï¿½ armazenado aqui o ID do Funcionario em foco, setado no ComboBox
    wCodFuncionarioEmFoco:Integer;
    wCodFolhaEmFoco: Integer;
    wCodigoFolha: Integer;

    wValorValeTPorcentagem: Integer;

    wSalarioBase: Currency;
    wValorHorasExtras: Currency;
    wValorOutros: Currency;
    wValorTotalPv: Currency;

    wValorINSS: Currency;
    wValorIRRF: Currency;
    wValorValeT: Currency;
    wValorDescontosTotal: Currency;

    wAnoAtual: Word;

    wCarregandoDados: Boolean;
    wCamposHabilitados: Boolean;

    { function and procedure declarations }
    function fVerificaSeExiste(coluna:String; alvo: String): Boolean;
    function fVerificaCargoEscolhido: String;
    function fEstaCamposPreenchidos: Boolean;
    function fCalcularTotalDescontos: Currency;
    function fCalcularTotalProventos: Currency;
    function fGerarCodigoUnico: Integer;
    function fCalculaValorINSS: Currency;
    function fCalculaValorIRRF: Currency;
    procedure pCarregarCargoFuncionario;
    procedure pCarregarFolhaExistente;
    procedure pLimparEditClick(PreEdit: TEdit);
    procedure pLimparCamposCadastroFuncionarios;
    procedure pHabilitarCampos;
    procedure pLimparCampos;

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
  //Essa funï¿½ï¿½o abre e fecha o popup de cadastro do usuario, alï¿½m de alimentar os
  //Itens do combobox
  pnCadastroUsuario.Left := 640;
  pnCadastroUsuario.Enabled := False;

  // Limpa o ComboBox para nï¿½o duplicar os itens
  cbNomeFuncionario.Clear;

  // Recarrega os funcionï¿½rios do banco
  wCount := 0;
  cdsFuncionarios.First;
  while not cdsFuncionarios.Eof do
  begin
    cbNomeFuncionario.Items.InsertObject(wCount, cdsFuncionariosbdNOME.AsString, TObject(cdsFuncionariosbdCODFUNCIONARIO.AsInteger));
    wCount := wCount + 1;
    cdsFuncionarios.Next;
  end;

  // Seleciona o funcionï¿½rio de volta usando a variï¿½vel global 'wIdFuncionarioEmFoco'
  cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOfObject(TObject(wCodFuncionarioEmFoco));
  
  if cbNomeFuncionario.ItemIndex <> -1 then
    cbNomeFuncionarioSelect(cbNomeFuncionario) // Restaura e recalcula tudo
  else
    edCargoFuncionario.Clear;

  pLimparCamposCadastroFuncionarios;
end;


procedure TfrFolhaPagamento.btSalvarCadastroClick(Sender: TObject);
begin
  //Essa funï¿½ï¿½o ao clicar em salvar, o usuï¿½rio ï¿½ salvo no BD de funcionï¿½rios;
  if not fEstaCamposPreenchidos then
    begin
      Exit;
    end;

  if fVerificaSeExiste('bdCODFUNCIONARIO', edCodFuncionario.Text) then
    begin
      ShowMessage('Jï¿½ existe um funcionario com esse cï¿½digo'
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
  // Essa funï¿½ï¿½o verifica se todos os campos do cadastro de usuï¿½rio estï¿½o completos
  // Caso sim ele retorna true, caso nï¿½o, false;
  Result:= True;
  if edCodFuncionario.Text = '' then
    begin
      Result:= False;
      ShowMessage('Preenchar o campo Cï¿½digo para poder Salvar!');
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
      ShowMessage('Preenchar o campo "Endereï¿½o" para poder Salvar!');
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
begin
  //Essa funÃ§Ã£o verifica e retorna o cargo escolhido no CB
  if (cbCargo.ItemIndex <> -1) then
    Result := cbCargo.Items[cbCargo.ItemIndex]
  else
    Result := '';
end;

function TfrFolhaPagamento.fVerificaSeExiste(coluna:String; alvo: String): Boolean;
begin
  //Essa funï¿½ï¿½o verifica se o funcionï¿½rio existe;
  cdsFuncionarios.IndexFieldNames := coluna;
  Result := cdsFuncionarios.FindKey([alvo]);
end;

procedure TfrFolhaPagamento.pLimparCamposCadastroFuncionarios;
begin
  //Essa funï¿½ï¿½o limpa os campos de cadastro de funcionï¿½rio
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
     pHabilitarCampos;
     pCarregarFolhaExistente;
     pCarregarCargoFuncionario;
end;

procedure TfrFolhaPagamento.FormCreate(Sender: TObject);
var
  wMesAtual: Word;
  wDiaAtual: Word;
begin
  edSalarioBase.Text := FormatCurr('#,##0.00',0);
  wValorValeTPorcentagem:= 6;
  wValorINSS:= 0;
  wValorIRRF:= 0;
  wValorValeT:= 0;
  wValorDescontosTotal := 0;
  wCamposHabilitados := false;
  wSalarioBase:= 0;
  wValorHorasExtras:= 0;
  wValorOutros:= 0;
  wValorTotalPv:= 0;
  wCodFolhaEmFoco:= 0;
  wCodigoFolha:= 0;

  //Adicionar o ano atual ao seAno
  DecodeDate(Date, wAnoAtual, wMesAtual, wDiaAtual);
  seAno.Value := wAnoAtual;
end;

procedure TfrFolhaPagamento.edSalarioBaseExit(Sender: TObject);
begin
  wSalarioBase            := StrToCurrDef(edSalarioBase.Text, 0);
  edSalarioBase.Text      := FormatCurr('#,##0.00',wSalarioBase);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edHorasExtrasExit(Sender: TObject);
begin
  wValorHorasExtras       := StrToCurrDef(edHorasExtras.Text, 0);
  edHorasExtras.Text      := FormatCurr('#,##0.00',wValorHorasExtras);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edOutrosExit(Sender: TObject);
begin
  wValorOutros            := StrToCurrDef(edOutros.Text, 0);
  edOutros.Text           := FormatCurr('#,##0.00',wValorOutros);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.pHabilitarCampos;
begin
    wCamposHabilitados     := True;
    //Habilita os campos De Proventos
    if (cbNomeFuncionario.ItemIndex = -1) then
      begin
        wCamposHabilitados := False;
      end;

     edSalarioBase.Enabled := wCamposHabilitados;
     edHorasExtras.Enabled := wCamposHabilitados;
     edOutros.Enabled      := wCamposHabilitados;
     btCalcular.Enabled    := wCamposHabilitados;
     btSalvar.Enabled      := wCamposHabilitados;
     btLimpar.Enabled      := wCamposHabilitados;
     cbMes.Enabled         := wCamposHabilitados;
     seAno.Enabled         := wCamposHabilitados
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
    {

    }
    pLimparEditClick(Self.edOutros);
end;


function TfrFolhaPagamento.fCalcularTotalProventos;
begin
  {
    Funï¿½ï¿½o: Calcular proventos
  }
  wValorTotalPv:= wSalarioBase + wValorHorasExtras + wValorOutros;
  edTotaisProventos.Text := FormatCurr('#,##0.00',wValorTotalPv);
  Result:= wValorTotalPv;
end;

function TfrFolhaPagamento.fCalcularTotalDescontos: Currency;
begin
  {
    Função: Calcula e completa os velores dos calculos em seus campos.
  }
   wValorINSS               := fCalculaValorINSS;
   edINSS.Text              := FormatCurr('#,##0.00',wValorINSS);
   wValorIRRF               := fCalculaValorIRRF;
   edIRRF.Text              := FormatCurr('#,##0.00',wValorIRRF);
   wValorValeT              := (wSalarioBase * wValorValeTPorcentagem) / 100;
   edValeTransp.Text        := FormatCurr('#,##0.00',wValorValeT);
   wValorDescontosTotal     := wValorINSS + wValorIRRF + wValorValeT;
   edTotaisDescontos.Text   := FormatCurr('#,##0.00',wValorDescontosTotal);
   Result                   := wValorDescontosTotal;
end;

procedure TfrFolhaPagamento.btCalcularClick(Sender: TObject);
begin
  {
    Função: Botão de calcular e completar os calculos;
  }
  if (edSalarioBase.Text <> '0,00') and (edSalarioBase.Text <> '') then
    begin
      edTotalPVResultado.Text := FormatCurr('"R$ "#,##0.00',fCalcularTotalProventos);
      edTotalDsResultado.Text := FormatCurr('"R$ "#,##0.00',fCalcularTotalDescontos);
      edSalarioLiquido.Text := FormatCurr('"R$ "#,##0.00', wValorTotalPv - wValorDescontosTotal);
    end;
end;

procedure TfrFolhaPagamento.btSalvarClick(Sender: TObject);
var
  wcod: Integer;
  wCodFuncTemp: Integer;
  wNomeTemp: String;
  wCargoTemp: String;
  wMesTemp: String;
  wAnoTemp: Integer;
  wSalarioBaseTemp: Currency;
  wHorasExtrasTemp: Currency;
  wOutrosTemp: Currency;
  wINSSTemp: Currency;
  wIRRFTemp: Currency;
  wValeTTemp: Currency;
  wTotalPvTemp: Currency;
  wTotalDsTemp: Currency;
begin
  {
    Função: Salvar o calculo no banco de dados;
  }
  // Se o Salario for = 0, ou o mÃªs nÃ£o foi selecionado nÃ£o roda, Ã© necessÃ¡riorio ter um valor como salario base e mÃªs;
    if (wSalarioBase = 0) then
      begin
        edSalarioBase.SetFocus;
        Exit;
      end
    else if (cbMes.ItemIndex = -1) then
      begin
        cbMes.SetFocus;
        Exit;
      end;

    // Guarda todos os valores reais da tela antes de rodar fGerarCodigoUnico
    wCodFuncTemp      := cdsFuncionariosbdCODFUNCIONARIO.AsInteger;
    wNomeTemp    := cdsFuncionariosbdNOME.AsString;
    wCargoTemp   := cdsFuncionariosbdCARGO.AsString;
    wMesTemp          := cbMes.Items[cbMes.ItemIndex];
    wAnoTemp          := seAno.Value;
    wSalarioBaseTemp  := wSalarioBase;
    wHorasExtrasTemp  := wValorHorasExtras;
    wOutrosTemp       := wValorOutros;
    wINSSTemp         := wValorINSS;
    wIRRFTemp         := wValorIRRF;
    wValeTTemp        := wValorValeT;
    wTotalPvTemp      := wValorTotalPv;
    wTotalDsTemp      := wValorDescontosTotal;

    wcod := fGerarCodigoUnico;
    cdsFolhaPagamento.IndexFieldNames := 'bdCODFUNCIONARIO;bdMESCOMPETENCIA;bdANOCOMPETENCIA';
    if cdsFolhaPagamento.FindKey([wCodFuncTemp, wMesTemp, wAnoTemp]) then
      begin
        cdsFolhaPagamento.Edit;
      end
    else
      begin
        cdsFolhaPagamento.Insert;
        
        cdsFolhaPagamentobdCODFOLHA.AsInteger := wcod;
      end;
    cdsFolhaPagamentobdMESCOMPETENCIA.AsString   := wMesTemp;
    cdsFolhaPagamentobdANOCOMPETENCIA.AsInteger  := wAnoTemp;
    cdsFolhaPagamentobdCODFUNCIONARIO.AsInteger  := wCodFuncTemp;
    cdsFolhaPagamentobdNOMEFUNCIONARIO.AsString  := wNomeTemp;
    cdsFolhaPagamentobdCARGO.AsString            := wCargoTemp;
    cdsFolhaPagamentobdSALARIOBASE.AsCurrency    := wSalarioBaseTemp;
    cdsFolhaPagamentobdHORASEXTRAS.AsCurrency    := wHorasExtrasTemp;
    cdsFolhaPagamentobdOUTROSVALORES.AsCurrency  := wOutrosTemp;
    cdsFolhaPagamentobdINSS.AsCurrency           := wINSSTemp;
    cdsFolhaPagamentobdIRRF.AsCurrency           := wIRRFTemp;
    cdsFolhaPagamentobdVALETRANSPORTE.AsCurrency := wValeTTemp;
    cdsFolhaPagamentobdTOTALPROVENTOS.AsCurrency := wTotalPvTemp;
    cdsFolhaPagamentobdTOTALDESCONTOS.AsCurrency := wTotalDsTemp;
    cdsFolhaPagamentobdSALARIOLIQUIDO.AsCurrency := wTotalPvTemp - wTotalDsTemp;

    cdsFolhaPagamento.Post;

end;

function TfrFolhaPagamento.fGerarCodigoUnico: Integer;
var                                               
  wMaxID: Integer;
begin
  {
    Funï¿½ï¿½o: Gerar um cï¿½digo que nï¿½o se repita, ele procura o maior valor de ID, ao encontrar ele incrementa e retorna ;
  }
  wMaxID := 0;
  cdsFolhaPagamento.DisableControls;
  try
    cdsFolhaPagamento.First;
    while not cdsFolhaPagamento.Eof do
      begin
        if cdsFolhaPagamentobdCODFOLHA.AsInteger > wMaxID then
          wMaxID := cdsFolhaPagamentobdCODFOLHA.AsInteger;
        cdsFolhaPagamento.Next;
      end;
  finally
    cdsFolhaPagamento.EnableControls;
  end;
  Result := wMaxID + 1;
end;


procedure TfrFolhaPagamento.btLimparClick(Sender: TObject);
begin
  {
    Funï¿½ï¿½o: Botï¿½o de limpar campos.
  }
  // Limpa os campos
  cbNomeFuncionario.ItemIndex := -1;
  pLimparCampos;
end;

procedure TfrFolhaPagamento.pLimparCampos;
begin
  {
    Funï¿½ï¿½o: Limpa os campos de calculo de folha;
  }
  edCargoFuncionario.Text:= '';
  edSalarioBase.Text := FormatCurr('#,##0.00', 0);
  edHorasExtras.Text := FormatCurr('#,##0.00', 0);
  edOutros.Text := FormatCurr('#,##0.00', 0);
  edTotaisProventos.Text := FormatCurr('#,##0.00', 0);
  edINSS.Text := FormatCurr('#,##0.00', 0);
  edIRRF.Text := FormatCurr('#,##0.00', 0);
  edValeTransp.Text := FormatCurr('#,##0.00', 0);
  edTotaisDescontos.Text := FormatCurr('#,##0.00', 0);
  edTotalPVResultado.Text := FormatCurr('"R$ "#,##0.00', 0);
  edTotalDsResultado.Text := FormatCurr('"R$ "#,##0.00', 0);
  edSalarioLiquido.Text := FormatCurr('"R$ "#,##0.00', 0);
  cbMes.ItemIndex := -1;
  seAno.Value := wAnoAtual;
end;

procedure TfrFolhaPagamento.pCarregarCargoFuncionario;
begin
  {
    Funï¿½ï¿½o: ï¿½ chamado ao evento de seleï¿½ï¿½o, e completa o campo edCargoFuncionario
    com o cargo do funcionario em foco;
  }
  cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';
  if cdsFuncionarios.FindKey([wCodFuncionarioEmFoco]) then
    edCargoFuncionario.Text := cdsFuncionariosbdCARGO.AsString
  else
    edCargoFuncionario.Text := '';
end;

procedure TfrFolhaPagamento.pCarregarFolhaExistente;
begin
  {
  Funï¿½ï¿½o: Verifica se existe alguma folha com o cod do funcionario selecionado
  Caso sim, ele preenche os campos, para uma possivel ediï¿½ï¿½o.
  }
  // Define o ï¿½ndice de busca para o cï¿½digo do funcionï¿½rio
  cdsFolhaPagamento.IndexFieldNames := 'bdCODFUNCIONARIO;bdMESCOMPETENCIA;bdANOCOMPETENCIA';
  if cdsFolhaPagamento.FindKey([wCodFuncionarioEmFoco, cbMes.Items[cbMes.ItemIndex], seAno.Value]) then
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
    end
  else
    begin
      pLimparCampos;
      wCodFolhaEmFoco := 0;
    end;
end;

function TfrFolhaPagamento.fCalculaValorINSS: Currency;
begin
  //Funï¿½ï¿½o: Calcula o valor do INSS
  //DescontoINSS = (Base de Cï¿½lculo * Alï¿½quota) / 100 - Parcela a Deduzir
  if wValorTotalPv <=  1621 then
     begin
        Result:= ((wValorTotalPv * 7.5) / 100) - 0;
        Exit;
     end
  else if (wValorTotalPv >  1621) and (wValorTotalPv <=  2902.84) then
    begin
      Result:= ((wValorTotalPv * 9) / 100) - 24.35;
      Exit;
    end
  else if (wValorTotalPv >  2902.84) and (wValorTotalPv <=  4354.27) then
    begin
      Result:= ((wValorTotalPv * 12) / 100) - 111.40;
      Exit;
    end
  else if (wValorTotalPv >  4354.27) and (wValorTotalPv <=  8475.55) then
    begin
      Result:= ((wValorTotalPv * 14) / 100) - 198.49;
      Exit;
    end;
  // Valores maior que o Teto de 8475.55, o valor ï¿½ fixo 996.17
  Result:= 996.17;
end;

function TfrFolhaPagamento.fCalculaValorIRRF: Currency;
var
  wBaseCalculo: Currency;
begin
  //Funï¿½ï¿½o: Calcula o valor do IRRF
  //Imposto Retido = (Base de Cï¿½lculo do IRRF * Alï¿½quota) / 100 - Parcela a Deduzir
  wBaseCalculo:= wValorTotalPv - wValorINSS;

  if wBaseCalculo <=  2428.80 then
     begin
        Result:= 0;
        Exit;
     end
  else if (wBaseCalculo >  2428.80) and (wBaseCalculo <=  2826.65) then
    begin
      Result:= ((wBaseCalculo * 7.5) / 100) - 182.16;
      Exit;
    end
  else if (wBaseCalculo >  2826.65) and (wBaseCalculo <=  3751.05) then
    begin
      Result:= ((wBaseCalculo * 15) / 100) - 394.16;
      Exit;
    end
  else if (wBaseCalculo >  3751.05) and (wBaseCalculo <=  4664.68) then
    begin
      Result:= ((wBaseCalculo * 22.5) / 100) - 675.49;
      Exit;
    end;
  // Valores maior que 4.664,68 a aliquota ï¿½ fixa em 27,5% e o valor a da Parcela a Deduzir ï¿½ R$ 908,73
  Result:= ((wBaseCalculo * 27.5) / 100) - 908.73;
end;

procedure TfrFolhaPagamento.cdsFolhaPagamentoAfterScroll(
  DataSet: TDataSet);
begin
  if not cdsFolhaPagamento.IsEmpty then
    begin
        // Atualiza as variáveis de controle com o registro ativo
      wCodFuncionarioEmFoco := cdsFolhaPagamentobdCODFUNCIONARIO.AsInteger;
      wCodFolhaEmFoco       := cdsFolhaPagamentobdCODFOLHA.AsInteger;

      // Sincroniza a interface visual (ComboBoxes e SpinEdit)
      cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOfObject(TObject(wCodFuncionarioEmFoco));
      cbMes.ItemIndex             := cbMes.Items.IndexOf(cdsFolhaPagamentobdMESCOMPETENCIA.AsString);
      seAno.OnChange := nil; 
      seAno.Value                 := cdsFolhaPagamentobdANOCOMPETENCIA.AsInteger;

     // Atualiza o cargo e habilita os campos
      pCarregarCargoFuncionario;
      pHabilitarCampos;

      // Copia os valores do registro atual do ClientDataSet para a tela (SEM usar FindKey)
      wSalarioBase          := cdsFolhaPagamentobdSALARIOBASE.AsCurrency;
      wValorHorasExtras     := cdsFolhaPagamentobdHORASEXTRAS.AsCurrency;
      wValorOutros          := cdsFolhaPagamentobdOUTROSVALORES.AsCurrency;
      edSalarioBase.Text    := FormatCurr('#,##0.00', wSalarioBase);
      edHorasExtras.Text    := FormatCurr('#,##0.00', wValorHorasExtras);
      edOutros.Text         := FormatCurr('#,##0.00', wValorOutros);
      fCalcularTotalProventos;
      fCalcularTotalDescontos;
      btCalcularClick(Nil);
  end;
end;

procedure TfrFolhaPagamento.folhaGridTitleClick(Column: TColumn);
begin
    { Função: Ordena a Grid de acordo a coluna clicada,dSe já estiver ordenado por essa coluna de forma
    crescente, muda para decrescente (usando o índice) }
    // Para ordenar de forma decrescente no ClientDataSet, adicionamos ':D' ao nome do campo
  if cdsFolhaPagamento.IndexFieldNames = Column.FieldName then
    begin
      cdsFolhaPagamento.IndexFieldNames := Column.FieldName + ':D';
    end
  else
    begin
      cdsFolhaPagamento.IndexFieldNames := Column.FieldName;
    end;
end;

end.
