inherited FormEstado: TFormEstado
  Caption = 'Cadastro de estado:'
  ClientHeight = 313
  ClientWidth = 601
  OnCreate = FormCreate
  ExplicitWidth = 617
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 15
  inherited ToolBar1: TToolBar
    Width = 601
    Anchors = []
    ExplicitWidth = 601
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
      Default = False
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
    inherited btContar: TButton
      OnClick = btContarClick
    end
  end
  inherited Panel1: TPanel
    Width = 601
    Height = 265
    ExplicitWidth = 601
    ExplicitHeight = 265
    inherited cbLimparCampos: TCheckBox
      TabOrder = 1
    end
    inherited Panel2: TPanel
      Left = 102
      Top = 6
      TabOrder = 0
      ExplicitLeft = 102
      object Label1: TLabel
        Left = 50
        Top = 65
        Width = 42
        Height = 15
        Anchors = []
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 52
        Top = 108
        Width = 40
        Height = 15
        Anchors = []
        Caption = 'Estado:'
      end
      object Label3: TLabel
        Left = 67
        Top = 153
        Width = 25
        Height = 15
        Anchors = []
        Caption = 'Pa'#237's:'
      end
      object Label4: TLabel
        Left = 266
        Top = 153
        Width = 29
        Height = 15
        Anchors = []
        Caption = 'Al'#237'q.:'
      end
      object edAliquota: TEdit
        Tag = 3
        Left = 306
        Top = 150
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 0
        OnKeyPress = edFinalKeyPress
      end
      object edCod: TEdit
        Left = 110
        Top = 62
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 1
        OnExit = edCodExit
        OnKeyPress = onKeyPress
      end
      object edEstado: TEdit
        Tag = 1
        Left = 110
        Top = 105
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
      end
      object edPais: TEdit
        Tag = 2
        Left = 110
        Top = 150
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 3
        OnKeyPress = onKeyPress
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 294
    Width = 601
    Panels = <
      item
        Text = 'Aguardando'
        Width = 50
      end>
    ExplicitTop = 294
    ExplicitWidth = 601
  end
end
