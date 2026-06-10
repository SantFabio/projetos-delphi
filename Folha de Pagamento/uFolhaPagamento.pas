unit uFolhaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ExtCtrls, Grids, DBGrids, StdCtrls,
  ComCtrls, DBCtrls,
  Spin,
  Mask,
  Buttons;

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
    grFolha: TDBGrid;
    meTelefone: TMaskEdit;
    btLimparCamposFuncionarios: TBitBtn;
    grFuncionario: TDBGrid;
    btNovoCargo: TButton;
    btExcluirCargo: TButton;
    btExcluirFuncionario: TButton;
    procedure btCadastrarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);

    procedure cbNomeFuncionarioSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSalarioBaseExit(Sender: TObject);
    procedure edHorasExtrasExit(Sender: TObject);
    procedure edOutrosExit(Sender: TObject);
    procedure edSalarioBaseClick(Sender: TObject);
    procedure edHorasExtrasClick(Sender: TObject);
    procedure edOutrosClick(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure cdsFolhaPagamentoAfterScroll(DataSet: TDataSet);
    procedure folhaGridTitleClick(Column: TColumn);
    procedure btDeletarClick(Sender: TObject);
    procedure btSalvarCadastroClick(Sender: TObject);
    procedure meTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edCodFuncionarioChange(Sender: TObject);
    procedure cdsFuncionariosAfterScroll(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btLimparCamposFuncionariosClick(Sender: TObject);
    procedure cbNomeFuncionarioChange(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edSalarioBaseKeyPress(Sender: TObject; var Key: Char);
    procedure edHorasExtrasKeyPress(Sender: TObject; var Key: Char);
    procedure edOutrosKeyPress(Sender: TObject; var Key: Char);
    procedure btNovoCargoClick(Sender: TObject);
    procedure btExcluirFuncionarioClick(Sender: TObject);
    procedure btExcluirCargoClick(Sender: TObject);

  private
    { private variable declarations }
    // Serï¿½o armazenado aqui o ID do Funcionario em foco, setado no ComboBox
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
    {Variaveis para criação de funcionários}
    wTelefoneLimpo: String;
    wCarregandoFuncionario: Boolean;

    { function and procedure declarations }
    function fEstaCamposPreenchidos: Boolean;
    function fCalcularTotalDescontos: Currency;
    function fCalcularTotalProventos: Currency;
    function fGerarCodigoUnico: Integer;
    function fGerarCodigoUnicoFuncionario: Integer;
    function fCalculaValorINSS: Currency;
    function fCalculaValorIRRF: Currency;
    function fValidaCampoMonetario(prEdit: TEdit): Boolean;
    function fValidaCamposFolha: Boolean;
    function fLimparMascaraMonetaria(const prTexto: string): string;
    function fRetirarMascaraTelefone(prTelefone: String): String;
    function fNormalizarEspacos(prTexto: String): String;
    procedure pCarregarCargoFuncionario;
    procedure pCarregarFolhaExistente;
    procedure pLimparEditClick(prEdit: TEdit);
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
  // Funï¿½ï¿½o: Habilita e trï¿½s o modal para fazer o cadastro do funcionï¿½rio
  pLimparCamposCadastroFuncionarios;
  edCodFuncionario.Text := IntToStr(fGerarCodigoUnicoFuncionario);
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

  // Seleciona o funcionário de volta usando a variável global
  cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOfObject(TObject(wCodFuncionarioEmFoco));

  if cbNomeFuncionario.ItemIndex <> -1 then
     cbNomeFuncionarioSelect(cbNomeFuncionario)
  else
     edCargoFuncionario.Clear;

  cbNomeFuncionario.Enabled := not cdsFuncionarios.IsEmpty;


end;


function TfrFolhaPagamento.fEstaCamposPreenchidos:Boolean;
begin
  // Essa funï¿½ï¿½o verifica se todos os campos do cadastro de usuï¿½rio estiver completos
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
  else
    begin

      if Length(fRetirarMascaraTelefone(meTelefone.Text)) < 10 then
        begin
          Result:= False;
          ShowMessage('Preencha um Telefone válido com DDD!');
          meTelefone.SetFocus;
        end;

      if wTelefoneLimpo = '00000000000' then
        begin
          Result:= False;
          ShowMessage('Preencha um Telefone válido com DDD!');
          meTelefone.SetFocus;
        end;

    end;

end;

procedure TfrFolhaPagamento.pLimparCamposCadastroFuncionarios;
begin
  //Essa função limpa os campos de cadastro de funcionï¿½rio
  edCodFuncionario.Text := IntToStr(fGerarCodigoUnicoFuncionario);
  edNomeCadastro.Text   := '';
  cbCargo.ItemIndex     := -1;
  edEndereco.Text       := '';
  meTelefone.Text       := '';
end;

procedure TfrFolhaPagamento.cbNomeFuncionarioSelect(Sender: TObject);
var
  wIndexFuncionario: Integer;
begin
    // Essa funï¿½ï¿½o busca o o funcionario em foco e coloca o cargo dele no campo cargo
     wIndexFuncionario := cbNomeFuncionario.ItemIndex;

     if wIndexFuncionario = -1 then
        Exit;

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
  wTelefoneLimpo := '';

  //Adicionar o ano atual ao seAno
  DecodeDate(Date, wAnoAtual, wMesAtual, wDiaAtual);
  seAno.Value := wAnoAtual;

  // setado o after scrol do funcionarios
  cdsFuncionarios.AfterScroll := cdsFuncionariosAfterScroll;
  // Habilita o ComboBox na abertura do formulário se já houver funcionários
  cbNomeFuncionario.Enabled := not cdsFuncionarios.IsEmpty;
end;

procedure TfrFolhaPagamento.edSalarioBaseExit(Sender: TObject);
begin

  if not fValidaCampoMonetario(edSalarioBase) then
    begin
      edSalarioBase.Text := '0';
    end;

  // Limpa os pontos antes de converter
  wSalarioBase              := StrToCurrDef(fLimparMascaraMonetaria(edSalarioBase.Text), 0);
  edSalarioBase.Text        := FormatCurr('#,##0.00', wSalarioBase);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edHorasExtrasExit(Sender: TObject);
begin
  if not fValidaCampoMonetario(edHorasExtras) then
    begin
      edHorasExtras.Text := '0';
    end;
  // Limpa os pontos antes de converter
  wValorHorasExtras         := StrToCurrDef(fLimparMascaraMonetaria(edHorasExtras.Text), 0);
  edHorasExtras.Text        := FormatCurr('#,##0.00', wValorHorasExtras);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edOutrosExit(Sender: TObject);
begin
  if not fValidaCampoMonetario(edOutros) then
    begin
      edOutros.Text := '0';
    end;
  // Limpa os pontos antes de converter
  wValorOutros            := StrToCurrDef(fLimparMascaraMonetaria(edOutros.Text), 0);
  edOutros.Text           := FormatCurr('#,##0.00', wValorOutros);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

function TfrFolhaPagamento.fValidaCampoMonetario(prEdit: TEdit): Boolean;
var
  wValorMonetarioTemp: Currency;
begin
  Result := TryStrToCurr(fLimparMascaraMonetaria(prEdit.Text), wValorMonetarioTemp);
end;

procedure TfrFolhaPagamento.pHabilitarCampos;
begin
    {
      Funï¿½ï¿½o: Habilitar os campos de cadastro de nova folha.
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
    Funï¿½ï¿½o: Calcular proventos
  }
  wValorTotalPv:= wSalarioBase + wValorHorasExtras + wValorOutros;
  edTotaisProventos.Text := FormatCurr('#,##0.00',wValorTotalPv);
  Result:= wValorTotalPv;
end;

function TfrFolhaPagamento.fCalcularTotalDescontos: Currency;
begin
  {
    Funï¿½ï¿½o: Calcula e completa os velores dos calculos em seus campos.
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

  // Funï¿½ï¿½o: Botï¿½o de calcular e completar os calculos;

  if (edSalarioBase.Text <> '0,00') and (edSalarioBase.Text <> '') then
    begin
      edTotalPVResultado.Text := FormatCurr('"R$ "#,##0.00',fCalcularTotalProventos);
      edTotalDsResultado.Text := FormatCurr('"R$ "#,##0.00',fCalcularTotalDescontos);
      edSalarioLiquido.Text := FormatCurr('"R$ "#,##0.00', wValorTotalPv - wValorDescontosTotal);
      btSalvar.Enabled  := True;
    end;

end;

function TfrFolhaPagamento.fGerarCodigoUnico: Integer;
var
  wMaxID: Integer;
begin
  wMaxID := 0;
  cdsFolhaPagamento.First;

  while not cdsFolhaPagamento.Eof do
    begin
      if cdsFolhaPagamentobdCODFOLHA.AsInteger > wMaxID then
        wMaxID := cdsFolhaPagamentobdCODFOLHA.AsInteger;
        cdsFolhaPagamento.Next;
    end;

  Result := wMaxID + 1;
end;

function TfrFolhaPagamento.fGerarCodigoUnicoFuncionario: Integer;
var
  wMaxID: Integer;
begin
  wMaxID := 0;
  cdsFuncionarios.First;

  while not cdsFuncionarios.Eof do
    begin
      if cdsFuncionariosbdCODFUNCIONARIO.AsInteger > wMaxID then
        wMaxID := cdsFuncionariosbdCODFUNCIONARIO.AsInteger;
        cdsFuncionarios.Next;
    end;

  Result := wMaxID + 1;
end;

procedure TfrFolhaPagamento.btLimparClick(Sender: TObject);
begin
  {
    Funï¿½ï¿½o: Botï¿½oo de limpar campos.
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
    Funï¿½ï¿½o: Ao selecionar o campo, o campo cargo ï¿½ adicionado;
  }
  cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';

  if cdsFuncionarios.FindKey([wCodFuncionarioEmFoco]) then
     edCargoFuncionario.Text := cdsFuncionariosbdCARGO.AsString
  else
     edCargoFuncionario.Text := '';
     
end;

procedure TfrFolhaPagamento.pCarregarFolhaExistente;
begin
  if cbMes.ItemIndex = -1 then
    Exit;

  if cdsFolhaPagamento.Locate('bdCODFUNCIONARIO;bdMESCOMPETENCIA;bdANOCOMPETENCIA', VarArrayOf([wCodFuncionarioEmFoco, cbMes.Items[cbMes.ItemIndex], seAno.Value]), []) then
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
  //Funï¿½ï¿½o: Calcula o valor do IRRF
  //Imposto Retido = (Base de Calculo do IRRF * Alï¿½quota) / 100 - Parcela a Deduzir
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
      end
  else
      begin
      // Valores maior que 4.664,68 a aliquota ï¿½ fixa em 27,5% e o valor a da Parcela a Deduzir ï¿½ R$ 908,73
            Result:= ((wBaseCalculo * 27.5) / 100) - 908.73;
      end;

end;

procedure TfrFolhaPagamento.cdsFolhaPagamentoAfterScroll(
  DataSet: TDataSet);
begin
  {
    Quando o usuï¿½rio clica em uma linha (row) de um DBGrid, o componente
    visual precisa "avisar" o CDS para mover o seu cursor interno
    para aquele registro.
  }

  if not cdsFolhaPagamento.IsEmpty then
    begin
        // Atualiza as variï¿½veis de controle com o registro ativo
      wCodFuncionarioEmFoco := cdsFolhaPagamentobdCODFUNCIONARIO.AsInteger;
      wCodFolhaEmFoco       := cdsFolhaPagamentobdCODFOLHA.AsInteger;

        // Sincroniza a interface visual (ComboBoxes e SpinEdit)
      cbNomeFuncionario.ItemIndex := cbNomeFuncionario.Items.IndexOfObject(TObject(wCodFuncionarioEmFoco));
      cbMes.ItemIndex             := cbMes.Items.IndexOf(cdsFolhaPagamentobdMESCOMPETENCIA.AsString);
      seAno.OnChange := nil; //Forï¿½ando a execuï¿½ï¿½o com nil
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
    { Funï¿½ï¿½o: Ordena a Grid de acordo a coluna clicada, Se jï¿½ estiver
    ordenado por essa coluna de forma crescente, muda
    para decrescente (usando o ï¿½ndice) }
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


procedure TfrFolhaPagamento.btDeletarClick(Sender: TObject);
begin

  if not cdsFolhaPagamento.IsEmpty then
    begin
      cdsFolhaPagamento.Delete;
      pLimparCampos;
    end;

  btDeletar.Enabled := False;
end;


procedure TfrFolhaPagamento.btSalvarCadastroClick(Sender: TObject);
begin

  if not fEstaCamposPreenchidos then
    begin
      Exit;
    end;


  cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';

  cdsFuncionarios.AfterScroll := nil;

  if cdsFuncionarios.FindKey([edCodFuncionario.Text]) then
    begin
      cdsFuncionarios.Edit;
      cdsFuncionariosbdCODFUNCIONARIO.AsInteger := cdsFuncionariosbdCODFUNCIONARIO.AsInteger;
    end
  else
    begin
      cdsFuncionarios.Insert;
      cdsFuncionariosbdCODFUNCIONARIO.AsInteger := StrToInt(edCodFuncionario.Text);
    end;

  cdsFuncionariosbdNOME.AsString     := fNormalizarEspacos(edNomeCadastro.Text);
  cdsFuncionariosbdCARGO.AsString    := cbCargo.Items[cbCargo.ItemIndex];
  cdsFuncionariosbdENDERECO.AsString := fNormalizarEspacos(edEndereco.Text);
  cdsFuncionariosbdTELEFONE.AsString := fRetirarMascaraTelefone(meTelefone.Text);
  cdsFuncionarios.Post;

  cdsFuncionarios.AfterScroll := cdsFuncionariosAfterScroll;

  pLimparCamposCadastroFuncionarios;
end;

function TfrFolhaPagamento.fRetirarMascaraTelefone(prTelefone: String): String;
begin
  Result := prTelefone;

  Result := StringReplace(Result, '(', '', [rfReplaceAll]);
  Result := StringReplace(Result, ')', '', [rfReplaceAll]);
  Result := StringReplace(Result, ' ', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
end;

procedure TfrFolhaPagamento.meTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not (Key in ['0'..'9', ',', '.', #8]) then
    begin
      Key := #0;
    end;
    
end;

procedure TfrFolhaPagamento.edCodFuncionarioChange(Sender: TObject);
begin
  btExcluirFuncionario.Enabled := False;
  if wCarregandoFuncionario then
    begin
      Exit;
    end;

  cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';

  if cdsFuncionarios.FindKey([edCodFuncionario.Text]) then
    begin
      edNomeCadastro.Text := cdsFuncionariosbdNOME.AsString;
      cbCargo.ItemIndex   := cbCargo.Items.IndexOf(cdsFuncionariosbdCARGO.AsString);
      edEndereco.Text     := cdsFuncionariosbdENDERECO.AsString;
      meTelefone.Text     := cdsFuncionariosbdTELEFONE.AsString;
    end
  else
    begin
      // Caso o código não seja encontrado, limpa os campos de dados
      edNomeCadastro.Text := '';
      cbCargo.ItemIndex   := -1;
      edEndereco.Text     := '';
      meTelefone.Text     := '';
    end;

end;

procedure TfrFolhaPagamento.cdsFuncionariosAfterScroll(DataSet: TDataSet);
begin

  if cdsFuncionarios.State in [dsInsert, dsEdit] then
    begin
      Exit;
    end;

  if cdsFuncionarios.IsEmpty then
    begin
      btExcluirFuncionario.Enabled := False;
      Exit;
    end;

  wCarregandoFuncionario := True;

  try
    edCodFuncionario.Text := IntToStr(cdsFuncionariosbdCODFUNCIONARIO.AsInteger);
    edNomeCadastro.Text   := cdsFuncionariosbdNOME.AsString;
    cbCargo.ItemIndex     := cbCargo.Items.IndexOf(cdsFuncionariosbdCARGO.AsString);
    edEndereco.Text       := cdsFuncionariosbdENDERECO.AsString;
    meTelefone.Text       := cdsFuncionariosbdTELEFONE.AsString;

    btExcluirFuncionario.Enabled := True;
  finally
    wCarregandoFuncionario := False;
  end;
  
end;

procedure TfrFolhaPagamento.DBGrid1CellClick(Column: TColumn);
begin
  // Força o carregamento dos dados da linha ativa na tela, 
  // mesmo que o banco não mude de posição (AfterScroll não dispare)
  cdsFuncionariosAfterScroll(cdsFuncionarios)
end;

procedure TfrFolhaPagamento.btLimparCamposFuncionariosClick(
  Sender: TObject);
begin
  pLimparCamposCadastroFuncionarios;
end;

procedure TfrFolhaPagamento.cbNomeFuncionarioChange(Sender: TObject);
begin
  cbNomeFuncionario.Enabled := True;
end;

procedure TfrFolhaPagamento.btSalvarClick(Sender: TObject);
var
  wNovoCodigoFolha: Integer;
begin
  // Executa as validaÃ§Ãµes dedicadas antes de salvar
  if not fValidaCamposFolha then
    Exit;

  // Garante que o cÃ¡lculo final estÃ¡ feito e atualizado na tela
  btCalcularClick(nil);

  // Gera o cÃ³digo Ãºnico ANTES de colocar o DataSet em modo de Insert
  wNovoCodigoFolha := fGerarCodigoUnico;

  // Desativa o AfterScroll temporariamente para nÃ£o disparar atualizaÃ§Ãµes em lote na tela
  cdsFolhaPagamento.AfterScroll := nil;
  
  try
    // Procura se jÃ¡ existe uma folha cadastrada para esta competÃªncia usando Locate (evita bugs de Ã­ndice primÃ¡rio)
    if cdsFolhaPagamento.Locate('bdCODFUNCIONARIO;bdMESCOMPETENCIA;bdANOCOMPETENCIA', VarArrayOf([wCodFuncionarioEmFoco, cbMes.Items[cbMes.ItemIndex], seAno.Value]), []) then
      begin
        // Se jÃ¡ existir, edita a folha atual
        cdsFolhaPagamento.Edit;
      end
    else
      begin
        // Se nÃ£o existir, insere uma nova folha
        cdsFolhaPagamento.Insert;
        
        // Atribui a chave usando a variÃ¡vel local prÃ©-gerada
        cdsFolhaPagamentobdCODFOLHA.AsInteger        := wNovoCodigoFolha; 
        cdsFolhaPagamentobdCODFUNCIONARIO.AsInteger  := wCodFuncionarioEmFoco;
        cdsFolhaPagamentobdMESCOMPETENCIA.AsString   := cbMes.Items[cbMes.ItemIndex];
        cdsFolhaPagamentobdANOCOMPETENCIA.AsInteger  := seAno.Value;
      end;

    // Copia as informaÃ§Ãµes para a folha
    cdsFolhaPagamentobdNOMEFUNCIONARIO.AsString := cbNomeFuncionario.Items[cbNomeFuncionario.ItemIndex];
    cdsFolhaPagamentobdCARGO.AsString           := edCargoFuncionario.Text;
    
    // Proventos e Descontos
    cdsFolhaPagamentobdSALARIOBASE.AsCurrency   := wSalarioBase;
    cdsFolhaPagamentobdHORASEXTRAS.AsCurrency   := wValorHorasExtras;
    cdsFolhaPagamentobdOUTROSVALORES.AsCurrency := wValorOutros;
    cdsFolhaPagamentobdINSS.AsCurrency           := wValorINSS;
    cdsFolhaPagamentobdIRRF.AsCurrency           := wValorIRRF;
    cdsFolhaPagamentobdVALETRANSPORTE.AsCurrency  := wValorValeT;
    
    // Totais calculados
    cdsFolhaPagamentobdTOTALPROVENTOS.AsCurrency := wValorTotalPv;
    cdsFolhaPagamentobdTOTALDESCONTOS.AsCurrency := wValorDescontosTotal;
    cdsFolhaPagamentobdSALARIOLIQUIDO.AsCurrency := wValorTotalPv - wValorDescontosTotal;

    // Salva o registro
    cdsFolhaPagamento.Post;

    ShowMessage('Folha de pagamento salva com sucesso!');

    // Limpa os campos da tela e redefine o estado
    btLimparClick(nil);
    btSalvar.Enabled := False;

  finally
    // Reativa o AfterScroll
    cdsFolhaPagamento.AfterScroll := cdsFolhaPagamentoAfterScroll;
  end;
end;

function TfrFolhaPagamento.fValidaCamposFolha: Boolean;
begin
  Result := False;

  // 1. Valida se o funcionário foi selecionado
  if cbNomeFuncionario.ItemIndex = -1 then
    begin
      ShowMessage('Selecione um funcionário antes de salvar!');
      cbNomeFuncionario.SetFocus;
      Exit;
    end;

  // 2. Valida se o mês foi selecionado
  if cbMes.ItemIndex = -1 then
    begin
      ShowMessage('Selecione o mês de competência!');
      cbMes.SetFocus;
      Exit;
    end;

  // 3. Valida o Salário Base (reaproveitando fValidaCampoMonetario)
  if (not fValidaCampoMonetario(edSalarioBase)) or (edSalarioBase.Text = '') or (edSalarioBase.Text = '0,00') then
    begin
      ShowMessage('Insira um valor de Salário Base válido e maior que zero!');
      edSalarioBase.SetFocus;
      Exit;
    end;

  // 4. Valida Horas Extras se houver digitação inválida (reaproveitando fValidaCampoMonetario)
  if not fValidaCampoMonetario(edHorasExtras) then
    begin
      ShowMessage('Valor de Horas Extras inválido!');
      edHorasExtras.SetFocus;
      Exit;
    end;

  // 5. Valida Outros valores se houver digitação inválida (reaproveitando fValidaCampoMonetario)
  if not fValidaCampoMonetario(edOutros) then
    begin
      ShowMessage('Valor de Outros Descontos/Proventos inválido!');
      edOutros.SetFocus;
      Exit;
    end;

  Result := True;
end;


function TfrFolhaPagamento.fLimparMascaraMonetaria(
  const prTexto: string): string;
begin
    // Remove o separador de milhar do sistema ('.' no Brasil, ',' nos EUA)
  Result := StringReplace(prTexto, ThousandSeparator, '', [rfReplaceAll]);
  Result := Trim(Result);
end;

function TfrFolhaPagamento.fNormalizarEspacos(prTexto: String): String;
begin
  Result := Trim(prTexto);

  while Pos('  ', Result) > 0 do
    begin
      Result := StringReplace(Result, '  ', ' ', [rfReplaceAll]);
    end;
end;

procedure TfrFolhaPagamento.edSalarioBaseKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not (Key in ['0'..'9', #8]) then
    begin
      Key := #0;
    end;

end;

procedure TfrFolhaPagamento.edHorasExtrasKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not (Key in ['0'..'9', ',', '.', #8]) then
    begin
      Key := #0;
    end;
    
end;

procedure TfrFolhaPagamento.edOutrosKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not (Key in ['0'..'9', ',', '.', #8]) then
    begin
      Key := #0;
    end;
    
end;


procedure TfrFolhaPagamento.btNovoCargoClick(Sender: TObject);
var
  i: Integer;
  wExiste: Boolean;
begin

  if cbCargo.Text = '' then
    begin
      cbCargo.SetFocus;
    end
  else
    begin
      wExiste := false;

      for i := 0 to cbCargo.Items.Count do
        begin

          if LowerCase(cbCargo.Items[i]) = LowerCase(fNormalizarEspacos(cbCargo.Text)) then
            begin
             wExiste := true;
            end;
        end;

      if wExiste then
        begin
          ShowMessage('Esse cargo já existe');
          cbCargo.ItemIndex := -1;
          Exit;
        end;

      cbCargo.Items.Add(fNormalizarEspacos(cbCargo.Text));
      cbCargo.Text := '';
      ShowMessage('Novo cargo Adicionado');

    end;
    
end;

procedure TfrFolhaPagamento.btExcluirFuncionarioClick(Sender: TObject);
begin
  cdsFuncionarios.Delete;
  pLimparCamposCadastroFuncionarios;
end;

procedure TfrFolhaPagamento.btExcluirCargoClick(Sender: TObject);
begin

  if cbCargo.ItemIndex <> -1 then
    begin
      cbCargo.Items.Delete(cbCargo.ItemIndex);
      cbCargo.ItemIndex := -1
    end;

end;

end.
