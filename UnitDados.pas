unit UnitDados;

interface

uses System.Classes, System.Contnrs, UnitLista, System.SysUtils, Dialogs;

type
  TDados = class
  constructor Create();

  private

  public
    Dado: integer;
  end;

  TDadoArmazenado = class
  private
    Dados: TStringList;
  public
    constructor Create();
    procedure saveToFile(Arquivo: string; Lista: TLista; Classe: TClass);
    function loadFromFile(Arquivo: string; Classe: TClass): TLista;
    property DadoArmazenado: TStringList read Dados write Dados;
  end;

implementation
  uses UnitFormCidade, UnitFormEstado, unitFormPais;
constructor TDados.Create();
  begin
    Dado := -1;
  end;

constructor TDadoArmazenado.Create;
  begin
    DadoArmazenado := TStringList.Create;
  end;

procedure TDadoArmazenado.saveToFile(Arquivo: string; Lista: TLista; Classe: TClass);
var
  wDiretorio: string;
  wObj: TObject;
  wCont: integer;
  begin
    try
      for wCont := 0 to Lista.Count-1 do
        begin
          wObj := Lista.getObjectByIndex(wCont);
          if Classe = TCidade then
             begin
               with wObj as TCidade do
                 DadoArmazenado.Add(format('%d|%s|%s|%s',[wCod, wCidade, wPais, wUF]));
             end;
          if Classe = TEstado then
             begin
               with wObj as TEstado do
                 DadoArmazenado.Add(format('%d|%s|%s|%d',[wCod, wEstado, wPais, wAliquota]));
             end;
          if Classe = TPais then
             begin
               with wObj as TPais do
               DadoArmazenado.Add(format('%d|%s|%s|%d',[wCod, wPais, wNacionalidade, wCodFed]));
             end;
        end;
    finally
      DadoArmazenado.savetofile(Arquivo);
      ShowMessage('Exportação executada!');
    end;
  end;

function TDadoArmazenado.loadFromFile(Arquivo: string; Classe: TClass): TLista;
var
  wStringList: TStringList;
  wStringAux: TStringList;
  wObj: TObject;
  wCont: Integer;
  FLista: TLista;
  wIndex: integer;
begin
  wStringList := TStringList.Create;
  wStringList.LoadFromFile(Arquivo, TEncoding.UTF8);
  wStringAux := TStringList.Create;
  FLista := TLista.Create;
  try
    for wCont := 0 to wStringList.Count-1 do
      begin
        // condição de acordo com a classe recebida
        wStringAux.Clear;
        wStringAux.Delimiter := '|';
        wStringAux.DelimitedText := wStringList[wCont];
        wStringAux.StrictDelimiter := True;
        if Classe = TCidade then
           begin
             wObj := TCidade.Create;
             with wObj as TCidade do
               begin
                 wCod := strtoint(wStringAux.Strings[0]);
                 wCidade := wStringAux.Strings[1];
                 wPais := wStringAux.Strings[2];
                 wUF := wStringAux.Strings[3];
               end;
             FLista.Inserir(wObj, TCidade);
           end;
        if Classe = TEstado then
           begin
             wObj := TEstado.Create;
             with wObj as TEstado do
               begin
                 wCod := strtoint(wStringAux.Strings[0]);
                 wEstado := wStringAux.Strings[1];
                 wPais := wStringAux.Strings[2];
                 wAliquota := strtoint(wStringAux.Strings[3]);
               end;
               FLista.Inserir(wObj, TEstado);
           end;
        if Classe = TPais then
           begin
             wObj := TPais.Create;
             with wObj as TPais do
               begin
                 wCod := strtoint(wStringAux.Strings[0]);
                 wPais := wStringAux.Strings[1];
                 wNacionalidade := wStringAux.Strings[2];
                 wCodFed := strtoint(wStringAux.Strings[3]);
               end;
             FLista.Inserir(wObj, TPais);
           end;
      end;
  finally
    Result := FLista;
    ShowMessage('Importação executada!');
  end;
end;

end.
