object FormPadrao: TFormPadrao
  Left = 0
  Top = 0
  Caption = 'FormPadrao'
  ClientHeight = 312
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 601
    Height = 41
    ButtonHeight = 30
    Caption = 'ToolBar1'
    TabOrder = 0
    object btAnterior: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 30
      Caption = '<'
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
    end
    object btProximo: TButton
      Left = 75
      Top = 0
      Width = 75
      Height = 30
      Caption = '>'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object btBuscar: TButton
      Left = 150
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Buscar'
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
    end
    object btInserir: TButton
      Left = 225
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Inserir'
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
    end
    object btExcluir: TButton
      Left = 300
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Excluir'
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
    end
    object btExportar: TButton
      Left = 375
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Exportar'
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 7
    end
    object btImportar: TButton
      Left = 450
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Importar'
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 5
    end
    object btContar: TButton
      Left = 525
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Contar'
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 601
    Height = 243
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -64
    ExplicitTop = 129
    DesignSize = (
      601
      243)
    object Panel2: TPanel
      Left = 50
      Top = 20
      Width = 500
      Height = 200
      Anchors = []
      BevelOuter = bvNone
      TabOrder = 0
      object cbLimparCampos: TCheckBox
        Left = 344
        Top = 229
        Width = 56
        Height = 17
        Caption = 'Limpar'
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 284
    Width = 601
    Height = 28
    Panels = <
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'Aguardando'
        Width = 50
      end>
    ExplicitTop = 312
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 552
    Top = 40
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 552
    Top = 77
  end
end
