inherited FormPais: TFormPais
  Top = 17
  Caption = 'Cadastro de pa'#237's:'
  ClientHeight = 311
  ClientWidth = 602
  Position = poDesigned
  OnCreate = FormCreate
  ExplicitWidth = 618
  ExplicitHeight = 350
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
  end
  inherited Panel1: TPanel
    Width = 602
    Height = 242
    ExplicitWidth = 602
    ExplicitHeight = 262
    DesignSize = (
      602
      242)
    inherited Panel2: TPanel
      Left = 107
      Top = 5
      ExplicitLeft = 107
      ExplicitTop = 6
      object Label1: TLabel [0]
        Left = 46
        Top = 64
        Width = 42
        Height = 15
        Anchors = []
        Caption = 'C'#243'digo:'
        ExplicitLeft = 49
        ExplicitTop = 74
      end
      object Label2: TLabel [1]
        Left = 62
        Top = 102
        Width = 25
        Height = 15
        Anchors = []
        Caption = 'Pa'#237's:'
        ExplicitLeft = 66
        ExplicitTop = 117
      end
      object Label3: TLabel [2]
        Left = 9
        Top = 144
        Width = 79
        Height = 15
        Anchors = []
        Caption = 'Nacionalidade:'
        ExplicitLeft = 12
        ExplicitTop = 165
      end
      object Label4: TLabel [3]
        Left = 36
        Top = 183
        Width = 51
        Height = 15
        Anchors = []
        Caption = 'C'#243'd.Fed.:'
      end
      inherited cbLimparCampos: TCheckBox
        TabOrder = 4
      end
      object edCod: TEdit
        Left = 103
        Top = 61
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 0
        OnExit = edCodExit
        OnKeyPress = onKeyPress
        ExplicitLeft = 110
        ExplicitTop = 71
      end
      object edCodFed: TEdit
        Tag = 3
        Left = 103
        Top = 180
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 1
        OnKeyPress = edFinalKeyPress
      end
      object edNacionalidade: TEdit
        Tag = 2
        Left = 101
        Top = 141
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
        ExplicitLeft = 110
        ExplicitTop = 162
      end
      object edPais: TEdit
        Tag = 1
        Left = 101
        Top = 99
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 3
        OnKeyPress = onKeyPress
        ExplicitLeft = 110
        ExplicitTop = 114
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 283
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
