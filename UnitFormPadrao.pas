unit UnitFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ToolWin, Vcl.ComCtrls, UnitLista,
  Vcl.ExtDlgs, Vcl.ExtCtrls;

type
  TFormPadrao = class(TForm)
    ToolBar1: TToolBar;
    btAnterior: TButton;
    btProximo: TButton;
    btBuscar: TButton;
    btInserir: TButton;
    btExcluir: TButton;
    btImportar: TButton;
    btExportar: TButton;
    btContar: TButton;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Panel1: TPanel;
    OpenTextFileDialog1: TOpenTextFileDialog;
    StatusBar1: TStatusBar;
    cbLimparCampos: TCheckBox;
    Panel2: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure onKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPadrao: TFormPadrao;

implementation
{$R *.dfm}

uses UnitFormCidade;

procedure TFormPadrao.FormActivate(Sender: TObject);
var
  wCont: integer;
begin
    for wCont := 0 to ComponentCount-1 do
    if (Components[wCont] is TEdit) and (Components[wCont].Tag = 0) then
       with Components[wCont] as TEdit do
       setFocus;
end;

procedure TFormPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormPadrao.onKeyPress(Sender: TObject; var Key: Char);
var
  wCont: integer;
  wCont2: Integer;
  maior: boolean;
begin
  maior := false;
  if ord(key) = VK_RETURN then
     begin
     for wCont := 0 to ComponentCount-1 do
       if (Components[wCont] = Sender) then
            for wCont2 := 0 to ComponentCount-1 do
              if (Components[wCont2] is TEdit) and (Components[wCont2].Tag = Components[wCont].Tag+1) then
                 with Components[wCont2] as TEdit do
                   begin
                     setFocus;
                     maior := true;
                     break;
                     break;
                   end;
  if maior = false then
     for wCont := 0 to ComponentCount-1 do
         if (Components[wCont].Tag = 0) and (Components[wCont] is TEdit) then
            with Components[wCont] as TEdit do
              setFocus;
     end;
end;

end.
