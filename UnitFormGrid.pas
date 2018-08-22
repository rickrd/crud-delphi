unit UnitFormGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, UnitLista, UnitFormEstado, UnitFormPais,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.StdCtrls, UnitDados, System.StrUtils;

type
  TFormGrid = class(TForm)
    StringGrid1: TStringGrid;
    ToolBar1: TToolBar;
    btExcluir: TButton;
    btEscolher: TButton;
    edPesquisa: TEdit;
    procedure geraGrid(Lista: TLista; Classe: TClass);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExcluirClick(Sender: TObject);
    procedure btEscolherClick(Sender: TObject);
    procedure edPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    palavra: string;
  public
    { Public declarations }
  end;

var
  FormGrid: TFormGrid;
  FClass: TClass;
  FLista: TLista;
  checkList: boolean;

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
  try
    wObj := FLista.getObjectByIndex(Index);
    FLista.Excluir(Index);
  finally
    Self.Free;
  end;

end;

procedure TFormGrid.edPesquisaChange(Sender: TObject);
var
  wCont: integer;
  wObj: TObject;
  wLista: TLista;
  linha: integer;
begin
  palavra := edPesquisa.Text;
  if palavra <> '' then
     begin
       wLista := TLista.Create;
       for wCont := 0 to FLista.Count-1 do
         begin
           wObj := FLista.getObjectByIndex(wCont);
                if wObj.ClassType = TCidade then
                  begin
                    with wObj as TCidade do
                      begin
                        if ContainsText(wCidade, palavra) then
                           begin
                             wLista.Inserir(wObj, TCidade);
                           end;
                      end;
                  end
                  else
                    if wObj.ClassType = TEstado then
                       begin
                         with wObj as TEstado do
                           begin
                             if ContainsText (wEstado, palavra) then
                                begin
                                  wLista.Inserir(wObj, TEstado);
                                end;
                           end;
                       end
                       else
                         if wObj.ClassType = TPais then
                            begin
                              with wObj as TPais do
                                begin
                                  if ContainsText (wPais, palavra) then
                                     begin
                                       wLista.Inserir(wObj, TPais);
                                     end;
                                end;
                            end;

          end;

       if wLista.Count > 0 then
          begin
            for linha:= 1 to StringGrid1.RowCount -1 do
              begin
                StringGrid1.Rows[linha].Clear; //Cells[coluna,linha]:='';
              end;
            StringGrid1.RowCount := wLista.Count;
            for wCont := 0 to wLista.Count-1 do
              begin
                wObj := wLista.getObjectByIndex(wCont);
                if wObj.ClassType = TCidade then
                  begin
                    with wObj as TCidade do
                      begin
                        StringGrid1.Cells[0, wCont] := inttostr(wCod);
                        StringGrid1.Cells[1, wCont] := wCidade;
                        StringGrid1.Cells[2, wCont] := wPais;
                        StringGrid1.Cells[3, wCont] := wUF;
                      end;
                  end
                  else
                    if wObj.ClassType = TEstado then
                       begin
                         with wObj as TEstado do
                           begin
                             StringGrid1.Cells[0, wCont] := inttostr(wCod);
                             StringGrid1.Cells[1, wCont] := wEstado;
                             StringGrid1.Cells[2, wCont] := wPais;
                             StringGrid1.Cells[3, wCont] := inttostr(wAliquota);
                           end;
                       end
                       else
                         if wObj.ClassType = TPais then
                            begin
                              with wObj as Tpais do
                                begin
                                  StringGrid1.Cells[0, wCont] := inttostr(wCod);
                                  StringGrid1.Cells[1, wCont] := wPais;
                                  StringGrid1.Cells[2, wCont] := wNacionalidade;
                                  StringGrid1.Cells[3, wCont] := inttostr(wCodfed);
                                end;
                            end;
              end;
          end;
     end
     else
       begin
         StringGrid1.RowCount := Flista.Count;
         for wCont := 0 to FLista.Count-1 do
           begin
             wObj := FLista.getObjectByIndex(wCont);
             if wObj.ClassType = TCidade then
                begin
                  with wObj as TCidade do
                    begin
                      StringGrid1.Cells[0, wCont] := inttostr(wCod);
                      StringGrid1.Cells[1, wCont] := wCidade;
                      StringGrid1.Cells[2, wCont] := wPais;
                      StringGrid1.Cells[3, wCont] := wUF;
                    end;
                end
                else
                  if wObj.ClassType = TEstado then
                     begin
                       with wObj as TEstado do
                         begin
                           StringGrid1.Cells[0, wCont] := inttostr(wCod);
                           StringGrid1.Cells[1, wCont] := wEstado;
                           StringGrid1.Cells[2, wCont] := wPais;
                           StringGrid1.Cells[3, wCont] := inttostr(wAliquota);
                         end;
                     end
                     else
                       if wObj.ClassType = TPais then
                          begin
                            with wObj as TPais do
                              begin
                                StringGrid1.Cells[0, wCont] := inttostr(wCod);
                                StringGrid1.Cells[1, wCont] := wPais;
                                StringGrid1.Cells[2, wCont] := wNacionalidade;
                                StringGrid1.Cells[3, wCont] := inttostr(wCodFed);
                              end;
                          end;
           end;
       end;
end;

procedure TFormGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormGrid.FormCreate(Sender: TObject);
begin
  checkList := true;
end;

procedure TFormGrid.geraGrid(Lista: TLista; Classe: TClass);
var
  wCont: integer;
  wObj: TObject;
begin
  if checkList = true then
     begin
       FLista := Lista;
       FClass := Classe;
       checkList := false;
     end;
  StringGrid1.RowCount := Lista.Count;
  for wCont := 0 to Lista.Count-1 do
    begin
      wObj := Lista.getObjectByIndex(wCont);
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
