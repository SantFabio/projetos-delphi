object frCalculoProduto: TfrCalculoProduto
  Left = 761
  Top = 202
  Width = 507
  Height = 453
  Caption = 'C'#225'lculo de Produto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbDadosProdutos: TGroupBox
    Left = 26
    Top = 16
    Width = 441
    Height = 217
    Caption = 'Dados do Produto'
    TabOrder = 0
    object lbCodigoProduto: TLabel
      Left = 24
      Top = 22
      Width = 91
      Height = 13
      Caption = 'C'#243'digo do Produto:'
    end
    object ldDescricao: TLabel
      Left = 64
      Top = 52
      Width = 51
      Height = 13
      Caption = 'Descric'#227'o:'
    end
    object lbQuantidade: TLabel
      Left = 57
      Top = 82
      Width = 58
      Height = 13
      Caption = 'Quantidade:'
    end
    object lbValorUnitario: TLabel
      Left = 49
      Top = 116
      Width = 66
      Height = 13
      Caption = 'Valor Unit'#225'rio:'
    end
    object lbAliquota: TLabel
      Left = 32
      Top = 172
      Width = 83
      Height = 13
      Caption = 'Al'#237'quota ICMS %:'
    end
    object edCodigoProduto: TEdit
      Left = 136
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edDescricao: TEdit
      Left = 136
      Top = 48
      Width = 281
      Height = 21
      TabOrder = 1
    end
    object edQuantidade: TEdit
      Left = 136
      Top = 78
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edValorUnitario: TEdit
      Left = 136
      Top = 112
      Width = 153
      Height = 21
      TabOrder = 3
    end
    object ckTributado: TCheckBox
      Left = 50
      Top = 142
      Width = 97
      Height = 17
      Caption = 'Tributado?'
      TabOrder = 4
      OnClick = ckTributadoClick
    end
    object edAliquota: TEdit
      Left = 136
      Top = 168
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 5
    end
  end
  object gbTotais: TGroupBox
    Left = 26
    Top = 248
    Width = 441
    Height = 105
    Caption = 'Totais'
    TabOrder = 1
    object lbValorTotal: TLabel
      Left = 58
      Top = 33
      Width = 54
      Height = 13
      Caption = 'Valor Total:'
    end
    object lbValorICMS: TLabel
      Left = 56
      Top = 66
      Width = 56
      Height = 13
      Caption = 'Valor ICMS:'
    end
    object edValorTotal: TEdit
      Left = 136
      Top = 28
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = '0,00'
    end
    object edValorICMS: TEdit
      Left = 136
      Top = 62
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = '0,00'
    end
  end
  object btCalcular: TButton
    Left = 216
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btCalcularClick
  end
  object btLimpar: TButton
    Left = 304
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 3
    OnClick = btLimparClick
  end
  object btFechar: TButton
    Left = 392
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btFecharClick
  end
end
