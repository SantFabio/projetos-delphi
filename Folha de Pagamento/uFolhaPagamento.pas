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
    DBGrid1: TDBGrid;
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
    procedure cbNomeFuncionarioChange(Sender: TObject);
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

  private
    { private variable declarations }
    wIdFuncionarioEmFoco:Integer;
    wValorINSS: Currency;
    wValorIRRF: Currency;
    wValorValeT: Currency;
    wValorINSSPorcentagem: Integer;
    wValorIRRFPorcentagem: Integer;
    wValorValeTPorcentagem: Integer;
    wSalarioBase: Currency;
    wValorHorasExtras: Currency;
    wValorOutros: Currency;
    wValorTotalPv: Currency;
    wValorDescontosTotalRD: Currency;
    wCamposHabilitados: Boolean;
    wCodFolhaEmFoco: Integer;
    wCodigoFolha: Integer;
    { function and procedure declarations }
    function fVerificaSeExiste(coluna:String; alvo: String): Boolean;
    function fVerificaCargoEscolhido: String;
    function fEstaCamposPreenchidos: Boolean;
    function fCalcularTotalDescontos: Currency;
    function fCalcularTotalProventos: Currency;
    function fGerarCodigoUnico: Integer;
    procedure pLimparEditClick(PreEdit: TEdit);
    procedure pLimparCamposCadastroFuncionarios;
    procedure pHabilitarCampos;
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

  wCount := 0;
  cdsFuncionarios.First;
  if cbNomeFuncionario.Items.Count > 0 then
    begin
      cbNomeFuncionario.Clear;
    end;

  {
    No Delphi, a forma padrão para inserir um novo item na lista de opções de um
    ComboBox é utilizando o método Add da propriedade Items. A sintaxe é a seguinte:
    ComboBox.Items.Add('Nome da Nova Opção');

    Caso você precise adicionar o item em uma posição específica da lista, em vez
    de no final, você pode usar o método Insert passando o índice desejado: ComboBox.Items.Insert(0, 'Primeira Opção');
  cbEstados.Items.AddObject('Santa Catarina', TObject(42));
  }
  while not cdsFuncionarios.Eof do
    begin
      cbNomeFuncionario.Items.InsertObject(
        wCount,
        cdsFuncionariosbdNOME.AsString,
        TObject(cdsFuncionariosbdCODFUNCIONARIO.AsInteger)
      );

      wCount := wCount + 1;
      cdsFuncionarios.Next;
      end;
  edCargoFuncionario.Clear;
end;

procedure TfrFolhaPagamento.btSalvarCadastroClick(Sender: TObject);
begin
  if not fEstaCamposPreenchidos then
    begin
      Exit;
    end;

  if fVerificaSeExiste('bdCODFUNCIONARIO', edCodFuncionario.Text) then
    begin
      cdsFuncionarios.Edit;
    end
  else
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
      ShowMessage('Preenchar o campo Endereo para poder Salvar!');
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

procedure TfrFolhaPagamento.cbNomeFuncionarioChange(Sender: TObject);
begin
    cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';
    cdsFuncionarios.FindKey([cbNomeFuncionario.ItemIndex]);
end;

procedure TfrFolhaPagamento.cbNomeFuncionarioSelect(Sender: TObject);
var
  wIndexFuncionario: Integer;
  wPosicao: Integer;
begin
      // Essa função busca o o funcionario em foco e coloca o cargo dele no campo cargo
     wIndexFuncionario := cbNomeFuncionario.ItemIndex;
     wIdFuncionarioEmFoco := Integer(cbNomeFuncionario.Items.Objects[wIndexFuncionario]);
     {
     // Retorna a posição do caracter no array de chars
     wPosicao := Pos('-', wCodNomeFuncionario);
     //Copy(TextoOriginal, PosicaoInicial, QuantidadeDeCaracteres);
     //Recebe
     wIdFuncionarioEmFoco := StrToInt(Copy(wCodNomeFuncionario, (Length(wCodNomeFuncionario) - Length(wCodNomeFuncionario)) + 1 ,wPosicao - 1));
     }
     cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';
     cdsFuncionarios.FindKey([wIdFuncionarioEmFoco]);
     edCargoFuncionario.Text := cdsFuncionariosbdCARGO.Text;

     pHabilitarCampos;
end;

procedure TfrFolhaPagamento.FormCreate(Sender: TObject);
begin
  edSalarioBase.Text := '0,00';
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
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edHorasExtrasExit(Sender: TObject);
begin
  wValorHorasExtras:= StrToCurrDef(edHorasExtras.Text, 0);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.edOutrosExit(Sender: TObject);
begin
  wValorOutros := StrToCurrDef(edOutros.Text, 0);
  fCalcularTotalProventos;
  fCalcularTotalDescontos;
end;

procedure TfrFolhaPagamento.pHabilitarCampos;
begin
    //Habilita os campos De Proventos e Descontos
    if not wCamposHabilitados then
      begin
        wCamposHabilitados := true;
      end
    else
      begin
        wCamposHabilitados := False;
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
  edTotaisProventos.Text := CurrToStr(wValorTotalPv);
  Result:= wValorTotalPv;
end;

function TfrFolhaPagamento.fCalcularTotalDescontos: Currency;
begin
   wValorINSS := (wValorTotalPv * wValorINSSPorcentagem) / 100;
   edINSS.Text := CurrToStr(wValorINSS);
   wValorIRRF := (wValorTotalPv * wValorIRRFPorcentagem) / 100;
   edIRRF.Text := CurrToStr(wValorIRRF);
   wValorValeT := (wValorTotalPv * wValorValeTPorcentagem) / 100;
   edValeTransp.Text := CurrToStr(wValorValeT);
   wValorDescontosTotalRD := wValorINSS + wValorIRRF + wValorValeT;
   edTotaisDescontos.Text := CurrToStr(wValorDescontosTotalRD);
   Result:= wValorDescontosTotalRD;
end;

procedure TfrFolhaPagamento.btCalcularClick(Sender: TObject);
begin
  if (edSalarioBase.Text <> '0,00') or (edSalarioBase.Text <> '') then
    begin
      edTotalPVResultado.Text := CurrToStr(fCalcularTotalProventos);
      edTotalDsResultado.Text := CurrToStr(fCalcularTotalDescontos);
      edSalarioLiquido.Text := CurrToStr(wValorTotalPv - wValorDescontosTotalRD);
    end;
end;

procedure TfrFolhaPagamento.btSalvarClick(Sender: TObject);
var
 wcod: Integer;
begin
    wcod:= fGerarCodigoUnico;
    cdsFolhaPagamento.Insert;
    cdsFolhaPagamentobdCODFOLHA.AsInteger := wcod;
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
    cdsFolhaPagamentobdSALARIOLIQUIDO.AsCurrency := wSalarioBase;
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
  edCargoFuncionario.Text:= '';
  edSalarioBase.Text := '0,00';
  edHorasExtras.Text := '0,00';
  edOutros.Text := '0,00';
  edTotaisProventos.Text := '0,00';
  edINSS.Text := '0,00';
  edIRRF.Text := '0,00';
  edValeTransp.Text := '0,00';
  edTotaisDescontos.Text := '0,00';
  edTotalPVResultado := 'R$ 0,00';
  edTotalDsResultado.Text := 'RS 0,00';
  edSalarioLiquido.Text := 'R$ 0,0';
end;



end.
