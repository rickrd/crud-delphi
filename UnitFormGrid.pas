unit UnitFormGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, UnitLista, UnitFormEstado, UnitFormPais,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.StdCtrls, UnitDados;

type
  TFormGrid = class(TForm)
    StringGrid1: TStringGrid;
    ToolBar1: TToolBar;
    btExcluir: TButton;
    btEscolher: TButton;
    procedure geraGrid(wLista: TLista; wClass: TClass);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExcluirClick(Sender: TObject);
    procedure btEscolherClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGrid: TFormGrid;
  FClass: TClass;
  FLista: TLista;

implementation
{$R *.dfm}
uses UnitFormCidade;
procedure TFormGrid.btEscolherClick(Sender: TObject);
var
  wObj: TObject;
  FormCidade: TFormCidade;
begin
try
  if FClass = TCidade then
     Dado1.Dado := StringGrid1.Row;
  if FClass = TEstado then
     Dado2.Dado := StringGrid1.Row;
  if FClass = TPais then
     Dado3.Dado := StringGrid1.Row;
  finally
    Self.Free;
  end;
end;

procedure TFormGrid.btExcluirClick(Sender: TObject);
var
  Index: integer;
  wObj: TObject;
begin
  Index := StringGrid1.Row;
  wObj := FClass.Create;
  try
    wObj := FLista.getObjectByIndex(Index);
    FLista.Excluir(Index);
  finally
    Self.Free;
  end;

end;

procedure TFormGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormGrid.geraGrid(wLista: TLista; wClass: TClass);
var
  wCont: integer;
  wObj: TObject;
begin
  FClass := wClass;
  FLista := wLista;
  wObj := FClass.Create;
  StringGrid1.RowCount := FLista.Count;
  for wCont := 0 to FLista.Count-1 do
    begin
      wObj := FLista.getObjectByIndex(wCont);
      // fazer uma condição para cada tipo de Classe existente
      if  wObj.ClassType = TCidade then
          with wObj as TCidade do
            begin
              StringGrid1.Cells[0, wCont] := inttostr(wCod);
              StringGrid1.Cells[1, wCont] := wCidade;
              StringGrid1.Cells[2, wCont] := wPais;
              StringGrid1.Cells[3, wCont] := wUF;
            end;
    if wObj.ClassType = TEstado then
       with wObj as TEstado do
         begin
           StringGrid1.Cells[0, wCont] := inttostr(wCod);
           StringGrid1.Cells[1, wCont] := wEstado;
           StringGrid1.Cells[2, wCont] := wPais;
           StringGrid1.Cells[3, wCont] := inttostr(wAliquota);
         end;
    if wObj.ClassType = TPais then
       with wObj as TPais do
         begin
           StringGrid1.Cells[0, wCont] := inttostr(wCod);
           StringGrid1.Cells[1, wCont] := wPais;
           StringGrid1.Cells[2, wCont] := wNacionalidade;
           StringGrid1.Cells[3, wCont] := inttostr(wCodFed);
         end;
  end;
end;

end.
