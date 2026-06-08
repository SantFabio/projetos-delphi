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
    btDeletar: TButton;
    DBGrid1: TDBGrid;
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
    procedure btDeletarClick(Sender: TObject);
    procedure edCodFuncionarioChange(Sender: TObject);
    procedure cdsFuncionariosAfterScroll(DataSet: TDataSet);

  private
    { private variable declarations }
    // Serão armazenado aqui o ID do Funcionario em foco, setado no ComboBox
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

    wCamposHabilitados: Boolean;

    { function and procedure declarations }
    function fVerificaSeExiste(prColuna:String; prAlvo: String): Boolean;
    function fVerificaCargoEscolhido: String;
    function fEstaCamposPreenchidos: Boolean;
    function fCalcularTotalDescontos: Currency;
    function fCalcularTotalProventos: Currency;
    function fGerarCodigoUnico: Integer;
    function fCalculaValorINSS: Currency;
    function fCalculaValorIRRF: Currency;
    procedure pCarregarCargoFuncionario;
    procedure pCarregarFolhaExistente;
    procedure pLimparEditClick(prEdit: TEdit);
    procedure pLimparCamposCadastroFuncionarios;
    procedure pHabilitarCampos;
    procedure pLimparCampos;
    function fValidaCampoMonetario(prEdit: TEdit): Boolean;

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
  // Função: Habilita e trás o modal para fazer o cadastro do funcionário
  pnCadastroUsuario.Enabled := True;
  pnCadastroUsuario.Left := 60;
end;

procedure TfrFolhaPagamento.btFecharClick(Sender: TObject);
var
  wCount: Integer;
begin
  {
    Essa função abre e fecha o popup de cadastro do usuario, além de alimentar os
    Itens do combobox
  }
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
var
  wCodFuncionarioTemp: Integer;
begin
  if not TryStrToInt(edCodFuncionario.Text, wCodFuncionarioTemp) then
    begin
      ShowMessage('Por favor, digite um valor de Código válido.');
      edCodFuncionario.SetFocus;
      Exit;
    end;
  wCodFuncionarioTemp := StrToInt(edCargoFuncionario.Text);
  //Essa função ao clicar em salvar, o usuário é salvo no BD de Funcionarios
  if not fEstaCamposPreenchidos then
    begin
      Exit;
    end;

  cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';
  if not cdsFuncionarios.FindKey([wCodFuncionarioTemp]) then
      begin
          cdsFuncionarios.Insert;
      end
  else
      begin
          cdsFuncionarios.Edit;
      end;
  cdsFuncionariosbdCODFUNCIONARIO.AsInteger := wCodFuncionarioTemp;
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
  // Essa função verifica se todos os campos do cadastro de usuário estiver completos
  // Caso sim ele retorna true, caso nï¿½o, false;
  Result:= True;
  if edCodFuncionario.Text = '' then
      begin
          Result:= False;
          ShowMessage('Preencha o campo Código para poder salvar!');
          edCodFuncionario.SetFocus;
      end
  else if (edNomeCadastro.Text = '') then
      begin
          Result:= False;
          ShowMessage('Preencha o campo Nome para poder salvar!');
          edNomeCadastro.SetFocus;
      end
  else if (cbCargo.ItemIndex = -1) then
      begin
          Result:= False;
          ShowMessage('Preencha o campo Cargo para poder salvar!');
          cbCargo.SetFocus;
      end
  else if (edEndereco.Text = '') then
      begin
          Result:= False;
          ShowMessage('Preencha o campo Endereço para poder salvar!');
          edEndereco.SetFocus;
      end
  else if (edTelefone.Text = '') then
      begin
          Result:= False;
          ShowMessage('Preencha o campo Telefone para poder salvar!');
          edTelefone.SetFocus;
      end;

end;

function TfrFolhaPagamento.fVerificaCargoEscolhido: String;
begin
  //Essa função verifica e retorna o cargo escolhido no CB
    if (cbCargo.ItemIndex <> -1) then
          Result := cbCargo.Items[cbCargo.ItemIndex]
    else
          Result := '';
end;

function TfrFolhaPagamento.fVerificaSeExiste(prColuna:String; prAlvo: String): Boolean;
begin
  //Essa função verifica se o funcionário existe;
  cdsFuncionarios.IndexFieldNames := prColuna;
  Result := cdsFuncionarios.FindKey([prAlvo]);
end;

procedure TfrFolhaPagamento.pLimparCamposCadastroFuncionarios;
begin
  //Essa função limpa os campos de cadastro de funcionï¿½rio
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
  if not fValidaCampoMonetario(edSalarioBase) then
    begin
      ShowMessage('É necessário um valor monetário válido!');
      edSalarioBase.SetFocus;
      Exit;
    end;
  wSalarioBase          := StrToCurrDef(edSalarioBase.Text, 0);
  edSalarioBase.Text          := FormatCurr('#,##0.00',wSalarioBase);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edHorasExtrasExit(Sender: TObject);
begin
  if not fValidaCampoMonetario(edHorasExtras) then
    begin
      ShowMessage('É necessário um valor monetário válido!');
      edHorasExtras.SetFocus;
      Exit;
    end;
  wValorHorasExtras           := StrToCurrDef(edHorasExtras.Text, 0);
  edHorasExtras.Text          := FormatCurr('#,##0.00',wValorHorasExtras);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edOutrosExit(Sender: TObject);
begin
  if not fValidaCampoMonetario(edOutros) then
    begin
      ShowMessage('É necessário um valor monetário válido!');
      edOutros.SetFocus;
      Exit;
    end;
  wValorOutros          := StrToCurrDef(edOutros.Text, 0);
  edOutros.Text          := FormatCurr('#,##0.00',wValorOutros);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.pHabilitarCampos;
begin
    {
      Função: Habilitar os campos de cadastro de nova folha.
    }
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
     btLimpar.Enabled      := wCamposHabilitados;
     cbMes.Enabled         := wCamposHabilitados;
     seAno.Enabled         := wCamposHabilitados
end;

procedure TfrFolhaPagamento.edSalarioBaseClick(Sender: TObject);
begin
  pLimparEditClick(Self.edSalarioBase);
end;

procedure TfrFolhaPagamento.pLimparEditClick(prEdit: TEdit);
begin
  if (prEdit.Text = '0,00') then
    begin
      prEdit.Clear;
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
  {
    Função: Calcular proventos
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
      btSalvar.Enabled  := True;
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
  // Se o Salario for = 0, ou o mês nÃo foi selecionado, o programa não roda, é necessário ter um valor como salario base e mês para osalvar e calcular;
    if (cbMes.ItemIndex = -1) then
      begin
        ShowMessage('Adicione o mês da Competência');
        cbMes.SetFocus;
        Exit;
      end;

    // Guarda todos os valores reais da tela antes de rodar fGerarCodigoUnico
    wCodFuncTemp      := cdsFuncionariosbdCODFUNCIONARIO.AsInteger;
    wNomeTemp         := cdsFuncionariosbdNOME.AsString;
    wCargoTemp        := cdsFuncionariosbdCARGO.AsString;
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
    //desabilita o botão Salvar e Deletar
    btSalvar.Enabled := False;
    btDeletar.Enabled := False;
    //Limpa os campos opós salvar essa folha;
    cbNomeFuncionario.ItemIndex := -1;
    pLimparCampos;
end;

function TfrFolhaPagamento.fGerarCodigoUnico: Integer;
var                                               
  wMaxID: Integer;
begin
  {
    Função: Gerar um código que não se repita, ele procura o maior valor de ID, ao encontrar ele incrementa e retorna ;
  }
  wMaxID := 0;
  cdsFolhaPagamento.DisableControls;
    cdsFolhaPagamento.First;
    while not cdsFolhaPagamento.Eof do
        begin
            if cdsFolhaPagamentobdCODFOLHA.AsInteger > wMaxID then
            wMaxID := cdsFolhaPagamentobdCODFOLHA.AsInteger;
            cdsFolhaPagamento.Next;
        end;
  Result := wMaxID + 1;
end;


procedure TfrFolhaPagamento.btLimparClick(Sender: TObject);
begin
  {
    Função: Botãoo de limpar campos.
  }
  // Limpa os campos
  cbNomeFuncionario.ItemIndex := -1;
  pLimparCampos;
end;

procedure TfrFolhaPagamento.pLimparCampos;
begin
  {
    Função: Limpa os campos de calculo de folha;
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
    Função: Ao selecionar o campo, o campo cargo é adicionado;
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
  Função: Verifica se existe alguma folha com o cod do funcionario selecionado
  Caso sim, ele preenche os campos com os dados da determinada folha.
  }
  // Define o indice de busca para o código do funcionário, junto com mes e ano da compentêncio;
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
  //Funcao: Calcula o valor do INSS
  //DescontoINSS = (Base de Calcuo * Aliquota) / 100 - Parcela a Deduzir
    if wValorTotalPv <=  1621 then
        begin
            Result:= ((wValorTotalPv * 7.5) / 100) - 0;
        end
    else if (wValorTotalPv >  1621) and (wValorTotalPv <=  2902.84) then
        begin
            Result:= ((wValorTotalPv * 9) / 100) - 24.32;
        end
    else if (wValorTotalPv >  2902.84) and (wValorTotalPv <=  4354.27) then
        begin
            Result:= ((wValorTotalPv * 12) / 100) - 111.40;
        end
    else if (wValorTotalPv >  4354.27) and (wValorTotalPv <=  8475.55) then
        begin
            Result:= ((wValorTotalPv * 14) / 100) - 198.49;
        end
    else
        begin
        // Valores maior que o Teto de 8475.55, o valor e fixo de R$ 988.09
            Result:= 988.09;
        end;
end;

function TfrFolhaPagamento.fCalculaValorIRRF: Currency;
var
  wBaseCalculo: Currency;
begin
  //Função: Calcula o valor do IRRF
  //Imposto Retido = (Base de Calculo do IRRF * Alíquota) / 100 - Parcela a Deduzir
  wBaseCalculo:= wValorTotalPv - wValorINSS;

  if wBaseCalculo <=  2428.80 then
      begin
          Result:= 0;
      end
  else if (wBaseCalculo >  2428.80) and (wBaseCalculo <=  2826.65) then
      begin
          Result:= ((wBaseCalculo * 7.5) / 100) - 182.16;
      end
  else if (wBaseCalculo >  2826.65) and (wBaseCalculo <=  3751.05) then
      begin
          Result:= ((wBaseCalculo * 15) / 100) - 394.16;
      end
  else if (wBaseCalculo >  3751.05) and (wBaseCalculo <=  4664.68) then
      begin
          Result:= ((wBaseCalculo * 22.5) / 100) - 675.49;
      end;
  // Valores maior que 4.664,68 a aliquota é fixa em 27,5% e o valor a da Parcela a Deduzir é R$ 908,73
  Result:= ((wBaseCalculo * 27.5) / 100) - 908.73;
end;

procedure TfrFolhaPagamento.cdsFolhaPagamentoAfterScroll(
  DataSet: TDataSet);
begin
  {
  Quando o usuário clica em uma linha (row) de um DBGrid, o componente
  visual precisa "avisar" o CDS para mover o seu cursor interno
  para aquele registro.
  }
  if not cdsFolhaPagamento.IsEmpty then
      begin
        // Atualiza as variáveis de controle com o registro ativo
          wCodFuncionarioEmFoco := cdsFolhaPagamentobdCODFUNCIONARIO.AsInteger;
          wCodFolhaEmFoco       := cdsFolhaPagamentobdCODFOLHA.AsInteger;

        // Sincroniza a interface visual (ComboBoxes e SpinEdit)
          cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOfObject(TObject(wCodFuncionarioEmFoco));
          cbMes.ItemIndex             := cbMes.Items.IndexOf(cdsFolhaPagamentobdMESCOMPETENCIA.AsString);
          seAno.OnChange := nil; //Forçando a execução com nil
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
    btDeletar.Enabled := True;
end;

procedure TfrFolhaPagamento.folhaGridTitleClick(Column: TColumn);
begin
    { Função: Ordena a Grid de acordo a coluna clicada, Se já estiver
    ordenado por essa coluna de forma crescente, muda
    para decrescente (usando o índice) }
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


function TfrFolhaPagamento.fValidaCampoMonetario(prEdit: TEdit): Boolean;
var
  wValorMonetarioTemp: Currency;
begin
  Result := True;
  if not TryStrToCurr(prEdit.Text, wValorMonetarioTemp) then
      begin
          Result:= False;
      end;
end;

procedure TfrFolhaPagamento.btDeletarClick(Sender: TObject);
begin
  if not cdsFolhaPagamento.IsEmpty then
      begin
          cdsFolhaPagamento.Delete;
          pLimparCampos;
      end;
  btDeletar.Enabled := False;
end;

procedure TfrFolhaPagamento.edCodFuncionarioChange(Sender: TObject);
begin
  if fVerificaSeExiste('bdCODFUNCIONARIO', edCodFuncionario.Text) then
      begin
          edNomeCadastro.Text := cdsFuncionariosbdNOME.AsString;
          cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOf(cdsFuncionariosbdCARGO.AsString);
          edEndereco.Text := cdsFuncionariosbdENDERECO.AsString;
          edTelefone.Text := cdsFuncionariosbdTELEFONE.AsString;
      end;
end;

procedure TfrFolhaPagamento.cdsFuncionariosAfterScroll(DataSet: TDataSet);
begin
  {
  Quando o usuário clica em uma linha (row) de um DBGrid, o componente
  visual precisa "avisar" o CDS para mover o seu cursor interno
  para aquele registro.
  }
     if not cdsFuncionarios.IsEmpty then
      begin
          edCodFuncionario.Text := IntToStr(cdsFuncionariosbdCODFUNCIONARIO.AsInteger);
          edNomeCadastro.Text := cdsFuncionariosbdNOME.AsString;
          cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOfName(cdsFuncionariosbdCARGO.AsString);
          edEndereco.Text := cdsFuncionariosbdENDERECO.AsString;
          edTelefone.Text := cdsFuncionariosbdTELEFONE.AsString;
      end;
end;

end.
