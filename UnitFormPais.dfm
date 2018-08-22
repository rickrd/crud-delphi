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
  TextHeight = 18
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
      object Label1: TLabel [0]
        Left = 70
        Top = 20
        Width = 50
        Height = 25
        Alignment = taRightJustify
        Anchors = []
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel [1]
        Left = 70
        Top = 70
        Width = 50
        Height = 25
        Alignment = taRightJustify
        Anchors = []
        Caption = 'Pa'#237's:'
      end
      object Label3: TLabel [2]
        Left = 70
        Top = 120
        Width = 50
        Height = 25
        Alignment = taRightJustify
        Anchors = []
        AutoSize = False
        Caption = 'Nacio.:'
      end
      object Label4: TLabel [3]
        Left = 70
        Top = 170
        Width = 50
        Height = 25
        Alignment = taRightJustify
        Anchors = []
        AutoSize = False
        Caption = 'C'#243'd.F:'
      end
      inherited cbLimparCampos: TCheckBox
        TabOrder = 4
      end
      object edCod: TEdit
        Left = 130
        Top = 20
        Width = 75
        Height = 26
        Anchors = []
        TabOrder = 0
        OnExit = edCodExit
        OnKeyPress = onKeyPress
      end
      object edCodFed: TEdit
        Tag = 3
        Left = 130
        Top = 170
        Width = 75
        Height = 26
        Anchors = []
        TabOrder = 1
        OnKeyPress = edFinalKeyPress
      end
      object edNacionalidade: TEdit
        Tag = 2
        Left = 130
        Top = 120
        Width = 150
        Height = 26
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
      end
      object edPais: TEdit
        Tag = 1
        Left = 130
        Top = 70
        Width = 150
        Height = 26
        Anchors = []
        TabOrder = 3
        OnKeyPress = onKeyPress
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
