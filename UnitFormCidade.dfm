inherited FormCidade: TFormCidade
  Caption = 'Cadastro de cidade:'
  ClientWidth = 600
  OnCreate = FormCreate
  ExplicitWidth = 616
  PixelsPerInch = 96
  TextHeight = 15
  inherited ToolBar1: TToolBar
    Width = 600
    inherited btAnterior: TButton
      TabOrder = 2
      OnClick = btAnteriorClick
    end
    inherited btProximo: TButton
      OnClick = btProximoClick
    end
    inherited btBuscar: TButton
      TabOrder = 0
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
    Width = 600
    ExplicitHeight = 260
    DesignSize = (
      600
      243)
    inherited Panel2: TPanel
      Left = 108
      Top = 6
      ExplicitLeft = 108
      ExplicitTop = 6
      object Label1: TLabel [0]
        Left = 48
        Top = 57
        Width = 42
        Height = 15
        Anchors = []
        Caption = 'C'#243'digo:'
        ExplicitLeft = 52
        ExplicitTop = 66
      end
      object Label2: TLabel [1]
        Left = 50
        Top = 97
        Width = 40
        Height = 15
        Anchors = []
        Caption = 'Cidade:'
        ExplicitLeft = 54
        ExplicitTop = 111
      end
      object Label3: TLabel [2]
        Left = 65
        Top = 141
        Width = 25
        Height = 15
        Anchors = []
        Caption = 'Pa'#237's:'
        ExplicitLeft = 69
        ExplicitTop = 161
      end
      object Label4: TLabel [3]
        Left = 263
        Top = 141
        Width = 19
        Height = 15
        Anchors = []
        Caption = 'UF:'
        ExplicitLeft = 277
        ExplicitTop = 161
      end
      inherited cbLimparCampos: TCheckBox
        TabOrder = 4
        OnClick = cbLimparCamposClick
      end
      object edCidade: TEdit
        Tag = 1
        Left = 100
        Top = 94
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 0
        OnKeyPress = onKeyPress
        ExplicitLeft = 109
        ExplicitTop = 108
      end
      object edCod: TEdit
        Left = 103
        Top = 54
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 1
        OnExit = edCodExit
        OnKeyPress = onKeyPress
        ExplicitLeft = 110
        ExplicitTop = 63
      end
      object edPais: TEdit
        Tag = 2
        Left = 100
        Top = 138
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
        ExplicitLeft = 109
        ExplicitTop = 158
      end
      object edUF: TEdit
        Tag = 3
        Left = 293
        Top = 138
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 3
        OnKeyPress = edFinalKeyPress
        ExplicitLeft = 310
        ExplicitTop = 158
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 600
    Panels = <
      item
        Text = 'Aguardando'
        Width = 50
      end>
    ExplicitTop = 293
  end
end
