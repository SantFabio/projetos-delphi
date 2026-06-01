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
    cdsFolhaPagamento: TClientDataSet;
    DataSource1: TDataSource;
    cdsFuncionarios: TClientDataSet;
    dsFuncionarios: TDataSource;
    cdsFuncionariosbdCODFUNCIONARIO: TIntegerField;
    cdsFuncionariosbdNOME: TStringField;
    cdsFuncionariosbdCARGO: TStringField;
    cdsFuncionariosbdENDERECO: TStringField;
    cdsFuncionariosbdTELEFONE: TStringField;
    cdsFolhaPagamentobdCODFOLHA: TIntegerField;
    cdsFolhaPagamentobdNOMEFUNCIONARIO: TStringField;
    edTotaisProventos: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure btCadastrarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btSalvarCadastroClick(Sender: TObject);
    procedure cbNomeFuncionarioChange(Sender: TObject);
    procedure cbNomeFuncionarioSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private variable declarations }
    wIdFuncionarioEmFoco:Integer;
    wValorINSS:Integer;
    wValorIRRF:Integer;
    { function and procedure declarations }
    function fVerificaSeExiste(coluna:String; alvo: String): Boolean;
    function fVerificaCargoEscolhido:String;
    function fEstaCamposPreenchidos:Boolean;
    procedure pLimparCamposCadastroFuncionarios;
  public
    { Public declarations }
  end;

var
  frFolhaPagamento: TfrFolhaPagamento;

implementation

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
  }
  while not cdsFuncionarios.Eof do
    begin
      cbNomeFuncionario.Items.Insert(wCount,(IntToStr(cdsFuncionariosbdCODFUNCIONARIO.AsInteger) + '- ' + cdsFuncionariosbdNOME.AsString));
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
  wCodNomeFuncionario: String;
  wPosicao: Integer;
begin
     wIndexFuncionario := cbNomeFuncionario.ItemIndex;
     wCodNomeFuncionario := cbNomeFuncionario.Items[wIndexFuncionario];
     // Retorna a posição do caracter no array de chars
     wPosicao := Pos('-', wCodNomeFuncionario);
     //Copy(TextoOriginal, PosicaoInicial, QuantidadeDeCaracteres);
     //Recebe
     wIdFuncionarioEmFoco := StrToInt(Copy(wCodNomeFuncionario, (Length(wCodNomeFuncionario) - Length(wCodNomeFuncionario)) + 1 ,wPosicao - 1));

     cdsFuncionarios.IndexFieldNames := 'bdCODFUNCIONARIO';
     cdsFuncionarios.FindKey([wIdFuncionarioEmFoco]);
     edCargoFuncionario.Text := cdsFuncionariosbdCARGO.Text;
end;

procedure TfrFolhaPagamento.FormCreate(Sender: TObject);
begin
  edSalarioBase.Text := '0,00';
  wValorINSS:= 9;
  wValorIRRF:= 15;
end;

end.
