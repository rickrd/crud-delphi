object FormGrid: TFormGrid
  Left = 0
  Top = 0
  Width = 350
  Height = 350
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 18
  object StringGrid1: TStringGrid
    Left = 0
    Top = 41
    Width = 334
    Height = 247
    Align = alClient
    ColCount = 4
    DrawingStyle = gdsClassic
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyPress = StringGrid1KeyPress
    ExplicitTop = 36
    ExplicitHeight = 251
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 334
    Height = 41
    ButtonHeight = 30
    Caption = 'ToolBar1'
    TabOrder = 1
    ExplicitWidth = 384
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
    object edKeyPress: TEdit
      Left = 150
      Top = 0
      Width = 111
      Height = 30
      Enabled = False
      TabOrder = 2
      TextHint = 'Pesquisa'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 288
    Width = 334
    Height = 23
    Panels = <>
  end
end
