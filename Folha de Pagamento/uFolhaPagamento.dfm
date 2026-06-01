object frFolhaPagamento: TfrFolhaPagamento
  Left = 633
  Top = 147
  Width = 568
  Height = 611
  Caption = 'Folha de Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbFuncionario: TGroupBox
    Left = 8
    Top = 8
    Width = 545
    Height = 81
    Caption = 'Funcion'#225'rio'
    TabOrder = 0
    object lbNome: TLabel
      Left = 8
      Top = 24
      Width = 31
      Height = 21
      AutoSize = False
      Caption = 'Nome:'
      Layout = tlCenter
    end
    object lbCargo: TLabel
      Left = 344
      Top = 24
      Width = 31
      Height = 21
      AutoSize = False
      Caption = 'Cargo:'
      Layout = tlCenter
    end
    object cbNomeFuncionario: TComboBox
      Left = 48
      Top = 24
      Width = 281
      Height = 21
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbNomeFuncionarioChange
      OnSelect = cbNomeFuncionarioSelect
    end
    object edCargoFuncionario: TEdit
      Left = 384
      Top = 24
      Width = 145
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object btCadastrar: TButton
      Left = 32
      Top = 48
      Width = 89
      Height = 25
      Caption = 'Cadastrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btCadastrarClick
    end
  end
  object gbProventos: TGroupBox
    Left = 8
    Top = 96
    Width = 217
    Height = 129
    Caption = 'Proventos'
    TabOrder = 1
    object lbSalarioBase: TLabel
      Left = 16
      Top = 26
      Width = 62
      Height = 21
      AutoSize = False
      Caption = 'Sal'#225'rio Base:'
      Layout = tlCenter
    end
    object lbHorasExtras: TLabel
      Left = 15
      Top = 51
      Width = 63
      Height = 21
      AutoSize = False
      Caption = 'Horas Extras:'
      Layout = tlCenter
    end
    object lbOutros: TLabel
      Left = 44
      Top = 76
      Width = 34
      Height = 21
      AutoSize = False
      Caption = 'Outros:'
      Layout = tlCenter
    end
    object lbTotalProventos: TLabel
      Left = 51
      Top = 101
      Width = 27
      Height = 21
      AutoSize = False
      Caption = 'Total:'
      Layout = tlCenter
    end
    object edSalarioBase: TEdit
      Left = 88
      Top = 26
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = ' '
    end
    object edHorasExtras: TEdit
      Left = 88
      Top = 51
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edOutros: TEdit
      Left = 88
      Top = 76
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edTotaisProventos: TEdit
      Left = 88
      Top = 101
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = ' '
    end
  end
  object gbDescontos: TGroupBox
    Left = 232
    Top = 96
    Width = 321
    Height = 129
    Caption = 'Descontos'
    TabOrder = 2
    object lbINSS: TLabel
      Left = 56
      Top = 24
      Width = 28
      Height = 21
      AutoSize = False
      Caption = 'INSS:'
      Layout = tlCenter
    end
    object lbIRRF: TLabel
      Left = 56
      Top = 48
      Width = 28
      Height = 21
      AutoSize = False
      Caption = 'IRRF:'
      Layout = tlCenter
    end
    object lbValeTransp: TLabel
      Left = 21
      Top = 72
      Width = 63
      Height = 21
      AutoSize = False
      Caption = 'Vale Transp.:'
      Layout = tlCenter
    end
    object lbTotalDescontos: TLabel
      Left = 57
      Top = 96
      Width = 27
      Height = 21
      AutoSize = False
      Caption = 'Total:'
      Layout = tlCenter
    end
    object edINSS: TEdit
      Left = 96
      Top = 24
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edIRRF: TEdit
      Left = 96
      Top = 48
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edValeTransp: TEdit
      Left = 96
      Top = 72
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edTotaisDescontos: TEdit
      Left = 96
      Top = 96
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
    end
  end
  object gbResultado: TGroupBox
    Left = 8
    Top = 232
    Width = 545
    Height = 105
    Caption = 'Resultado'
    TabOrder = 3
    object lbTotalPvResultados: TLabel
      Left = 36
      Top = 24
      Width = 78
      Height = 21
      AutoSize = False
      Caption = 'Total Proventos:'
      Layout = tlCenter
    end
    object lbSalarioLiquido: TLabel
      Left = 24
      Top = 48
      Width = 90
      Height = 21
      AutoSize = False
      Caption = 'Sal'#225'rio L'#237'quido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object lbTotalDsResultado: TLabel
      Left = 288
      Top = 24
      Width = 81
      Height = 21
      AutoSize = False
      Caption = 'Total Descontos:'
      Layout = tlCenter
    end
    object edTotalPVResultado: TEdit
      Left = 120
      Top = 24
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edSalarioLiquido: TEdit
      Left = 120
      Top = 48
      Width = 377
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edTotalDsResultado: TEdit
      Left = 376
      Top = 24
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 376
    Width = 561
    Height = 201
    Align = alCustom
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object pnCadastroUsuario: TPanel
    Left = 596
    Top = 69
    Width = 441
    Height = 217
    Enabled = False
    TabOrder = 5
    object lbCadastroFucionario: TLabel
      Left = 152
      Top = 16
      Width = 136
      Height = 13
      Caption = 'Cadastro de funcionario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCod: TLabel
      Left = 32
      Top = 48
      Width = 36
      Height = 21
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object lbNomeUserCadastro: TLabel
      Left = 37
      Top = 72
      Width = 31
      Height = 21
      Caption = 'Nome:'
      Layout = tlCenter
    end
    object lbCargoCadastro: TLabel
      Left = 37
      Top = 96
      Width = 31
      Height = 21
      Caption = 'Cargo:'
      Layout = tlCenter
    end
    object lbEndereco: TLabel
      Left = 19
      Top = 120
      Width = 49
      Height = 21
      Caption = 'Endere'#231'o:'
      Layout = tlCenter
    end
    object lbTelefone: TLabel
      Left = 23
      Top = 144
      Width = 45
      Height = 21
      Caption = 'Telefone:'
      Layout = tlCenter
    end
    object edCodFuncionario: TEdit
      Left = 72
      Top = 48
      Width = 81
      Height = 21
      MaxLength = 3
      TabOrder = 0
    end
    object edNomeCadastro: TEdit
      Left = 72
      Top = 72
      Width = 345
      Height = 21
      TabOrder = 1
    end
    object cbCargo: TComboBox
      Left = 72
      Top = 96
      Width = 129
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Desenvolvedor'
        'QA'
        'Analista de Neg'#243'cios'
        'Scrum Master')
    end
    object edEndereco: TEdit
      Left = 72
      Top = 120
      Width = 345
      Height = 21
      TabOrder = 3
    end
    object edTelefone: TEdit
      Left = 72
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object Panel2: TPanel
      Left = 128
      Top = 168
      Width = 185
      Height = 25
      BevelOuter = bvNone
      TabOrder = 5
      object btFechar: TButton
        Left = -2
        Top = 0
        Width = 91
        Height = 25
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = btFecharClick
      end
      object btSalvarCadastro: TButton
        Left = 96
        Top = 0
        Width = 89
        Height = 25
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = btSalvarCadastroClick
      end
    end
  end
  object Panel1: TPanel
    Left = 141
    Top = 344
    Width = 281
    Height = 25
    BevelOuter = bvNone
    UseDockManager = False
    TabOrder = 6
    object btCalcular: TButton
      Left = 1
      Top = 0
      Width = 89
      Height = 25
      Caption = 'Calcular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btSalvar: TButton
      Left = 96
      Top = 0
      Width = 89
      Height = 25
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btLimpar: TButton
      Left = 192
      Top = 0
      Width = 89
      Height = 25
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object cdsFolhaPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 272
    object cdsFolhaPagamentobdCODFOLHA: TIntegerField
      FieldName = 'bdCODFOLHA'
    end
    object cdsFolhaPagamentobdNOMEFUNCIONARIO: TStringField
      FieldName = 'bdNOMEFUNCIONARIO'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    Left = 600
    Top = 272
  end
  object cdsFuncionarios: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'bdCODFUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'bdNOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'bdCARGO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'bdENDERECO'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'bdTELEFONE'
        DataType = ftString
        Size = 14
      end>
    IndexDefs = <
      item
        Name = 'iCOFUNCIONARIO'
        Fields = 'bdCODFUNCIONARIO'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'bdCODFUNCIONARIO'
    Params = <>
    StoreDefs = True
    Left = 568
    Top = 304
    Data = {
      A80000009619E0BD010000001800000005000000000003000000A80010626443
      4F4446554E43494F4E4152494F04000100000000000662644E4F4D4501004900
      00000100055749445448020002001E00076264434152474F0100490000000100
      0557494454480200020014000A6264454E44455245434F010049000000010005
      57494454480200020096000A626454454C45464F4E4501004900000001000557
      49445448020002000E000000}
    object cdsFuncionariosbdCODFUNCIONARIO: TIntegerField
      FieldName = 'bdCODFUNCIONARIO'
    end
    object cdsFuncionariosbdNOME: TStringField
      FieldName = 'bdNOME'
      Size = 30
    end
    object cdsFuncionariosbdCARGO: TStringField
      FieldName = 'bdCARGO'
    end
    object cdsFuncionariosbdENDERECO: TStringField
      FieldName = 'bdENDERECO'
      Size = 150
    end
    object cdsFuncionariosbdTELEFONE: TStringField
      FieldName = 'bdTELEFONE'
      Size = 14
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = cdsFuncionarios
    Left = 600
    Top = 304
  end
end
