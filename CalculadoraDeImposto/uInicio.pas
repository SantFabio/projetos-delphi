unit uInicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBClient;

type
  TfrInicio = class(TForm)
    lbCodigo: TLabel;
    edCodigo: TEdit;
    lbCPF: TLabel;
    edCPF: TEdit;
    rgSexo: TRadioGroup;
    cbEstadoCivil: TComboBox;
    lbEstadoCivil: TLabel;
    lbNome: TLabel;
    lbEndereco: TLabel;
    lbTelefone: TLabel;
    edNome: TEdit;
    edEndereco: TEdit;
    edTelefone: TEdit;
    btSalvar: TButton;
    cdsPessoas: TClientDataSet;
    DataSource1: TDataSource;
    cdsPessoasbdCODIGO: TIntegerField;
    cdsPessoasbdCPF: TStringField;
    cdsPessoasbdSEXO: TIntegerField;
    cdsPessoasbdESTADOCIVIL: TIntegerField;
    cdsPessoasbdNOME: TStringField;
    cdsPessoasbdENDERECO: TStringField;
    cdsPessoasbdTELEFONE: TStringField;
    DBGrid1: TDBGrid;
    btMostrarGeneros: TButton;
    procedure btSalvarClick(Sender: TObject);
    procedure edCodigoChange(Sender: TObject);
    procedure btMostrarGenerosClick(Sender: TObject);
  private
    { Private declarations }
    wCod: Integer;
    wCpf: String;
    wSexo: Integer;
    wEstadoCivil: Integer;
    wNome: String;
    wEndereco:String;
    wTelefone:String;

    procedure pSalvarPessoa;
    procedure pLimparCampos;
    function fIsExiste:Boolean;
    function fverificarCamposNecessarios: Boolean;
  public
    { Public declarations }
  end;

var
  frInicio: TfrInicio;

implementation

{$R *.dfm}

procedure TfrInicio.btSalvarClick(Sender: TObject);
begin
  if fIsExiste then
    begin
      ShowMessage('Essa Pessoa Já existe!');
      pLimparCampos;
      edCodigo.SetFocus;
      Exit;
    end
  else
    begin
      pSalvarPessoa
    end
  ;
end;

procedure TfrInicio.pSalvarPessoa;
begin
  wCod := StrToIntDef(edCodigo.Text, 0000);
  wCpf := edCPF.Text;
  wSexo := rgSexo.ItemIndex;
  wEstadoCivil := cbEstadoCivil.ItemIndex;
  wNome := edNome.Text;
  wEndereco := edEndereco.Text;
  wTelefone := edTelefone.Text;

  cdsPessoas.Insert;
    cdsPessoasbdCODIGO.AsInteger := wCod;
    cdsPessoasbdCPF.AsString := wCpf;
    cdsPessoasbdSEXO.AsInteger := wSexo;
    cdsPessoasbdESTADOCIVIL.AsInteger := wEstadoCivil;
    cdsPessoasbdNOME.AsString := wNome;
    cdsPessoasbdENDERECO.AsString := wEndereco;
    cdsPessoasbdTELEFONE.AsString := wTelefone;
  cdsPessoas.Post;
  pLimparCampos;
end;

procedure TfrInicio.edCodigoChange(Sender: TObject);
begin
  wCod := StrToIntDef(edCodigo.Text, 0);
  cdsPessoas.IndexFieldNames := 'bdCODIGO';

  if cdsPessoas.FindKey([wCod]) then
    begin
      edCPF.Text := cdsPessoasbdCPF.AsString;
      rgSexo.ItemIndex := cdsPessoasbdSEXO.AsInteger;
      cbEstadoCivil.ItemIndex := cdsPessoasbdESTADOCIVIL.AsInteger;
      edNome.Text := cdsPessoasbdNOME.AsString;
      edEndereco.Text := cdsPessoasbdENDERECO.AsString;
      edTelefone.Text := cdsPessoasbdTELEFONE.AsString;
    end;
end;

function TfrInicio.fIsExiste: Boolean;
begin
  cdsPessoas.IndexFieldNames := 'bdCODIGO';
  Result := cdsPessoas.FindKey([edCodigo.Text]);
end;

procedure TfrInicio.pLimparCampos;
begin
  edCodigo.Text := '';
  edCPF.Text := '';
  rgSexo.ItemIndex := -1;
  cbEstadoCivil.ItemIndex := -1;
  edNome.Text := '';
  edEndereco.Text := '';
  edTelefone.Text := '';
end;

function TfrInicio.fverificarCamposNecessarios: Boolean;
begin
  if  (edCodigo.Text = '') or
      (edCPF.Text = ''   ) or
      (rgSexo.ItemIndex = -1) or
      (cbEstadoCivil.ItemIndex = -1) or
      (edNome.Text = '') or
      (edTelefone.Text = '') then
        begin
          Result:= true;
        end
  else
    begin
       Result:= false;
    end;
end;

procedure TfrInicio.btMostrarGenerosClick(Sender: TObject);
var
  wMasculinos,
  wFeminos: Integer;
  wNomesMasculinos,
  wNomesFemininos: String;
  wMensagem: String;
begin
  wMasculinos := 0;
  wFeminos := 0;
  wNomesMasculinos := '';
  wNomesFemininos:= '';

  if cdsPessoas.IsEmpty then
    begin
      ShowMessage('Sem Pessoas Cadastradas');
      edCodigo.SetFocus;
      Exit;
    end;

  cdsPessoas.First;
  while not cdsPessoas.Eof do
    begin
      if cdsPessoasbdSEXO.AsInteger = 0 then
        begin
          wMasculinos := wMasculinos + 1;
          wNomesMasculinos := wNomesMasculinos + cdsPessoasbdNOME.AsString + sLineBreak;
        end
       else
        begin
          wFeminos := wFeminos + 1;
          wNomesFemininos := wNomesFemininos + cdsPessoasbdNOME.AsString + sLineBreak;
        end;
        cdsPessoas.Next;
    end;

  wMensagem := 'O número de Pessoas do Sexo Masculinos é ' + IntToStr(wMasculinos) + sLineBreak
              + 'Nomes: ' + sLineBreak
              + wNomesMasculinos + sLineBreak +
              'O número de Pessoas do Sexo Femininos é ' + IntToStr(wFeminos) + sLineBreak
              + 'Nomes: ' + sLineBreak
              + wNomesFemininos;
  ShowMessage(Trim(wMensagem));
end;

end.
