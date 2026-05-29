object frEstacionamento: TfrEstacionamento
  Left = 167
  Top = 101
  Width = 1066
  Height = 510
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
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lbPlaca: TLabel
    Left = 240
    Top = 24
    Width = 30
    Height = 13
    Caption = 'Placa:'
  end
  object lbMarca: TLabel
    Left = 64
    Top = 56
    Width = 33
    Height = 13
    Caption = 'Marca:'
  end
  object lbHoraEntrada: TLabel
    Left = 56
    Top = 128
    Width = 66
    Height = 13
    Caption = 'Hora Entrada:'
  end
  object lbHrSaida: TLabel
    Left = 256
    Top = 120
    Width = 32
    Height = 13
    Caption = 'Sa'#237'da:'
  end
  object lbTipoPagamento: TLabel
    Left = 64
    Top = 160
    Width = 81
    Height = 13
    Caption = 'Tipo Pagamento:'
  end
  object lbValor: TLabel
    Left = 88
    Top = 200
    Width = 27
    Height = 13
    Caption = 'Valor:'
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
    Left = 280
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edMarca: TEdit
    Left = 104
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = edMarcaChange
  end
  object rgTipoCliente: TRadioGroup
    Left = 240
    Top = 48
    Width = 185
    Height = 41
    Caption = 'Tipo'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Di'#225'ria'
      'Mensal')
    TabOrder = 3
    OnClick = rgTipoClienteClick
  end
  object edHrEntrada: TEdit
    Left = 128
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edHrSaida: TEdit
    Left = 304
    Top = 120
    Width = 121
    Height = 21
    Color = clWhite
    TabOrder = 5
    OnChange = edHrSaidaChange
  end
  object cbTipoPagamento: TComboBox
    Left = 152
    Top = 160
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Items.Strings = (
      'Cart'#227'o Credito'
      'Cart'#227'o D'#233'bito'
      'Pix')
  end
  object edValor: TEdit
    Left = 128
    Top = 200
    Width = 121
    Height = 21
    Color = cl3DLight
    Enabled = False
    TabOrder = 7
  end
  object btSalvar: TButton
    Left = 152
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = btSalvarClick
  end
  object btDemPagamento: TButton
    Left = 312
    Top = 192
    Width = 153
    Height = 25
    Caption = 'Demostra Pagamento'
    TabOrder = 9
  end
  object btDemTipoPagamento: TButton
    Left = 312
    Top = 224
    Width = 153
    Height = 25
    Caption = 'Demostrar Tipo Pagamento'
    TabOrder = 10
  end
  object btDemValorTotal: TButton
    Left = 312
    Top = 256
    Width = 153
    Height = 25
    Caption = 'Demostrar Valor Total'
    TabOrder = 11
  end
  object grClientes: TDBGrid
    Left = 0
    Top = 296
    Width = 505
    Height = 145
    DataSource = DataSource1
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btDemostrarValorPorTipo: TButton
    Left = 312
    Top = 160
    Width = 153
    Height = 25
    Caption = 'Demostrar Valor Por Tipo'
    TabOrder = 13
    OnClick = btDemostrarValorPorTipoClick
  end
  object btCadastrarMarca: TButton
    Left = 104
    Top = 88
    Width = 121
    Height = 25
    Caption = 'Cadastrar Marca'
    TabOrder = 14
    OnClick = btCadastrarMarcaClick
  end
  object plCadastrarMarcas: TPanel
    Left = 552
    Top = 24
    Width = 433
    Height = 257
    TabOrder = 15
    object lbCodigo: TLabel
      Left = 124
      Top = 144
      Width = 84
      Height = 21
      AutoSize = False
      Caption = 'C'#243'digo da Marca:'
      Layout = tlCenter
    end
    object lbNomeMarca: TLabel
      Left = 144
      Top = 176
      Width = 64
      Height = 21
      AutoSize = False
      Caption = 'Nome Marca:'
      Layout = tlCenter
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 433
      Height = 120
      DataSource = dsMarcas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          Visible = True
        end>
    end
    object edCodMarca: TEdit
      Left = 218
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = edCodMarcaChange
    end
    object edNomeMarca: TEdit
      Left = 218
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object btCadastarMarca: TButton
      Left = 240
      Top = 208
      Width = 99
      Height = 25
      Caption = 'Cadastar Marca'
      TabOrder = 3
      OnClick = btCadastarMarcaClick
    end
    object btFecharPanel: TButton
      Left = 120
      Top = 208
      Width = 99
      Height = 25
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = btFecharPanelClick
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsClientes
    Left = 40
    Top = 232
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
    Left = 8
    Top = 232
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
      FieldName = 'bdCod'
    end
    object cdsClientesbdPlaca: TStringField
      FieldName = 'bdPlaca'
      Size = 6
    end
    object cdsClientesbdMarca: TStringField
      FieldName = 'bdMarca'
      Size = 10
    end
    object cdsClientesbdTipoCliente: TIntegerField
      FieldName = 'bdTipoCliente'
    end
    object cdsClientesbdHrEntrada: TCurrencyField
      FieldName = 'bdHrEntrada'
    end
    object cdsClientesbdHrSaida: TCurrencyField
      FieldName = 'bdHrSaida'
    end
    object cdsClientesbdTipoPagamento: TIntegerField
      FieldName = 'bdTipoPagamento'
    end
    object cdsClientesbdValorTotal: TCurrencyField
      FieldName = 'bdValorTotal'
    end
  end
  object cdsMarcas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'bdCOD'
        DataType = ftInteger
      end
      item
        Name = 'bdNOMEMARCA'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <
      item
        Name = 'idxMarcas'
        Fields = 'bdMARCAS'
        Options = [ixPrimary, ixUnique]
      end>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 192
    Data = {
      480000009619E0BD010000001800000002000000000003000000480005626443
      4F4404000100000000000B62644E4F4D454D4152434101004900000001000557
      49445448020002000F000000}
    object cdsMarcasbdCOD: TIntegerField
      DisplayWidth = 16
      FieldName = 'bdCOD'
    end
    object cdsMarcasbdNOMEMARCA: TStringField
      DisplayWidth = 70
      FieldName = 'bdNOMEMARCA'
      Size = 15
    end
  end
  object dsMarcas: TDataSource
    DataSet = cdsMarcas
    Left = 40
    Top = 192
  end
end
