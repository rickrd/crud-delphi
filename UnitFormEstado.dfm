inherited FormEstado: TFormEstado
  Caption = 'Cadastro de estado:'
  ClientHeight = 313
  OnCreate = FormCreate
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 18
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
        Caption = 'Estado:'
      end
      object Label3: TLabel [2]
        Left = 70
        Top = 120
        Width = 50
        Height = 25
        Alignment = taRightJustify
        Anchors = []
        Caption = 'Pa'#237's:'
      end
      object Label4: TLabel [3]
        Left = 300
        Top = 120
        Width = 50
        Height = 25
        Alignment = taRightJustify
        Anchors = []
        Caption = 'Al'#237'q.:'
      end
      inherited cbLimparCampos: TCheckBox
        TabOrder = 4
      end
      object edAliquota: TEdit
        Tag = 3
        Left = 360
        Top = 120
        Width = 75
        Height = 26
        Anchors = []
        TabOrder = 0
        OnKeyPress = edFinalKeyPress
      end
      object edCod: TEdit
        Left = 130
        Top = 20
        Width = 75
        Height = 26
        Anchors = []
        TabOrder = 1
        OnExit = edCodExit
        OnKeyPress = onKeyPress
      end
      object edEstado: TEdit
        Tag = 1
        Left = 130
        Top = 70
        Width = 150
        Height = 26
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
      end
      object edPais: TEdit
        Tag = 2
        Left = 130
        Top = 120
        Width = 150
        Height = 26
        Anchors = []
        TabOrder = 3
        OnKeyPress = onKeyPress
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
