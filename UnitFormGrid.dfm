object FormGrid: TFormGrid
  Left = 0
  Top = 0
  Width = 448
  Height = 418
  AutoScroll = True
  Caption = 'FormGrid'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object StringGrid1: TStringGrid
    Left = 0
    Top = 59
    Width = 265
    Height = 222
    ColCount = 4
    DrawingStyle = gdsClassic
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 432
    Height = 29
    ButtonHeight = 30
    Caption = 'ToolBar1'
    TabOrder = 1
    object btExcluir: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btExcluirClick
    end
    object btEscolher: TButton
      Left = 75
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Escolher'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btEscolherClick
    end
  end
  object edPesquisa: TEdit
    Left = 64
    Top = 35
    Width = 70
    Height = 26
    TabOrder = 2
    OnChange = edPesquisaChange
  end
end
