object Form1: TForm1
  Left = 818
  Top = 117
  Width = 455
  Height = 574
  Caption = 'Form1'
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
  object Label1: TLabel
    Left = 80
    Top = 64
    Width = 36
    Height = 13
    Caption = 'Estado:'
  end
  object lbValorNota: TLabel
    Left = 48
    Top = 144
    Width = 68
    Height = 13
    Caption = 'Valor da Nota:'
  end
  object lbImposto: TLabel
    Left = 62
    Top = 168
    Width = 54
    Height = 13
    Caption = 'Imposto(%):'
  end
  object lbValorTotal: TLabel
    Left = 62
    Top = 240
    Width = 54
    Height = 13
    Caption = 'Valor Total:'
  end
  object lbDataEmissao: TLabel
    Left = 33
    Top = 40
    Width = 83
    Height = 13
    Caption = 'Data da Emiss'#227'o:'
  end
  object lbNumeroNota: TLabel
    Left = 35
    Top = 16
    Width = 81
    Height = 13
    Caption = 'N'#250'mero da Nota:'
  end
  object lbValorTotalNota: TLabel
    Left = 24
    Top = 272
    Width = 95
    Height = 13
    Caption = 'Valor Total da Nota:'
  end
  object cbEstados: TComboBox
    Left = 136
    Top = 60
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnChange = cbEstadosChange
    Items.Strings = (
      'Paran'#225
      'S'#227'o Paulo '
      'Santa Catarina')
  end
  object rgMovimento: TRadioGroup
    Left = 136
    Top = 88
    Width = 145
    Height = 41
    Caption = 'Movimento'
    Columns = 2
    Enabled = False
    Items.Strings = (
      'Entrada '
      'Saida')
    TabOrder = 3
    OnClick = rgMovimentoClick
  end
  object edValorNota: TEdit
    Left = 136
    Top = 136
    Width = 145
    Height = 21
    TabOrder = 4
    OnChange = edValorNotaChange
  end
  object edImposto: TEdit
    Left = 136
    Top = 164
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object btCalcular: TButton
    Left = 136
    Top = 200
    Width = 65
    Height = 25
    Caption = 'Calcular'
    TabOrder = 6
    OnClick = btCalcularClick
  end
  object edValorTotal: TEdit
    Left = 136
    Top = 236
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object edDataEmissao: TEdit
    Left = 136
    Top = 36
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object edNumeroNota: TEdit
    Left = 136
    Top = 12
    Width = 145
    Height = 21
    TabOrder = 0
    OnExit = edNumeroNotaExit
  end
  object btSalvar: TButton
    Left = 216
    Top = 200
    Width = 65
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = btSalvarClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 366
    Width = 439
    Height = 169
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'bdNUMERONOTA'
        Title.Caption = 'Num. da Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdDATAEMISSAO'
        Title.Caption = 'Data da Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdMOVIMENTACAO'
        Title.Caption = 'Movimenta'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdVALORNOTA'
        Title.Caption = 'Valor da Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdIMPOSTO'
        Title.Caption = 'Imposto(%)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdVALORTOTAL'
        Title.Caption = 'Valor Total'
        Visible = True
      end>
  end
  object edValorTotalNota: TEdit
    Left = 136
    Top = 268
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object btCalcularTotalNota: TButton
    Left = 136
    Top = 304
    Width = 145
    Height = 25
    Caption = 'Calcular Total da Nota'
    TabOrder = 10
    OnClick = btCalcularTotalNotaClick
  end
  object cdsCadastroNota: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'bdNUMERONOTA'
        DataType = ftInteger
      end
      item
        Name = 'bdDATAEMISSAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'bdESTADO'
        DataType = ftInteger
      end
      item
        Name = 'bdMOVIMENTACAO'
        DataType = ftInteger
      end
      item
        Name = 'bdVALORNOTA'
        DataType = ftCurrency
      end
      item
        Name = 'bdIMPOSTO'
        DataType = ftCurrency
      end
      item
        Name = 'bdVALORTOTAL'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'iNumeroNota'
        Fields = 'bdNUMERONOTA'
        Options = [ixPrimary, ixUnique]
      end>
    IndexName = 'iNumeroNota'
    Params = <>
    StoreDefs = True
    Left = 88
    Top = 96
    Data = {
      F00000009619E0BD010000001800000007000000000003000000F0000C62644E
      554D45524F4E4F544104000100000000000D626444415441454D495353414F01
      00490000000100055749445448020002000A0008626445535441444F04000100
      000000000E62644D4F56494D454E544143414F04000100000000000B62645641
      4C4F524E4F5441080004000000010007535542545950450200490006004D6F6E
      657900096264494D504F53544F08000400000001000753554254595045020049
      0006004D6F6E6579000C626456414C4F52544F54414C08000400000001000753
      5542545950450200490006004D6F6E6579000000}
    object cdsCadastroNotabdNUMERONOTA: TIntegerField
      FieldName = 'bdNUMERONOTA'
    end
    object cdsCadastroNotabdDATAEMISSAO: TStringField
      FieldName = 'bdDATAEMISSAO'
      Size = 10
    end
    object cdsCadastroNotabdESTADO: TIntegerField
      FieldName = 'bdESTADO'
    end
    object cdsCadastroNotabdMOVIMENTACAO: TIntegerField
      FieldName = 'bdMOVIMENTACAO'
    end
    object cdsCadastroNotabdVALORNOTA: TCurrencyField
      FieldName = 'bdVALORNOTA'
    end
    object cdsCadastroNotabdIMPOSTO: TCurrencyField
      FieldName = 'bdIMPOSTO'
    end
    object cdsCadastroNotabdVALORTOTAL: TCurrencyField
      FieldName = 'bdVALORTOTAL'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsCadastroNota
    Left = 48
    Top = 96
  end
end
