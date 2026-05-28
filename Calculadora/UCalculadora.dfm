object FrCalculadora: TFrCalculadora
  Left = 860
  Top = 150
  Width = 396
  Height = 210
  Caption = 'Calculadora'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbPriValor: TLabel
    Left = 16
    Top = 24
    Width = 64
    Height = 13
    Caption = 'Primeiro Valor'
  end
  object lbSegValor: TLabel
    Left = 16
    Top = 56
    Width = 70
    Height = 13
    Caption = 'Segundo Valor'
  end
  object lbResultado: TLabel
    Left = 16
    Top = 120
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object edValor1: TEdit
    Left = 96
    Top = 20
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object btSoma: TButton
    Left = 288
    Top = 18
    Width = 57
    Height = 25
    Caption = 'Somar'
    TabOrder = 1
    OnClick = btSomaClick
  end
  object edValor2: TEdit
    Left = 96
    Top = 52
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edResultado: TEdit
    Left = 96
    Top = 116
    Width = 153
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object btDiminuir: TButton
    Left = 288
    Top = 50
    Width = 57
    Height = 25
    Caption = 'Diminuir'
    TabOrder = 4
    OnClick = btDiminuirClick
  end
  object btMultiplicar: TButton
    Left = 288
    Top = 80
    Width = 57
    Height = 25
    Caption = 'Multiplicar'
    TabOrder = 5
    OnClick = btMultiplicarClick
  end
  object btDividir: TButton
    Left = 288
    Top = 112
    Width = 57
    Height = 25
    Caption = 'Dividir'
    TabOrder = 6
    OnClick = btDividirClick
  end
end
