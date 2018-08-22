inherited FormCidade: TFormCidade
  Caption = 'Cadastro de cidade:'
  ClientWidth = 600
  OnCreate = FormCreate
  ExplicitWidth = 616
  PixelsPerInch = 96
  TextHeight = 18
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
        Caption = 'Cidade:'
      end
      object Label3: TLabel [2]
        Left = 70
        Top = 120
        Width = 50
        Height = 25
        Alignment = taRightJustify
        Caption = 'Pa'#237's:'
      end
      object Label4: TLabel [3]
        Left = 300
        Top = 120
        Width = 50
        Height = 25
        Alignment = taRightJustify
        Anchors = []
        Caption = 'UF:'
      end
      inherited cbLimparCampos: TCheckBox
        TabOrder = 4
        OnClick = cbLimparCamposClick
      end
      object edCidade: TEdit
        Tag = 1
        Left = 130
        Top = 70
        Width = 150
        Height = 26
        Anchors = []
        TabOrder = 0
        OnKeyPress = onKeyPress
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
      object edPais: TEdit
        Tag = 2
        Left = 130
        Top = 120
        Width = 150
        Height = 26
        Anchors = []
        TabOrder = 2
        OnKeyPress = onKeyPress
      end
      object edUF: TEdit
        Tag = 3
        Left = 360
        Top = 120
        Width = 75
        Height = 26
        Anchors = []
        TabOrder = 3
        OnKeyPress = edFinalKeyPress
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
