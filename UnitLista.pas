unit UnitLista;

interface

uses Dialogs, Classes, Contnrs, System.Generics.Collections, SysUtils;

type
TLista = class
private
  strict private FListaClass: TClass;
  strict private FLista: TObjectList;
public
  constructor Create;
  procedure Inserir(wObj: TObject; wClass: TClass);
  procedure Update(Index: integer; wObj: TObject);
  procedure Excluir(Index: integer);
  procedure InserirPorIndex(Index: integer; wObj: TObject; wClass: TClass);
  function Count: integer;
  function getObjectByIndex(Index: integer): TObject;
  function getObjectList: TObjectList;
  function getIndexOfObj(wObj: TObject): integer;
  function getIndexByCod(Cod: integer): integer;
end;

implementation
  uses UnitFormCidade, UnitFormEstado, UnitFormPais;
  constructor TLista.Create;
  begin
    FLista := TObjectList.Create;
  end;

  function TLista.getIndexByCod(Cod: Integer): integer;
  var
    wCont: integer;
    wObj: TObject;
  begin
    for wCont := 0 to FLista.Count-1 do
      begin
        wObj := FLista.Items[wCont];
        if wObj.ClassType = TCidade then
           begin
             with wObj as TCidade do
               if wCod = Cod then
                  Result := FLista.IndexOf(wObj);
           end
           else
             if wObj.ClassType = TEstado then
                begin
                  with wObj as TEstado do
                    if wCod = Cod then
                       Result := FLista.IndexOf(wObj);
                end
                else
                  if wObj.ClassType = TPais then
                     begin
                       with wObj as TPais do
                         if wCod = Cod then
                            Result := FLista.IndexOf(wObj);
                     end;
      end;
  end;

  function TLista.getObjectByIndex(Index: Integer): TObject;  // retorna um objeto de acordo com o index passado por parametro
  var
    wObj: TObject;
  begin
    wObj := FListaClass.Create;
    if Index < FLista.Count then
       {if Index <> 0 then}
       wObj := FLista.Items[Index];
       Result := wObj;
  end;

  function TLista.Count: integer;
  begin
    Result := FLista.Count;
  end;

  function TLista.getObjectList: TObjectList;
  begin
    Result := FLista;
  end;

  function TLista.getIndexOfObj(wObj: TObject): integer;
  begin
    Result := FLista.IndexOf(wObj);
  end;

  procedure TLista.Update(Index: integer; wObj: TObject);
  begin
    if FLista.Count > 0 then
       FLista.Delete(Index);
    FLista.Insert(Index, wObj);
  end;

  procedure TLista.Inserir(wObj: TObject; wClass: TClass);
  begin
    FListaClass := wClass;  // guarda o nome da classe pra poder instanciá-la em outras procedures
    FLista.Add(wObj);
  end;

  procedure TLista.InserirPorIndex(Index: integer; wObj: TObject; wClass: TClass);
  begin
    FListaClass := wClass;
    FLista.Insert(Index, wObj);
  end;

  procedure TLista.Excluir(Index: Integer);
  var
  wObj: TObject;
  begin
    wObj := FListaClass.Create;

    if FLista.Count > Index then
       begin
         FLista.Delete(Index);
         ShowMessage('sucesso!');
       end
    else
      ShowMessage('Objeto não encontrado na lista!');
  end;

end.
