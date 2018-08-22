inherited FormPais: TFormPais
  Top = 17
  Caption = 'Cadastro de pa'#237's:'
  ClientHeight = 314
  ClientWidth = 602
  Position = poDesigned
  OnCreate = FormCreate
  ExplicitWidth = 618
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 15
  inherited ToolBar1: TToolBar
    Width = 602
    ExplicitWidth = 602
    inherited btAnterior: TButton
      OnClick = btAnteriorClick
    end
    inherited btProximo: TButton
      OnClick = btProximoClick
    end
    inherited btBuscar: TButton
      OnClick = btBuscarClick
    end
    inherited btInserir: TButton
      OnClick = btInserirClick
    end
    inherited btExcluir: TButton
      OnClick = btExcluirClick
    end
    inherited btImportar: TButton
      OnClick = btImportarClick
    end
    inherited btExportar: TButton
      OnClick = btExportarClick
    end
  end
  inherited Panel1: TPanel
    Width = 602
    Height = 266
    ExplicitWidth = 602
    ExplicitHeight = 266
    DesignSize = (
      602
      266)
    inherited Panel2: TPanel
      Left = 99
      Top = 6
      ExplicitLeft = 99
      ExplicitTop = 6
      object Label1: TLabel [0]
        Left = 49
        Top = 74
        Width = 42
        Height = 15
        Anchors = []
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel [1]
        Left = 66
        Top = 117
        Width = 25
        Height = 15
        Anchors = []
        Caption = 'Pa'#237's:'
      end
      object Label3: TLabel [2]
        Left = 12
        Top = 165
        Width = 79
        Height = 15
        Anchors = []
        Caption = 'Nacionalidade:'
      end
      object Label4: TLabel [3]
        Left = 268
        Top = 163
        Width = 51
        Height = 15
        Anchors = []
        Caption = 'C'#243'd.Fed.:'
      end
      inherited cbLimparCampos: TCheckBox
        TabOrder = 4
      end
      object edCod: TEdit
        Left = 110
        Top = 71
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 0
        OnExit = edCodExit
        OnKeyPress = onKeyPress
      end
      object edCodFed: TEdit
        Tag = 3
        Left = 325
        Top = 160
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 1
        OnKeyPress = edFinalKeyPress
      end
      object edNacionalidade: TEdit
        Tag = 2
        Left = 110
        Top = 162
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
      end
      object edPais: TEdit
        Tag = 1
        Left = 110
        Top = 114
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 3
        OnKeyPress = onKeyPress
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 295
    Width = 602
    Panels = <
      item
        Text = 'Aguardando'
        Width = 50
      end>
    ExplicitTop = 295
    ExplicitWidth = 602
  end
end
