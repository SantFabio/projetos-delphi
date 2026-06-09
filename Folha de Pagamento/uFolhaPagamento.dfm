object frFolhaPagamento: TfrFolhaPagamento
  Left = 175
  Top = 78
  BorderStyle = bsDialog
  Caption = 'Folha de Pagamento'
  ClientHeight = 583
  ClientWidth = 1045
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
    Width = 561
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
      Left = 360
      Top = 24
      Width = 31
      Height = 21
      AutoSize = False
      Caption = 'Cargo:'
      Layout = tlCenter
    end
    object lbCompetencia: TLabel
      Left = 326
      Top = 55
      Width = 65
      Height = 13
      Caption = 'Compet'#234'ncia:'
    end
    object cbNomeFuncionario: TComboBox
      Left = 48
      Top = 24
      Width = 273
      Height = 21
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbNomeFuncionarioChange
      OnSelect = cbNomeFuncionarioSelect
    end
    object edCargoFuncionario: TEdit
      Left = 400
      Top = 24
      Width = 153
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object btCadastrar: TButton
      Left = 48
      Top = 49
      Width = 89
      Height = 25
      Caption = 'Cadastrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btCadastrarClick
    end
    object cbMes: TComboBox
      Left = 400
      Top = 53
      Width = 97
      Height = 21
      Enabled = False
      ItemHeight = 13
      TabOrder = 3
      Text = 'M'#234's'
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object seAno: TSpinEdit
      Left = 504
      Top = 53
      Width = 49
      Height = 22
      Enabled = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 0
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
      Text = '0,00'
      OnClick = edSalarioBaseClick
      OnExit = edSalarioBaseExit
      OnKeyPress = edSalarioBaseKeyPress
    end
    object edHorasExtras: TEdit
      Left = 88
      Top = 51
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = '0,00'
      OnClick = edHorasExtrasClick
      OnExit = edHorasExtrasExit
      OnKeyPress = edHorasExtrasKeyPress
    end
    object edOutros: TEdit
      Left = 88
      Top = 76
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '0,00'
      OnClick = edOutrosClick
      OnExit = edOutrosExit
      OnKeyPress = edOutrosKeyPress
    end
    object edTotaisProventos: TEdit
      Left = 88
      Top = 101
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '0,00'
    end
  end
  object gbDescontos: TGroupBox
    Left = 232
    Top = 96
    Width = 337
    Height = 129
    Caption = 'Descontos'
    TabOrder = 2
    object lbINSS: TLabel
      Left = 64
      Top = 26
      Width = 28
      Height = 21
      AutoSize = False
      Caption = 'INSS:'
      Layout = tlCenter
    end
    object lbIRRF: TLabel
      Left = 64
      Top = 51
      Width = 28
      Height = 21
      AutoSize = False
      Caption = 'IRRF:'
      Layout = tlCenter
    end
    object lbValeTransp: TLabel
      Left = 14
      Top = 76
      Width = 78
      Height = 21
      AutoSize = False
      Caption = 'Vale Transporte:'
      Layout = tlCenter
    end
    object lbTotalDescontos: TLabel
      Left = 65
      Top = 101
      Width = 27
      Height = 21
      AutoSize = False
      Caption = 'Total:'
      Layout = tlCenter
    end
    object edINSS: TEdit
      Left = 105
      Top = 26
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = '0,00'
    end
    object edIRRF: TEdit
      Left = 105
      Top = 51
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = '0,00'
    end
    object edValeTransp: TEdit
      Left = 105
      Top = 76
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '0,00'
    end
    object edTotaisDescontos: TEdit
      Left = 105
      Top = 101
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
    Width = 561
    Height = 81
    Caption = 'Resultado'
    TabOrder = 3
    object Panel3: TPanel
      Left = 24
      Top = 24
      Width = 489
      Height = 49
      BevelOuter = bvNone
      TabOrder = 0
      object lbSalarioLiquido: TLabel
        Left = 8
        Top = 30
        Width = 91
        Height = 13
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
        Left = 272
        Top = 0
        Width = 81
        Height = 21
        AutoSize = False
        Caption = 'Total Descontos:'
        Layout = tlCenter
      end
      object lbTotalPvResultados: TLabel
        Left = 20
        Top = 0
        Width = 78
        Height = 21
        AutoSize = False
        Caption = 'Total Proventos:'
        Layout = tlCenter
      end
      object edTotalDsResultado: TEdit
        Left = 368
        Top = 0
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = 'R$ 0,00'
      end
      object edSalarioLiquido: TEdit
        Left = 112
        Top = 29
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
      object edTotalPVResultado: TEdit
        Left = 112
        Top = 0
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = 'R$ 0,00'
      end
    end
  end
  object Panel1: TPanel
    Left = 109
    Top = 320
    Width = 364
    Height = 25
    BevelOuter = bvNone
    UseDockManager = False
    TabOrder = 5
    object btCalcular: TButton
      Left = 1
      Top = 0
      Width = 89
      Height = 25
      Caption = 'Calcular'
      Enabled = False
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
      Enabled = False
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
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btLimparClick
    end
    object btDeletar: TButton
      Left = 288
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Deleta'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btDeletarClick
    end
  end
  object grFolha: TDBGrid
    Left = 0
    Top = 357
    Width = 1045
    Height = 226
    Align = alBottom
    DataSource = dsFolha
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'bdCODFOLHA'
        Title.Caption = 'Cod. Folha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdCODFUNCIONARIO'
        Title.Caption = 'Cod. Funcion'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdNOMEFUNCIONARIO'
        Title.Caption = 'Nome do Funcion'#225'rio'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdMESCOMPETENCIA'
        Title.Caption = 'M'#234's'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdANOCOMPETENCIA'
        Title.Caption = 'Ano'
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
        Title.Caption = 'Horas Extras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdOUTROSVALORES'
        Title.Caption = 'Outros Valores'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdTOTALPROVENTOS'
        Title.Caption = 'Total Proventos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdINSS'
        Title.Caption = 'Valor INSS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdIRRF'
        Title.Caption = 'Valor IRRF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdTOTALDESCONTOS'
        Title.Caption = 'Total Descontos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdSALARIOLIQUIDO'
        Title.Caption = 'Sal'#225'rio Liqu'#237'do'
        Visible = True
      end>
  end
  object pnCadastroUsuario: TPanel
    Left = 596
    Top = 69
    Width = 413
    Height = 436
    Enabled = False
    TabOrder = 4
    object lbCadastroFucionario: TLabel
      Left = 152
      Top = 16
      Width = 139
      Height = 13
      Caption = 'Cadastro de Funcion'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCod: TLabel
      Left = 32
      Top = 49
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object lbNomeUserCadastro: TLabel
      Left = 37
      Top = 74
      Width = 31
      Height = 13
      Caption = 'Nome:'
      Layout = tlCenter
    end
    object lbCargoCadastro: TLabel
      Left = 37
      Top = 99
      Width = 31
      Height = 13
      Caption = 'Cargo:'
      Layout = tlCenter
    end
    object lbEndereco: TLabel
      Left = 19
      Top = 124
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
      Layout = tlCenter
    end
    object lbTelefone: TLabel
      Left = 23
      Top = 148
      Width = 45
      Height = 13
      Caption = 'Telefone:'
      Layout = tlCenter
    end
    object edCodFuncionario: TEdit
      Left = 72
      Top = 45
      Width = 81
      Height = 21
      Color = clMenu
      Enabled = False
      MaxLength = 6
      TabOrder = 0
      OnChange = edCodFuncionarioChange
    end
    object edNomeCadastro: TEdit
      Left = 72
      Top = 70
      Width = 281
      Height = 21
      TabOrder = 1
    end
    object cbCargo: TComboBox
      Left = 72
      Top = 95
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
      Width = 281
      Height = 21
      TabOrder = 3
    end
    object Panel2: TPanel
      Left = 72
      Top = 176
      Width = 281
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
      object btLimparCamposFuncionarios: TBitBtn
        Left = 192
        Top = 0
        Width = 89
        Height = 25
        Caption = 'Limpar'
        TabOrder = 2
        OnClick = btLimparCamposFuncionariosClick
      end
    end
    object grFuncionario: TDBGrid
      Left = 1
      Top = 216
      Width = 411
      Height = 219
      Align = alBottom
      DataSource = dsFuncionarios
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'bdCODFUNCIONARIO'
          Title.Caption = 'ID'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdNOME'
          Title.Caption = 'Nome'
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdCARGO'
          Title.Caption = 'Cargo'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdTELEFONE'
          Title.Caption = 'Telefone'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdENDERECO'
          Title.Caption = 'Endere'#231'o'
          Visible = True
        end>
    end
    object meTelefone: TMaskEdit
      Left = 72
      Top = 144
      Width = 107
      Height = 21
      EditMask = '!\(99\) 99999-9999;1;_'
      MaxLength = 15
      TabOrder = 4
      Text = '(  )      -    '
      OnKeyPress = meTelefoneKeyPress
    end
    object btNovoCargo: TButton
      Left = 277
      Top = 93
      Width = 75
      Height = 24
      Caption = 'Novo Cargo'
      TabOrder = 7
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
    AfterScroll = cdsFuncionariosAfterScroll
    Left = 576
    Top = 40
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
    Left = 608
    Top = 40
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
        Name = 'bdMESCOMPETENCIA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'bdANOCOMPETENCIA'
        DataType = ftInteger
      end
      item
        Name = 'bdCODFUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'bdCARGO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'bdNOMEFUNCIONARIO'
        DataType = ftString
        Size = 100
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
        Name = 'iFolha'
        Fields = 'bdCODFOLHA'
        Options = [ixPrimary, ixUnique]
      end>
    IndexName = 'iFolha'
    Params = <>
    StoreDefs = True
    AfterScroll = cdsFolhaPagamentoAfterScroll
    Left = 576
    Top = 8
    Data = {
      400200009619E0BD01000000180000000F00000000000300000040020A626443
      4F44464F4C484104000100000000001062644D4553434F4D504554454E434941
      0100490000000100055749445448020002000F00106264414E4F434F4D504554
      454E4349410400010000000000106264434F4446554E43494F4E4152494F0400
      010000000000076264434152474F010049000000010005574944544802000200
      32001162644E4F4D4546554E43494F4E4152494F010049000000010005574944
      54480200020064000D626453414C4152494F4241534508000400000001000753
      5542545950450200490006004D6F6E6579000D6264484F524153455854524153
      080004000000010007535542545950450200490006004D6F6E6579000F62644F
      5554524F5356414C4F5245530800040000000100075355425459504502004900
      06004D6F6E657900066264494E53530800040000000100075355425459504502
      00490006004D6F6E657900066264495252460800040000000100075355425459
      50450200490006004D6F6E65790010626456414C455452414E53504F52544508
      0004000000010007535542545950450200490006004D6F6E657900106264544F
      54414C50524F56454E544F530800040000000100075355425459504502004900
      06004D6F6E657900106264544F54414C444553434F4E544F5308000400000001
      0007535542545950450200490006004D6F6E65790010626453414C4152494F4C
      49515549444F080004000000010007535542545950450200490006004D6F6E65
      79000000}
    object cdsFolhaPagamentobdCODFOLHA: TIntegerField
      FieldName = 'bdCODFOLHA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsFolhaPagamentobdMESCOMPETENCIA: TStringField
      FieldName = 'bdMESCOMPETENCIA'
      Size = 15
    end
    object cdsFolhaPagamentobdANOCOMPETENCIA: TIntegerField
      FieldName = 'bdANOCOMPETENCIA'
    end
    object cdsFolhaPagamentobdCODFUNCIONARIO: TIntegerField
      FieldName = 'bdCODFUNCIONARIO'
    end
    object cdsFolhaPagamentobdCARGO: TStringField
      FieldName = 'bdCARGO'
      Size = 50
    end
    object cdsFolhaPagamentobdNOMEFUNCIONARIO: TStringField
      FieldName = 'bdNOMEFUNCIONARIO'
      Size = 100
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
  object dsFolha: TDataSource
    DataSet = cdsFolhaPagamento
    Left = 608
    Top = 8
  end
end
