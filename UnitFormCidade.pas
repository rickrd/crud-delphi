unit UnitFormCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitFormPadrao, Vcl.StdCtrls,
  Vcl.ToolWin, Vcl.ComCtrls, UnitLista, contnrs, Vcl.ExtCtrls, Vcl.Grids, UnitDados,
  Vcl.ExtDlgs;

type
  TFormCidade = class(TFormPadrao)
    edCod: TEdit;
    edCidade: TEdit;
    edUF: TEdit;
    edPais: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure btContarClick(Sender: TObject);
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

  TCidade = class
  private
    wpCod: integer;
    wpCidade: string;
    wpPais: string;
    wpUF: string;
  public
    property wCod: integer read wpCod write wpCod;
    property wCidade: string read wpCidade write wpCidade;
    property wPais: string read wpPais write wpPais;
    property wUF: string read wpUF write wpUF;
  end;

var
  FormCidade: TFormCidade;
  wCidade: TCidade;
  Dado1: TDados;

implementation
{$R *.dfm}

uses UnitFormGrid;


procedure TFormCidade.btAnteriorClick(Sender: TObject);
var
  wObj: TObject;
  wIndex: integer;
  I: Integer;
begin
  inherited;
  if (trystrtoint(edCod.Text, wIndex)) then
     begin
       for I := 0 to wLista.Count-1 do
         begin
           wObj := wLista.getObjectByIndex(I);
           with wObj as TCidade do
             begin
               if wCod = strtoint(edCod.Text) then
                  wIndex := wLista.getIndexOfObj(wObj);
             end;
         end;
       if wIndex-1 >= 0 then
          begin
            wObj := wLista.getObjectByIndex(wIndex-1);
            with wObj as TCidade do
              begin
                edCod.Text := inttostr(wCod);
                edCidade.Text := wCidade;
                edPais.Text := wPais;
                edUF.Text := wUF;
              end;
        end;
     end;
end;

procedure TFormCidade.btProximoClick(Sender: TObject);
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
        with wObj as TCidade do
          if wCod = strtoint(edCod.Text) then
             wIndex := wLista.getIndexOfObj(wObj);
      end;
    if wIndex+1 < wLista.Count then
       begin
        wObj := wLista.getObjectByIndex(wIndex+1);
        with wObj as TCidade do
          begin
            edCod.Text := inttostr(wCod);
            edCidade.Text := wCidade;
            edPais.Text := wPais;
            edUF.Text := wUF;
          end;
       end;
  end;
end;

procedure TFormCidade.cbLimparCamposClick(Sender: TObject);
begin
  inherited;
  if wClear then
     wClear := false
  else
    wClear := true;
end;

procedure TFormCidade.limpaCampos();
begin
  if wClear then
     begin
      edCod.Clear;
      edCidade.Clear;
      edPais.Clear;
      edUF.Clear;
     end;
end;

procedure TFormCidade.edFinalKeyPress(Sender: TObject; var Key: Char);
var
  wObj: TCidade;
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
            wObj := TCidade.Create;
            with wObj do
              begin
                wCod := strtoint(edCod.Text);
                wCidade := edCidade.Text;
                wPais := edPais.Text;
                wUF := edUF.Text;
              end;
            for wCont := 0 to wLista.Count-1 do
              begin
                wObjGet := wLista.getObjectByIndex(wCont);
                with wObjGet as TCidade do
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
               wLista.Inserir(wObj, TCidade);
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
                     with wobjGet as TCidade do
                     begin
                       if wCod > wMaior then
                          wMaior := wCod;
                       wZero := false;
                     end;

                   end;
                 wObj := TCidade.Create;
                 with wObj do
                   begin
                     if wZero then
                        wCod := 0
                     else
                       wCod := wMaior+1;
                     wCidade := edCidade.Text;
                     wPais := edPais.Text;
                     wUF := edUF.Text;
                   end;
                 wLista.Inserir(wObj, TCidade);
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

procedure TFormCidade.edCodExit(Sender: TObject);
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
             with wObj as TCidade do
               if wCod = strtoint(edCod.Text) then
                  begin
                    StatusBar1.Panels[0].Text := 'Alterando registro';
                    edCod.Text := inttostr(wCod);
                    edCidade.Text := wCidade;
                    edPais.Text := wPais;
                    edUF.Text := wUF;
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

procedure TFormCidade.btExportarClick(Sender: TObject);
var
  DadoArmazenado: TDadoArmazenado;
  wDir: string;
begin
  inherited;
  DadoArmazenado := TDadoArmazenado.Create;
  if SaveTextFileDialog1.Execute then
    wDir := SaveTextFileDialog1.FileName;
  DadoArmazenado.saveToFile(wDir, wLista, TCidade);
end;

procedure TFormCidade.btBuscarClick(Sender: TObject);
var
  FormGrid: TFormGrid;
begin
  inherited;
  if wLista.Count > 0 then
     begin
       FormGrid := TFormGrid.Create(FormCidade);
       FormGrid.geraGrid(wLista, TCidade);
       FormGrid.Show;
     end;
end;

procedure TFormCidade.btContarClick(Sender: TObject);
begin
  inherited;
  ShowMessage(inttostr(wLista.Count));
end;

procedure TFormCidade.btExcluirClick(Sender: TObject);
var
  wObj: TObject;
  I: Integer;
begin
  inherited;
  try
    for I := 0 to wLista.Count-1 do
      begin
        wObj := wLista.getObjectByIndex(I);
        with wObj as TCidade do
          if wCod = strtoint(edCod.Text) then
             begin
               wLista.Excluir(I);
               break;
             end;
      end;
  finally
    edCod.Clear;
    edCidade.Clear;
    edPais.Clear;
    edUF.Clear;
  end;
end;

procedure TFormCidade.btImportarClick(Sender: TObject);
var
  DadoArmazenado: TDadoArmazenado;
  wDir: string;
  begin
    inherited;
    DadoArmazenado := TDadoArmazenado.Create;
    if OpenTextFileDialog1.Execute then
       wDir := OpenTextFileDialog1.FileName;
    wLista := DadoArmazenado.loadFromFile(wDir, TCidade);
end;

procedure TFormCidade.btInserirClick(Sender: TObject);
var
  Cidade: TCidade;
  wObj: TObject;
  wIndex: integer;
  I: integer;
  wAux: integer;
begin
  inherited;
  Cidade := TCidade.Create;
  if (trystrtoint(edCod.Text, wIndex)) then
     begin
       with Cidade do
         begin
           wCod := strtoint(edCod.Text);wCidade := edCidade.Text;wPais := edPais.Text;wUF := edUF.Text;
         end;
       if wLista.Count >= 1 then
          begin
            for I := 0 to wLista.Count-1 do
              begin
                wObj := wLista.getObjectByIndex(I);
                with wObj as TCidade do
                  begin
                    if wCod = strtoint(edCod.Text) then
                       begin
                        wAux := 1;
                        wLista.Update(I, Cidade);
                        if wClear then
                           limpaCampos();
                        break;
                       end
                    else
                      wAux := 0;
                  end;
              end;
            if wAux =0 then
               begin
               wLista.Inserir(Cidade, TCidade);
               if wClear then
                  limpaCampos();
               end;

          end
       else
         wLista.Inserir(Cidade, TCidade);
         if wClear then
            limpaCampos();
     end;
end;

procedure TFormCidade.FormActivate(Sender: TObject);
var
  wObj: TObject;
  wCont: Integer;
begin
  inherited;
  if Dado1.Dado > -1 then
     begin
       wObj := wLista.getObjectByIndex(Dado1.Dado);
       with wObj as TCidade do
         begin
           edCod.Text := inttostr(wCod);
           edCidade.Text := wCidade;
           edPais.Text := wPais;
           edUF.Text := wUF;
         end;
     end;
end;

procedure TFormCidade.FormCreate(Sender: TObject);
begin
  inherited;
  wLista := TLista.Create;
  Dado1 := TDados.Create;
  wClear := false;
end;

initialization
  registerclass (TFormCidade);
end.
