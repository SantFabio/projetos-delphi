object frFolhaPagamento: TfrFolhaPagamento
  Left = 485
  Top = 188
  Width = 565
  Height = 638
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
      TabOrder = 1
      Text = '0,00'
      OnClick = edSalarioBaseClick
      OnExit = edSalarioBaseExit
    end
    object edHorasExtras: TEdit
      Left = 88
      Top = 51
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '0,00'
      OnClick = edHorasExtrasClick
      OnExit = edHorasExtrasExit
    end
    object edOutros: TEdit
      Left = 88
      Top = 76
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '0,00'
      OnClick = edOutrosClick
      OnExit = edOutrosExit
    end
    object edTotaisProventos: TEdit
      Left = 88
      Top = 101
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = '0,00'
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
      Left = 48
      Top = 24
      Width = 28
      Height = 21
      AutoSize = False
      Caption = 'INSS:'
      Layout = tlCenter
    end
    object lbIRRF: TLabel
      Left = 48
      Top = 48
      Width = 28
      Height = 21
      AutoSize = False
      Caption = 'IRRF:'
      Layout = tlCenter
    end
    object lbValeTransp: TLabel
      Left = 13
      Top = 72
      Width = 63
      Height = 21
      AutoSize = False
      Caption = 'Vale Transp.:'
      Layout = tlCenter
    end
    object lbTotalDescontos: TLabel
      Left = 49
      Top = 96
      Width = 27
      Height = 21
      AutoSize = False
      Caption = 'Total:'
      Layout = tlCenter
    end
    object edINSS: TEdit
      Left = 88
      Top = 24
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = '0,00'
    end
    object edIRRF: TEdit
      Left = 88
      Top = 48
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = '0,00'
    end
    object edValeTransp: TEdit
      Left = 88
      Top = 72
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '0,00'
    end
    object edTotaisDescontos: TEdit
      Left = 88
      Top = 96
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '0,00'
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
      Text = 'R$ 0,00'
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
      Text = 'R$ 0,00'
    end
    object edTotalDsResultado: TEdit
      Left = 376
      Top = 24
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = 'R$ 0,00'
    end
  end
  object folhaGrid: TDBGrid
    Left = 0
    Top = 376
    Width = 561
    Height = 201
    Align = alCustom
    DataSource = dsFolhaPagamento
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = folhaGridCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'bdCODFOLHA'
        Title.Caption = 'Cod. Folha Pgto.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdNOMEFUNCIONARIO'
        Title.Caption = 'Nome Func.'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdCARGO'
        Title.Caption = 'Cargo'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdSALARIOBASE'
        Title.Caption = 'Sal'#225'rio Base'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdHORASEXTRAS'
        Title.Caption = 'Hrs. Extras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdOUTROSVALORES'
        Title.Caption = 'Outros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdINSS'
        Title.Caption = 'INSS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdIRRF'
        Title.Caption = 'IRRF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdVALETRANSPORTE'
        Title.Caption = 'Vale Trans.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdTOTALPROVENTOS'
        Title.Caption = 'Total Prov.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdTOTALDESCONTOS'
        Title.Caption = 'Total Des.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdSALARIOLIQUIDO'
        Title.Caption = 'Sal'#225'rio L'#237'quido'
        Visible = True
      end>
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
      Height = 13
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object lbNomeUserCadastro: TLabel
      Left = 37
      Top = 72
      Width = 31
      Height = 13
      Caption = 'Nome:'
      Layout = tlCenter
    end
    object lbCargoCadastro: TLabel
      Left = 37
      Top = 96
      Width = 31
      Height = 13
      Caption = 'Cargo:'
      Layout = tlCenter
    end
    object lbEndereco: TLabel
      Left = 19
      Top = 120
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
      Layout = tlCenter
    end
    object lbTelefone: TLabel
      Left = 23
      Top = 144
      Width = 45
      Height = 13
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
      TabOrder = 4
    end
    object edTelefone: TEdit
      Left = 72
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object Panel2: TPanel
      Left = 128
      Top = 168
      Width = 185
      Height = 25
      BevelOuter = bvNone
      TabOrder = 3
      object btFechar: TButton
        Left = -2
        Top = 0
        Width = 91
        Height = 25
        Caption = 'Fechar'
        TabOrder = 1
        OnClick = btFecharClick
      end
      object btSalvarCadastro: TButton
        Left = 96
        Top = 0
        Width = 89
        Height = 25
        Caption = 'Salvar'
        TabOrder = 0
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
      OnClick = btCalcularClick
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
      OnClick = btSalvarClick
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
      OnClick = btLimparClick
    end
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
    Left = 560
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
  object cdsFolhaPagamento: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'bdCODFOLHA'
        DataType = ftInteger
      end
      item
        Name = 'bdCODFUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'bdCARGO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'bdNOMEFUNCIONARIO'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'bdSALARIOBASE'
        DataType = ftCurrency
      end
      item
        Name = 'bdHORASEXTRAS'
        DataType = ftCurrency
      end
      item
        Name = 'bdOUTROSVALORES'
        DataType = ftCurrency
      end
      item
        Name = 'bdINSS'
        DataType = ftCurrency
      end
      item
        Name = 'bdIRRF'
        DataType = ftCurrency
      end
      item
        Name = 'bdVALETRANSPORTE'
        DataType = ftCurrency
      end
      item
        Name = 'bdTOTALPROVENTOS'
        DataType = ftCurrency
      end
      item
        Name = 'bdTOTALDESCONTOS'
        DataType = ftCurrency
      end
      item
        Name = 'bdSALARIOLIQUIDO'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'iCODFOLHA'
        Fields = 'bdCODFOLHA'
        Options = [ixPrimary, ixUnique]
      end>
    IndexName = 'iCODFOLHA'
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 272
    Data = {
      020200009619E0BD01000000180000000D00000000000300000002020A626443
      4F44464F4C48410400010000000000106264434F4446554E43494F4E4152494F
      0400010000000000076264434152474F01004900000001000557494454480200
      02001E001162644E4F4D4546554E43494F4E4152494F01004900000001000557
      494454480200020096000D626453414C4152494F424153450800040000000100
      07535542545950450200490006004D6F6E6579000D6264484F52415345585452
      4153080004000000010007535542545950450200490006004D6F6E6579000F62
      644F5554524F5356414C4F524553080004000000010007535542545950450200
      490006004D6F6E657900066264494E5353080004000000010007535542545950
      450200490006004D6F6E65790006626449525246080004000000010007535542
      545950450200490006004D6F6E65790010626456414C455452414E53504F5254
      45080004000000010007535542545950450200490006004D6F6E657900106264
      544F54414C50524F56454E544F53080004000000010007535542545950450200
      490006004D6F6E657900106264544F54414C444553434F4E544F530800040000
      00010007535542545950450200490006004D6F6E65790010626453414C415249
      4F4C49515549444F080004000000010007535542545950450200490006004D6F
      6E6579000000}
    object cdsFolhaPagamentobdCODFOLHA: TIntegerField
      FieldName = 'bdCODFOLHA'
    end
    object cdsFolhaPagamentobdCODFUNCIONARIO: TIntegerField
      FieldName = 'bdCODFUNCIONARIO'
    end
    object cdsFolhaPagamentobdCARGO: TStringField
      FieldName = 'bdCARGO'
      Size = 30
    end
    object cdsFolhaPagamentobdNOMEFUNCIONARIO: TStringField
      FieldName = 'bdNOMEFUNCIONARIO'
      Size = 150
    end
    object cdsFolhaPagamentobdSALARIOBASE: TCurrencyField
      FieldName = 'bdSALARIOBASE'
    end
    object cdsFolhaPagamentobdHORASEXTRAS: TCurrencyField
      FieldName = 'bdHORASEXTRAS'
    end
    object cdsFolhaPagamentobdOUTROSVALORES: TCurrencyField
      FieldName = 'bdOUTROSVALORES'
    end
    object cdsFolhaPagamentobdINSS: TCurrencyField
      FieldName = 'bdINSS'
    end
    object cdsFolhaPagamentobdIRRF: TCurrencyField
      FieldName = 'bdIRRF'
    end
    object cdsFolhaPagamentobdVALETRANSPORTE: TCurrencyField
      FieldName = 'bdVALETRANSPORTE'
    end
    object cdsFolhaPagamentobdTOTALPROVENTOS: TCurrencyField
      FieldName = 'bdTOTALPROVENTOS'
    end
    object cdsFolhaPagamentobdTOTALDESCONTOS: TCurrencyField
      FieldName = 'bdTOTALDESCONTOS'
    end
    object cdsFolhaPagamentobdSALARIOLIQUIDO: TCurrencyField
      FieldName = 'bdSALARIOLIQUIDO'
    end
  end
  object dsFolhaPagamento: TDataSource
    DataSet = cdsFolhaPagamento
    Left = 596
    Top = 269
  end
end
