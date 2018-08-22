inherited FormEstado: TFormEstado
  Caption = 'Cadastro de estado:'
  ClientHeight = 313
  OnCreate = FormCreate
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 15
  inherited ToolBar1: TToolBar
    Anchors = []
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
    inherited btContar: TButton
      OnClick = btContarClick
    end
  end
  inherited Panel1: TPanel
    Height = 244
    ExplicitHeight = 261
    inherited Panel2: TPanel
      Left = 110
      Top = 6
      ExplicitLeft = 110
      ExplicitTop = 6
      object Label1: TLabel [0]
        Left = 46
        Top = 56
        Width = 42
        Height = 15
        Anchors = []
        Caption = 'C'#243'digo:'
        ExplicitLeft = 50
        ExplicitTop = 65
      end
      object Label2: TLabel [1]
        Left = 48
        Top = 94
        Width = 40
        Height = 15
        Anchors = []
        Caption = 'Estado:'
        ExplicitLeft = 52
        ExplicitTop = 108
      end
      object Label3: TLabel [2]
        Left = 63
        Top = 134
        Width = 25
        Height = 15
        Anchors = []
        Caption = 'Pa'#237's:'
        ExplicitLeft = 67
        ExplicitTop = 153
      end
      object Label4: TLabel [3]
        Left = 252
        Top = 134
        Width = 29
        Height = 15
        Anchors = []
        Caption = 'Al'#237'q.:'
        ExplicitLeft = 266
        ExplicitTop = 153
      end
      inherited cbLimparCampos: TCheckBox
        TabOrder = 4
      end
      object edAliquota: TEdit
        Tag = 3
        Left = 289
        Top = 131
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 0
        OnKeyPress = edFinalKeyPress
        ExplicitLeft = 306
        ExplicitTop = 150
      end
      object edCod: TEdit
        Left = 103
        Top = 53
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 1
        OnExit = edCodExit
        OnKeyPress = onKeyPress
        ExplicitLeft = 110
        ExplicitTop = 62
      end
      object edEstado: TEdit
        Tag = 1
        Left = 101
        Top = 91
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
        ExplicitLeft = 110
        ExplicitTop = 105
      end
      object edPais: TEdit
        Tag = 2
        Left = 101
        Top = 131
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 3
        OnKeyPress = onKeyPress
        ExplicitLeft = 110
        ExplicitTop = 150
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 285
    Panels = <
      item
        Text = 'Aguardando'
        Width = 50
      end>
    ExplicitTop = 294
  end
end
