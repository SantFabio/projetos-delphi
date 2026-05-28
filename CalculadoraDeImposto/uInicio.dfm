object frInicio: TfrInicio
  Left = 827
  Top = 126
  Width = 417
  Height = 476
  Caption = 'Inicio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TLabel
    Left = 32
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbCPF: TLabel
    Left = 42
    Top = 48
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object lbEstadoCivil: TLabel
    Left = 7
    Top = 136
    Width = 58
    Height = 13
    Caption = 'Estado Civil:'
  end
  object lbNome: TLabel
    Left = 34
    Top = 168
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lbEndereco: TLabel
    Left = 16
    Top = 200
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object lbTelefone: TLabel
    Left = 20
    Top = 232
    Width = 45
    Height = 13
    Caption = 'Telefone:'
  end
  object edCodigo: TEdit
    Left = 80
    Top = 12
    Width = 89
    Height = 21
    TabOrder = 0
    OnChange = edCodigoChange
  end
  object edCPF: TEdit
    Left = 80
    Top = 44
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object rgSexo: TRadioGroup
    Left = 80
    Top = 80
    Width = 161
    Height = 41
    Caption = 'Sexo'
    Columns = 2
    Items.Strings = (
      'Masculino'
      'Feminino')
    TabOrder = 2
  end
  object cbEstadoCivil: TComboBox
    Left = 80
    Top = 132
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'Solteiro'
      'Uni'#227'o inst'#225'vel'
      'Casado'
      'Separado')
  end
  object edNome: TEdit
    Left = 80
    Top = 164
    Width = 305
    Height = 21
    TabOrder = 4
  end
  object edEndereco: TEdit
    Left = 80
    Top = 196
    Width = 305
    Height = 21
    TabOrder = 5
  end
  object edTelefone: TEdit
    Left = 80
    Top = 228
    Width = 161
    Height = 21
    TabOrder = 6
  end
  object btSalvar: TButton
    Left = 88
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = btSalvarClick
  end
  object DBGrid1: TDBGrid
    Left = 80
    Top = 296
    Width = 305
    Height = 120
    DataSource = DataSource1
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'bdCODIGO'
        Title.Caption = 'Cod.'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdCPF'
        Title.Caption = 'CPF'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdNOME'
        Title.Caption = 'Nome'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdESTADOCIVIL'
        Title.Caption = 'Estado Civil'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdSEXO'
        Title.Caption = 'Sexo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdTELEFONE'
        Title.Caption = 'Telefone'
        Width = 126
        Visible = True
      end>
  end
  object btMostrarGeneros: TButton
    Left = 176
    Top = 256
    Width = 113
    Height = 25
    Caption = 'Contar G'#234'nero '
    TabOrder = 9
    OnClick = btMostrarGenerosClick
  end
  object cdsPessoas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 128
    Data = {
      C30000009619E0BD010000001800000007000000000003000000C30008626443
      4F4449474F040001000000000005626443504601004900000001000557494454
      48020002000E000662645345584F04000100000000000D626445535441444F43
      4956494C04000100000000000662644E4F4D4501004900000001000557494454
      480200020064000A6264454E44455245434F0100490000000100055749445448
      02000200C8000A626454454C45464F4E45010049000000010005574944544802
      0002000D000000}
    object cdsPessoasbdCODIGO: TIntegerField
      DisplayWidth = 13
      FieldName = 'bdCODIGO'
    end
    object cdsPessoasbdCPF: TStringField
      DisplayWidth = 23
      FieldName = 'bdCPF'
      Size = 14
    end
    object cdsPessoasbdSEXO: TIntegerField
      DisplayWidth = 16
      FieldName = 'bdSEXO'
    end
    object cdsPessoasbdESTADOCIVIL: TIntegerField
      DisplayWidth = 25
      FieldName = 'bdESTADOCIVIL'
    end
    object cdsPessoasbdNOME: TStringField
      DisplayWidth = 29
      FieldName = 'bdNOME'
      Size = 100
    end
    object cdsPessoasbdENDERECO: TStringField
      DisplayWidth = 27
      FieldName = 'bdENDERECO'
      Size = 200
    end
    object cdsPessoasbdTELEFONE: TStringField
      DisplayWidth = 28
      FieldName = 'bdTELEFONE'
      Size = 13
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsPessoas
    Left = 280
    Top = 128
  end
end
