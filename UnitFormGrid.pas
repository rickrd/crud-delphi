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
    edKeyPress: TEdit;
    StatusBar1: TStatusBar;
    procedure geraGrid(Lista: TLista; Classe: TClass);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExcluirClick(Sender: TObject);
    procedure btEscolherClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure limpaGrid();
  private
    { Private declarations }
    palavra: string;
    palavraPesquisa: string;
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

procedure TFormGrid.limpaGrid;
var
   linha: integer;
begin
  for linha:= 1 to StringGrid1.RowCount -1 do
    begin
      StringGrid1.Rows[linha].Clear; //Cells[coluna,linha]:='';
    end;
end;

procedure TFormGrid.btEscolherClick(Sender: TObject);
var
  wObj: TObject;
  FormCidade: TFormCidade;
  wCod: integer;
begin
try
  if FClass = TCidade then
     begin
       wCod := strtoint(StringGrid1.Cells[0, StringGrid1.Row]);
       Dado1.Dado := FLista.getIndexByCod(wCod);
     end
     else
       if FClass = TEstado then
          begin
            wCod := strtoint(StringGrid1.Cells[0, StringGrid1.Row]);
            Dado2.Dado := FLista.getIndexByCod(wCod);
          end
          else
            if FClass = TPais then
               begin
                 wCod := strtoint(StringGrid1.Cells[0, StringGrid1.Row]);
                 Dado3.Dado := Flista.getIndexByCod(wCod);
               end;
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

procedure TFormGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormGrid.FormCreate(Sender: TObject);
begin
  checkList := true;
end;

procedure TFormGrid.FormKeyPress(Sender: TObject; var Key: Char);
begin
  edKeyPress.Text := Key;
  ShowMessage(key);
  ShowMessage('teste');
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
            end
            else
              if wObj.ClassType = TEstado then
                 with wObj as TEstado do
                   begin
                     StringGrid1.Cells[0, wCont] := inttostr(wCod);
                     StringGrid1.Cells[1, wCont] := wEstado;
                     StringGrid1.Cells[2, wCont] := wPais;
                     StringGrid1.Cells[3, wCont] := inttostr(wAliquota);
                    end
              else
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

procedure TFormGrid.StringGrid1KeyPress(Sender: TObject; var Key: Char);
var
  wObj: TObject;
  wCol: integer;
  wLista: TLista;
  wCont: Integer;
begin
  if ord(Key) = 8 then
     begin
       edKeyPress.Text := '';
       limpaGrid();
       StringGrid1.RowCount := FLista.Count;
       for wCont := 0 to Flista.Count-1 do
         begin
           wObj := FLista.getObjectByIndex(wCont);
           if wObj.ClassType = TCidade then
                with wObj as TCidade do
                  begin
                    StringGrid1.Cells[0, wcont] := inttostr(wCod);
                    StringGrid1.Cells[1, wCont] := wCidade;
                    StringGrid1.Cells[2, wCont] := wPais;
                    StringGrid1.Cells[3, wCont] := wUF;
                  end
              else
                if wObj.ClassType = TEstado then
                     with wObj as TEstado do
                       begin
                         StringGrid1.Cells[0, wcont] := inttostr(wCod);
                         StringGrid1.Cells[1, wCont] := wEstado;
                         StringGrid1.Cells[2, wCont] := wPais;
                         StringGrid1.Cells[3, wCont] := inttostr(wAliquota);
                       end
                   else
                     if wObj.ClassType = TPais then
                          with wObj as TPais do
                            begin
                              StringGrid1.Cells[0, wcont] := inttostr(wCod);
                              StringGrid1.Cells[1, wCont] := wPais;
                              StringGrid1.Cells[2, wCont] := wNacionalidade;
                              StringGrid1.Cells[3, wCont] := inttostr(wCodFed);
                            end;
         end;
     end
     else
       begin
         edKeyPress.Text := edKeyPress.Text + key;
         wCol :=StringGrid1.Col;
         wLista := TLista.Create;
              for wCont := 0 to FLista.Count-1 do
                begin
                  wObj := FLista.getObjectByIndex(wCont);
                  if wObj.ClassType = TCidade then
                     begin
                       with wObj as TCidade do
                         if (wCol = 0) and (ContainsText (inttostr(wCod), edKeyPress.Text)) then
                            wLista.Inserir(wObj, TCidade)
                         else
                           if (wCol = 1) and (ContainsText (wCidade, edKeyPress.Text)) then
                              wLista.Inserir(wObj, TCidade)
                           else
                             if (wCol = 2) and (ContainsText (wPais, edKeyPress.Text)) then
                                   wLista.Inserir(wObj, TCidade)
                             else
                               if (wCol = 3) and (ContainsText (wUF, edKeyPress.Text)) then
                                     wLista.Inserir(wObj, TCidade);
                     end
                     else
                       if wObj.ClassType = TEstado then
                          begin
                            with wObj as TEstado do
                              if (wCol =0) and (ContainsText (inttostr(wCod), edKeypress.Text)) then
                                 wLista.Inserir(wObj, TEstado)
                              else
                                if (wCol =1) and (ContainsText(wEstado, edkeyPress.Text)) then
                                   wLista.Inserir(wObj, TEstado)
                                else
                                  if (wCol =2) and (ContainsText(wPais, edKeyPress.Text)) then
                                     wLista.Inserir(wObj, TEstado)
                                  else
                                    if (wCol =3) and (ContainsText(inttostr(wAliquota), edKeyPress.Text)) then
                                       wLista.Inserir(wObj, TEstado);
                          end
                          else
                            if wObj.ClassType = TPais then
                               begin
                                 with wObj as TPais do
                                   if (wCol =0) and (ContainsText (inttostr(wCod), edKeyPress.Text)) then
                                      wLista.Inserir(wObj, TPais)
                                   else
                                     if (wCol =1) and (ContainsText(wPais, edKeypress.Text)) then
                                        wLista.Inserir(wObj, TPais)
                                     else
                                       if (wCol =2) and (ContainsText(wNacionalidade, edKeyPress.Text)) then
                                          wLista.Inserir(wObj, TPais)
                                       else
                                         if (wCol =3) and (ContainsText(inttostr(wCodFed), edKeyPress.Text)) then
                                            wLista.Inserir(wObj, TPais);
                               end;
                end;
         if wLista.Count > 0 then
            begin
              limpaGrid();
              StringGrid1.RowCount := wLista.Count;
              for wCont := 0 to wLista.Count-1 do
                begin
                  wObj := wLista.getObjectByIndex(wCont);
                  if wObj.ClassType = TCidade then
                     with wObj as TCidade do
                       begin
                         StringGrid1.Cells[0, wCont] := inttostr(wCod);
                         StringGrid1.Cells[1, wCont] := wCidade;
                         StringGrid1.Cells[2, wCont] := wPais;
                         StringGrid1.Cells[3, wCont] := wUF;
                       end
                  else
                    if wObj.ClassType = TEstado then
                       with wObj as TEstado do
                         begin
                           StringGrid1.Cells[0, wCont] := inttostr(wCod);
                           StringGrid1.Cells[1, wCont] := wEstado;
                           StringGrid1.Cells[2, wCont] := wPais;
                           StringGrid1.Cells[3, wCont] := inttostr(wAliquota);
                         end
                    else
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

       end;

end;

end.
