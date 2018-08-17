unit UnitFormSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UnitFormPadrao, UnitFormCidade;

type
  TFormSplash = class(TForm)
    MainMenu1: TMainMenu;
    Cadastrar1: TMenuItem;
    TFormCidade: TMenuItem;
    TFormEstado: TMenuItem;
    TFormPais: TMenuItem;
    procedure mmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.dfm}

procedure TFormSplash.mmClick(Sender: TObject);
var
  wNome: string;
  wForm: TFormClass;
  wF: TForm;
begin
  with Sender as TMenuItem do
    wNome := name;
    wForm := TFormClass(FindClass(wNome));
    wF := wForm.Create(FormSplash);
    wF.Show;
end;

end.
