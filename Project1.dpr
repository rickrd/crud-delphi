program Project1;

uses
  Vcl.Forms,
  UnitFormSplash in 'UnitFormSplash.pas' {FormSplash},
  UnitLista in 'UnitLista.pas',
  UnitFormPadrao in 'UnitFormPadrao.pas' {FormPadrao},
  UnitFormCidade in 'UnitFormCidade.pas' {FormCidade},
  UnitFormEstado in 'UnitFormEstado.pas' {FormEstado},
  UnitFormPais in 'UnitFormPais.pas' {FormPais},
  UnitFormGrid in 'UnitFormGrid.pas' {FormGrid},
  UnitDados in 'UnitDados.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSplash, FormSplash);
  Application.Run;
end.
