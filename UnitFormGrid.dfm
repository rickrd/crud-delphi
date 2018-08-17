object FormGrid: TFormGrid
  Left = 0
  Top = 0
  Width = 365
  Height = 340
  AutoScroll = True
  Caption = 'FormGrid'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 35
    Width = 265
    Height = 184
    ColCount = 4
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 349
    Height = 29
    ButtonHeight = 25
    Caption = 'ToolBar1'
    TabOrder = 1
    object btExcluir: TButton
      Left = 0
      Top = 0
      Width = 70
      Height = 25
      Caption = 'Excluir'
      TabOrder = 0
      OnClick = btExcluirClick
    end
    object btEscolher: TButton
      Left = 70
      Top = 0
      Width = 70
      Height = 25
      Caption = 'Escolher'
      Default = True
      TabOrder = 1
      OnClick = btEscolherClick
    end
  end
end
