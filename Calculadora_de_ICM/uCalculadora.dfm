object Form1: TForm1
  Left = 961
  Top = 255
  Width = 343
  Height = 250
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbPeso: TLabel
    Left = 80
    Top = 24
    Width = 24
    Height = 13
    Caption = 'Peso'
  end
  object Label1: TLabel
    Left = 77
    Top = 64
    Width = 27
    Height = 13
    Caption = 'Altura'
  end
  object lbValorTotal: TLabel
    Left = 57
    Top = 132
    Width = 47
    Height = 13
    Caption = 'Valor total'
  end
  object TLabel
    Left = 112
    Top = 160
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 112
    Top = 160
    Width = 57
    Height = 13
    Caption = 'Resultado ='
  end
  object lbResultado: TLabel
    Left = 203
    Top = 160
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object edPeso: TEdit
    Left = 112
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edAltura: TEdit
    Left = 112
    Top = 60
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btCalcular: TButton
    Left = 135
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btCalcularClick
  end
  object edValorTotal: TEdit
    Left = 112
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 3
  end
end
