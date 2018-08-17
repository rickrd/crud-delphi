inherited FormCidade: TFormCidade
  Caption = 'Cadastro de cidade:'
  ClientHeight = 312
  OnCreate = FormCreate
  ExplicitHeight = 351
  PixelsPerInch = 96
  TextHeight = 15
  inherited ToolBar1: TToolBar
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
    Height = 264
    ExplicitHeight = 264
    inherited cbLimparCampos: TCheckBox
      TabOrder = 1
    end
    inherited Panel2: TPanel
      Top = 6
      TabOrder = 0
      ExplicitLeft = 98
      object Label1: TLabel
        Left = 52
        Top = 66
        Width = 42
        Height = 15
        Anchors = []
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 54
        Top = 111
        Width = 40
        Height = 15
        Anchors = []
        Caption = 'Cidade:'
      end
      object Label3: TLabel
        Left = 69
        Top = 161
        Width = 25
        Height = 15
        Anchors = []
        Caption = 'Pa'#237's:'
      end
      object Label4: TLabel
        Left = 277
        Top = 161
        Width = 19
        Height = 15
        Anchors = []
        Caption = 'UF:'
      end
      object edCidade: TEdit
        Tag = 1
        Left = 109
        Top = 108
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 0
        OnKeyPress = onKeyPress
      end
      object edCod: TEdit
        Left = 110
        Top = 63
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 1
        OnExit = edCodExit
        OnKeyPress = onKeyPress
      end
      object edPais: TEdit
        Tag = 2
        Left = 109
        Top = 158
        Width = 150
        Height = 23
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
      end
      object edUF: TEdit
        Tag = 3
        Left = 310
        Top = 158
        Width = 75
        Height = 23
        Anchors = []
        TabOrder = 3
        OnKeyPress = edFinalKeyPress
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 293
    Panels = <
      item
        Text = 'Aguardando'
        Width = 50
      end>
    ExplicitTop = 293
  end
end
