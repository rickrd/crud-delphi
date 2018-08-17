unit UnitFormPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitFormPadrao, Vcl.StdCtrls, UnitDados,
  Vcl.ToolWin, Vcl.ComCtrls, UnitLista, System.Contnrs, Vcl.ExtDlgs,
  Vcl.ExtCtrls;

type
  TFormPais = class(TFormPadrao)
    edCod: TEdit;
    edPais: TEdit;
    edNacionalidade: TEdit;
    edCodFed: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure btContarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure edCodExit(Sender: TObject);
    procedure edFinalKeyPress(Sender: TObject; var Key: Char);
    procedure limpaCampos();
    procedure cbLimparCamposClick(Sender: TObject);
  private
    { Private declarations }
    strict private wLista: TLista;
    wClear: boolean;
  public
    { Public declarations }
  end;

  TPais = class
  private
    wpCod: integer;
    wpPais: string;
    wpNacionalidade: string;
    wpCodFed: integer;
  public
    property wCod: integer read wpCod write wpCod;
    property wPais: string read wpPais write wpPais;
    property wNacionalidade: string read wpNacionalidade write wpNacionalidade;
    property wCodFed: integer read wpCodFed write wpCodFed;
  end;

var
  FormPais: TFormPais;
  wPais: TPais;
  Dado3: TDados;

implementation
{$R *.dfm}
uses UnitFormGrid;

procedure TFormPais.limpaCampos();
begin
  if wClear then
    begin
      edCod.Clear;
      edPais.Clear;
      edNacionalidade.Clear;
      edCodFed.Clear;
    end;

end;

procedure TFormPais.edFinalKeyPress(Sender: TObject; var Key: Char);
var
  wObj: TPais;
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
            wObj := TPais.Create;
            with wObj do
              begin
                wCod := strtoint(edCod.Text);
                wPais := edPais.Text;
                wNacionalidade := edNacionalidade.Text;
                wCodFed := strtoint(edCodFed.Text);
              end;
            for wCont := 0 to wLista.Count-1 do
              begin
                wObjGet := wLista.getObjectByIndex(wCont);
                with wObjGet as TPais do
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
                 wLista.Inserir(wObj, TPais);
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
                     with wobjGet as TPais do
                     begin
                       if wCod > wMaior then
                          wMaior := wCod;
                       wZero := false;
                     end;

                   end;
                 wObj := TPais.Create;
                 with wObj do
                   begin
                     if wZero then
                        wCod := 0
                     else
                       wCod := wMaior+1;
                     wPais := edPais.Text;
                     wNacionalidade := edNacionalidade.Text;
                     wCodFed := strtoint(edCodFed.Text);
                   end;
                 wLista.Inserir(wObj, TPais);
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

procedure TFormPais.edCodExit(Sender: TObject);
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
             with wObj as TPais do
               if wCod = strtoint(edCod.Text) then
                  begin
                    StatusBar1.Panels[0].Text := 'Alterando registro';
                    edCod.Text := inttostr(wCod);
                    edPais.Text := wPais;
                    edNacionalidade.Text := wNacionalidade;
                    edCodFed.Text := inttostr(wCodFed);
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

procedure TFormPais.btAnteriorClick(Sender: TObject);
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
           with wObj as TPais do
             begin
               if wCod = strtoint(edCod.Text) then
                  wIndex := wLista.getIndexOfObj(wObj);
              end;
          end;
       if wIndex-1 >= 0 then
          begin
            wObj := wLista.getObjectByIndex(wIndex-1);
              with wObj as TPais do
                begin
                  edCod.Text := inttostr(wCod);
                  edPais.Text := wPais;
                  edNacionalidade.Text := wNacionalidade;
                  edCodFed.Text := inttostr(wCodFed);
                end;
          end;
      end;
end;

procedure TFormPais.btBuscarClick(Sender: TObject);
var
  FormGrid: TFormGrid;
begin
  inherited;
  FormGrid := TFormGrid.Create(nil);
  FormGrid.geraGrid(wLista, TPais);
  FormGrid.Show;
end;

procedure TFormPais.btContarClick(Sender: TObject);
begin
  inherited;
  ShowMessage(inttostr(wLista.Count));
end;

procedure TFormPais.btExcluirClick(Sender: TObject);
var
  wObj: TObject;
  I: integer;
begin
  inherited;
  try
    for I := 0 to wLista.Count-1 do
      begin
        wObj := wLista.getObjectByIndex(I);
        with wObj as TPais do
          if wCod = strtoint(edCod.Text) then
             begin
               wLista.Excluir(I);
               break;
             end;
      end;
  finally
    edCod.Clear;
    edPais.Clear;
    edNacionalidade.Clear;
    edCodFed.Clear;
  end;
end;

procedure TFormPais.btExportarClick(Sender: TObject);
var
  DadoArmazenado: TDadoArmazenado;
  wDir: string;
begin
  inherited;
  DadoArmazenado := TDadoArmazenado.Create;
  if SaveTextFileDialog1.Execute then
    wDir := SaveTextFileDialog1.FileName;
  DadoArmazenado.saveToFile(wDir, wLista, TPais);
end;

procedure TFormPais.btImportarClick(Sender: TObject);
var
  DadoArmazenado: TDadoArmazenado;
  wDir: string;
  begin
    inherited;
    DadoArmazenado := TDadoArmazenado.Create;
    if OpenTextFileDialog1.Execute then
       wDir := OpenTextFileDialog1.FileName;
    wLista := DadoArmazenado.loadFromFile(wDir, TPais);
end;

procedure TFormPais.btInserirClick(Sender: TObject);
var
  Pais: TPais;
  wObj: TObject;
  wIndex: integer;
  I: integer;
  wAux: integer;
begin
  inherited;
  Pais := TPais.Create;
  if (trystrtoint(edCod.Text, wIndex)) then
     begin
       with Pais do
         begin
           wCod := strtoint(edCod.Text);wPais := edPais.Text;wNacionalidade := edNacionalidade.Text;wCodFed := strtoint(edCodFed.Text);
         end;
       if wLista.Count >= 1 then
          begin
            for I := 0 to wLista.Count-1 do
              begin
                wObj := wLista.getObjectByIndex(I);
                  with wObj as TPais do
                    begin
                      if wCod = strtoint(edCod.Text) then
                         begin
                           wAux := 1;
                           wLista.Update(I, Pais);
                           break;
                         end
                      else
                        wAux := 0;
                    end;
              end;
            if wAux =0 then
               wLista.Inserir(Pais, TPais)
          end
       else
         wLista.Inserir(Pais, TPais);
     end;
end;

procedure TFormPais.btProximoClick(Sender: TObject);
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
           with wObj as TPais do
             begin
               if wCod = strtoint(edCod.Text) then
                  wIndex := wLista.getIndexOfObj(wObj);
             end;
          end;
       if wIndex+1 < wLista.Count then
          begin
            wObj := wLista.getObjectByIndex(wIndex+1);
            with wObj as TPais do
              begin
                edCod.Text := inttostr(wCod);
                edPais.Text := wPais;
                edNacionalidade.Text := wNacionalidade;
                edCodFed.Text := inttostr(wCodFed);
              end;
          end;
      end;
end;

procedure TFormPais.cbLimparCamposClick(Sender: TObject);
begin
  inherited;
  if wClear then
     wClear := false
  else
    wClear := true
end;

procedure TFormPais.FormActivate(Sender: TObject);
var
  wObj: TObject;
begin
  inherited;
  if Dado3.Dado > -1 then
     begin
       wObj := TPais.Create;
       wObj := wLista.getObjectByIndex(Dado3.Dado);
       with wObj as TPais do
         begin
           edCod.Text := inttostr(wCod);
           edPais.Text := wPais;
           edNacionalidade.Text := wNacionalidade;
           edCodFed.Text := inttostr(wCodFed);
         end;
     end;
end;

procedure TFormPais.FormCreate(Sender: TObject);
begin
  inherited;
  wLista := TLista.Create;
  Dado3 := TDados.Create;
  wClear := false;
end;

initialization
registerclass(TFormPais);
end.
