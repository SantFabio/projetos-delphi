object frEstacionamento: TfrEstacionamento
  Left = 1379
  Top = 141
  Width = 531
  Height = 483
  Caption = 'Estacionamento'
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
  object lbCod: TLabel
    Left = 64
    Top = 24
    Width = 36
    Height = 21
    AutoSize = False
    Caption = 'C'#243'digo:'
    Layout = tlCenter
  end
  object lbPlaca: TLabel
    Left = 256
    Top = 24
    Width = 30
    Height = 21
    AutoSize = False
    Caption = 'Placa:'
    Layout = tlCenter
  end
  object lbMarca: TLabel
    Left = 67
    Top = 64
    Width = 33
    Height = 21
    AutoSize = False
    Caption = 'Marca:'
    Layout = tlCenter
  end
  object lbHoraEntrada: TLabel
    Left = 34
    Top = 112
    Width = 66
    Height = 21
    AutoSize = False
    Caption = 'Hora Entrada:'
    Layout = tlCenter
  end
  object lbHrSaida: TLabel
    Left = 256
    Top = 112
    Width = 32
    Height = 21
    AutoSize = False
    Caption = 'Sa'#237'da:'
    Layout = tlCenter
  end
  object lbTipoPagamento: TLabel
    Left = 19
    Top = 152
    Width = 81
    Height = 21
    AutoSize = False
    Caption = 'Tipo Pagamento:'
    Layout = tlCenter
  end
  object lbValor: TLabel
    Left = 73
    Top = 184
    Width = 27
    Height = 21
    AutoSize = False
    Caption = 'Valor:'
    Layout = tlCenter
  end
  object edCod: TEdit
    Left = 112
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edCodChange
  end
  object edPlaca: TEdit
    Left = 296
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edMarca: TEdit
    Left = 112
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object rgTipoCliente: TRadioGroup
    Left = 296
    Top = 54
    Width = 161
    Height = 41
    Caption = 'Tipo'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Di'#225'ria'
      'Mensal')
    TabOrder = 3
    OnExit = rgTipoClienteExit
  end
  object edHrEntrada: TEdit
    Left = 112
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edHrSaida: TEdit
    Left = 296
    Top = 112
    Width = 121
    Height = 21
    Color = cl3DLight
    Enabled = False
    TabOrder = 5
  end
  object cbTipoPagamento: TComboBox
    Left = 112
    Top = 152
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Items.Strings = (
      'Cart'#227'o Credito'
      'Cart'#227'o D'#233'bito'
      'Pix')
  end
  object edValor: TEdit
    Left = 112
    Top = 184
    Width = 121
    Height = 21
    Color = cl3DLight
    Enabled = False
    TabOrder = 7
  end
  object btSalvar: TButton
    Left = 160
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = btSalvarClick
  end
  object btDemPagamento: TButton
    Left = 296
    Top = 152
    Width = 153
    Height = 25
    Caption = 'Demostra Pagamento'
    TabOrder = 9
  end
  object btDemTipoPagamento: TButton
    Left = 296
    Top = 184
    Width = 153
    Height = 25
    Caption = 'Demostrar Tipo Pagamento'
    TabOrder = 10
  end
  object btDemValorTotal: TButton
    Left = 296
    Top = 216
    Width = 153
    Height = 25
    Caption = 'Demostrar Valor Total'
    TabOrder = 11
  end
  object grClientes: TDBGrid
    Left = 0
    Top = 264
    Width = 523
    Height = 188
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = cdsClientes
    Left = 120
    Top = 216
  end
  object cdsClientes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'bdCod'
        DataType = ftInteger
      end
      item
        Name = 'bdPlaca'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'bdMarca'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'bdTipoCliente'
        DataType = ftInteger
      end
      item
        Name = 'bdHrEntrada'
        DataType = ftCurrency
      end
      item
        Name = 'bdHrSaida'
        DataType = ftCurrency
      end
      item
        Name = 'bdTipoPagamento'
        DataType = ftInteger
      end
      item
        Name = 'bdValorTotal'
        DataType = ftCurrency
      end
      item
        Name = 'bdValorAPagar'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'idxCod'
        Options = [ixPrimary, ixUnique]
      end>
    Params = <>
    StoreDefs = True
    Left = 88
    Top = 216
    Data = {
      2F0100009619E0BD0100000018000000090000000000030000002F0105626443
      6F640400010000000000076264506C6163610100490000000100055749445448
      0200020006000762644D61726361010049000000010005574944544802000200
      0A000D62645469706F436C69656E746504000100000000000B62644872456E74
      72616461080004000000010007535542545950450200490006004D6F6E657900
      0962644872536169646108000400000001000753554254595045020049000600
      4D6F6E6579000F62645469706F506167616D656E746F04000100000000000C62
      6456616C6F72546F74616C080004000000010007535542545950450200490006
      004D6F6E6579000D626456616C6F724150616761720800040000000100075355
      42545950450200490006004D6F6E6579000000}
    object cdsClientesbdCod: TIntegerField
      DisplayWidth = 7
      FieldName = 'bdCod'
    end
    object cdsClientesbdPlaca: TStringField
      DisplayWidth = 9
      FieldName = 'bdPlaca'
      Size = 6
    end
    object cdsClientesbdMarca: TStringField
      DisplayWidth = 12
      FieldName = 'bdMarca'
      Size = 10
    end
    object cdsClientesbdTipoCliente: TIntegerField
      DisplayWidth = 13
      FieldName = 'bdTipoCliente'
    end
    object cdsClientesbdHrEntrada: TCurrencyField
      DisplayWidth = 12
      FieldName = 'bdHrEntrada'
    end
    object cdsClientesbdHrSaida: TCurrencyField
      DisplayWidth = 12
      FieldName = 'bdHrSaida'
    end
    object cdsClientesbdTipoPagamento: TIntegerField
      DisplayWidth = 18
      FieldName = 'bdTipoPagamento'
    end
    object cdsClientesbdValorTotal: TCurrencyField
      DisplayWidth = 12
      FieldName = 'bdValorTotal'
    end
    object cdsClientesbdValorAPagar: TCurrencyField
      DisplayWidth = 14
      FieldName = 'bdValorAPagar'
    end
  end
end
