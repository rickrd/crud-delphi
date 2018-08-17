unit UnitFormEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitFormPadrao, Vcl.StdCtrls, UnitLista, UnitDados,
  Vcl.ToolWin, Vcl.ComCtrls, System.Contnrs, Vcl.ExtDlgs, Vcl.ExtCtrls;

type
  TFormEstado = class(TFormPadrao)
    edCod: TEdit;
    edEstado: TEdit;
    edPais: TEdit;
    edAliquota: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btInserirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btContarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure edFinalKeyPress(Sender: TObject; var Key: Char);
    procedure limpaCampos();
    procedure edCodExit(Sender: TObject);
    procedure cbLimparCamposClick(Sender: TObject);
  private
    { Private declarations }
    strict private wLista: TLista;
    wClear: boolean;
  public
    { Public declarations }
  end;

  TEstado = class
  private
    wpCod: integer;
    wpEstado: string;
    wpPais: string;
    wpAliquota: integer;
  public
    property wCod: integer read wpCod write wpCod;
    property wEstado: string read wpEstado write wpEstado;
    property wPais: string read wpPais write wpPais;
    property wAliquota: integer read wpAliquota write wpAliquota;
  end;

var
  FormEstado: TFormEstado;
  wEstado: TEstado;
  Dado2: TDados;

implementation
{$R *.dfm}

uses UnitFormGrid;

procedure TFormEstado.edCodExit(Sender: TObject);
var
  wObj: TObject;
  wCont: Integer;
  wIndex: integer;
  wNew: boolean;
begin
  inherited;
  if (trystrtoint(edCod.Text, wIndex)) then
     begin
       wNew := true;
       for wCont := 0 to wLista.Count-1 do
         begin
           wObj := wLista.getObjectByIndex(wCont);
             with wObj as TEstado do
               if wCod = strtoint(edCod.Text) then
                  begin
                    StatusBar1.Panels[0].Text := 'Alterando registro';
                    edCod.Text := inttostr(wCod);
                    edEstado.Text := wEstado;
                    edPais.Text := wPais;
                    edAliquota.Text := inttostr(wAliquota);
                    wNew := false;
                    exit;
                  end;
         end;
       if wNew then
          StatusBar1.Panels[0].Text := 'Novo registro';
     end
     else
       if edCod.Text = '' then
          StatusBar1.Panels[0].Text := 'Novo registro'
     else
       StatusBar1.Panels[0].Text := 'Aguardando';
end;

procedure TFormEstado.limpaCampos;
begin
  if wClear then
    begin
      edCod.Clear;
      edEstado.Clear;
      edPais.Clear;
      edAliquota.Clear;
    end;
end;

procedure TFormEstado.edFinalKeyPress(Sender: TObject; var Key: Char);
var
  wObj: TEstado;
  wObjGet: TObject;
  wcont: Integer;
  wIndex: integer;
  wMaior: integer;
  wNew: boolean;
  wZero: boolean;
begin
  inherited;
  if (ord(key) = 13) or (ord(key) = 9) then
     begin
       wNew := true;
       if (trystrtoint(edCod.Text, windex)) then
          begin
            wObj := TEstado.Create;
            with wObj do
              begin
                wCod := strtoint(edCod.Text);
                wEstado := edEstado.Text;
                wPais := edPais.Text;
                wAliquota := strtoint(edAliquota.Text);
              end;
            for wCont := 0 to wLista.Count-1 do
              begin
                wObjGet := wLista.getObjectByIndex(wCont);
                with wObjGet as TEstado do
                  if wCod = strtoint(edCod.Text) then
                     begin
                       wLista.Update(wCont, wObj);
                       wNew := false;
                       if wClear then
                          limpaCampos();
                       break;
                     end;
              end;
            if wNew = true then
               begin
               wLista.Inserir(wObj, TEstado);
               if wClear then
                  limpaCampos();
               end;

          end
          else
            if edCod.Text = '' then
               begin
                 wZero := true;
                 for wCont := 0 to wLista.Count-1 do
                   begin
                     wObjGet := wLista.getObjectByIndex(wCont);
                     with wobjGet as TEstado do
                     begin
                       if wCod > wMaior then
                          wMaior := wCod;
                       wZero := false;
                     end;

                   end;
                 wObj := TEstado.Create;
                 with wObj do
                   begin
                     if wZero then
                        wCod := 0
                     else
                       wCod := wMaior+1;
                     wEstado := edEstado.Text;
                     wPais := edPais.Text;
                     wAliquota := strtoint(edAliquota.Text);
                   end;
                 wLista.Inserir(wObj, TEstado);
                 if wClear then
                    limpaCampos();
               end;
       // volta pro edit do inicio e altera status bar
       for wCont := 0 to ComponentCount-1 do
         if (Components[wCont].Tag = 0) and (Components[wCont] is TEdit) then
            with Components[wCont] as TEdit do
              begin
                setFocus;
                StatusBar1.Panels[0].Text := 'Aguardando';
              end;
     end;
end;
procedure TFormEstado.btAnteriorClick(Sender: TObject);
var
  wObj: TObject;
  wObj2: TObject;
  wIndex: integer;
  I: Integer;
begin
  inherited;
  if (trystrtoint(edCod.Text, wIndex)) then
     begin
       for I := 1 to wLista.Count-1 do
         begin
           wObj := wLista.getObjectByIndex(I);
           with wObj as TEstado do
             begin
               if wCod = strtoint(edCod.Text) then
                  wIndex := wLista.getIndexOfObj(wObj);
             end;
         end;
       if wIndex-1 >= 0 then
          begin
            wObj := wLista.getObjectByIndex(wIndex-1);
            with wObj as TEstado do
              begin
                edCod.Text := inttostr(wCod);
                edEstado.Text := wEstado;
                edPais.Text := wPais;
                edAliquota.Text := inttostr(wAliquota);
              end;
          end;
     end;
end;

procedure TFormEstado.btBuscarClick(Sender: TObject);
var
  FormGrid: TFormGrid;
begin
  inherited;
  FormGrid := TFormGrid.Create(nil);
  FormGrid.geraGrid(wLista, TEstado);
  FormGrid.Show;
end;

procedure TFormEstado.btContarClick(Sender: TObject);
begin
  inherited;
  ShowMessage(inttostr(wLista.Count));
end;

procedure TFormEstado.btExcluirClick(Sender: TObject);
var
  wObj: TObject;
  I: integer;
begin
  inherited;
  try
    for I := 0 to wLista.Count-1 do
      begin
        wObj := wLista.getObjectByIndex(I);
        with wObj as TEstado do
          if wCod = strtoint(edCod.Text) then
             begin
               wLista.Excluir(I);
               break;
             end;
      end;
  finally
    edCod.Clear;
    edEstado.Clear;
    edPais.Clear;
    edAliquota.Clear;
  end;
end;

procedure TFormEstado.btExportarClick(Sender: TObject);
var
  DadoArmazenado: TDadoArmazenado;
  wDir: string;
begin
  inherited;
  DadoArmazenado := TDadoArmazenado.Create;
  if SaveTextFileDialog1.Execute then
    wDir := SaveTextFileDialog1.FileName;
  DadoArmazenado.saveToFile(wDir, wLista, TEstado);
end;

procedure TFormEstado.btImportarClick(Sender: TObject);
var
  DadoArmazenado: TDadoArmazenado;
  wDir: string;
  begin
    inherited;
    DadoArmazenado := TDadoArmazenado.Create;
    if OpenTextFileDialog1.Execute then
       wDir := OpenTextFileDialog1.FileName;
    wLista := DadoArmazenado.loadFromFile(wDir, TEstado);
end;

procedure TFormEstado.btInserirClick(Sender: TObject);
var
  Estado: TEstado;
  wObj: TObject;
  wIndex: integer;
  I: integer;
  wAux: integer;
begin
  inherited;
  Estado := TEstado.Create;
  if (trystrtoint(edCod.Text, wIndex)) then
     begin
       with Estado do
         begin
           wCod := strtoint(edCod.Text);wEstado := edEstado.Text;wPais := edPais.Text;wAliquota := strtoint(edAliquota.Text);
         end;
       if wLista.Count >= 1 then
          begin
            for I := 0 to wLista.Count-1 do
              begin
                wObj := wLista.getObjectByIndex(I);
                with wObj as TEstado do
                  begin
                  if wCod = strtoint(edCod.Text) then
                     begin
                       wAux := 1;
                       wLista.Update(I, Estado);
                       break;
                     end
                  else
                    wAux := 0;
                  end;
              end;
            if wAux =0 then
               wLista.Inserir(Estado, TEstado)
          end
       else
         wLista.Inserir(Estado, TEstado);
     end;
end;

procedure TFormEstado.btProximoClick(Sender: TObject);
var
  wObj: TObject;
  wIndex: integer;
  I: integer;
begin
  inherited;
  if (trystrtoint(edCod.Text, wIndex)) then
  begin
    for I := 0 to wLista.Count-1 do
      begin
        wObj := wLista.getObjectByIndex(I);
        with wObj as TEstado do
        begin
          if wCod = strtoint(edCod.Text) then
             wIndex := wLista.getIndexOfObj(wObj);
        end;
      end;
      if wIndex+1 < wLista.Count then
         begin
           wObj := wLista.getObjectByIndex(wIndex+1);
           with wObj as TEstado do
             begin
               edCod.Text := inttostr(wCod);
               edEstado.Text := wEstado;
               edPais.Text := wPais;
               edAliquota.Text := inttostr(wAliquota);
             end;
         end;
  end;
end;

procedure TFormEstado.cbLimparCamposClick(Sender: TObject);
begin
  inherited;
  if wClear then
     wClear := false
  else
    wClear := true;

end;

procedure TFormEstado.FormActivate(Sender: TObject);
var
  wObj: TObject;
begin
  inherited;
  if Dado2.Dado > -1 then
     begin
       wObj := TEstado.Create;
       wObj := wLista.getObjectByIndex(Dado2.Dado);
       with wObj as TEstado do
         begin
           edCod.Text := inttostr(wCod);
           edEstado.Text := wEstado;
           edPais.Text := wPais;
           edAliquota.Text := inttostr(wAliquota);
         end;
     end;
end;

procedure TFormEstado.FormCreate(Sender: TObject);
begin
  inherited;
  wLista := TLista.Create;
  Dado2 := TDados.Create;
  wClear := false;
end;

initialization
  registerclass(TFormEstado);
end.
