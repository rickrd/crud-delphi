object FormPadrao: TFormPadrao
  Left = 0
  Top = 0
  Caption = 'FormPadrao'
  ClientHeight = 332
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Times New Roman'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 601
    Height = 29
    ButtonHeight = 20
    Caption = 'ToolBar1'
    TabOrder = 0
    ExplicitWidth = 598
    object btAnterior: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 20
      Caption = '<'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object btProximo: TButton
      Left = 75
      Top = 0
      Width = 75
      Height = 20
      Caption = '>'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object btBuscar: TButton
      Left = 150
      Top = 0
      Width = 75
      Height = 20
      Caption = 'Buscar'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 2
    end
    object btInserir: TButton
      Left = 225
      Top = 0
      Width = 75
      Height = 20
      Caption = 'Inserir'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 3
    end
    object btExcluir: TButton
      Left = 300
      Top = 0
      Width = 75
      Height = 20
      Caption = 'Excluir'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 4
    end
    object btImportar: TButton
      Left = 375
      Top = 0
      Width = 75
      Height = 20
      Caption = 'Importar'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 5
    end
    object btExportar: TButton
      Left = 450
      Top = 0
      Width = 75
      Height = 20
      Caption = 'Exportar'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 6
    end
    object btContar: TButton
      Left = 525
      Top = 0
      Width = 75
      Height = 20
      Caption = 'Contar'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 7
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 601
    Height = 284
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 598
    DesignSize = (
      601
      284)
    object Panel2: TPanel
      Left = 357
      Top = 296
      Width = 400
      Height = 250
      Anchors = []
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 354
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
    Top = 313
    Width = 601
    Height = 19
    Panels = <
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'Aguardando'
        Width = 50
      end>
    ExplicitWidth = 598
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
