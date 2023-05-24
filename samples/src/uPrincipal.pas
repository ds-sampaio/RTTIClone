unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Utils.ObjectClone;

type
  TProduto = class
  private
    Fid: Integer;
    FNome: String;
  public
    property id: Integer read Fid write Fid;
    property Nome: String read FNome write FNome;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  LProduto1,LProduto2 : TProduto;
begin
  LProduto1 := TProduto.Create;
  LProduto1.Id := 1;
  LProduto1.Nome := 'Daiane';

  LProduto2 := TObjectCloner<TProduto>.Clone(LProduto1);

  ShowMessage(LProduto2.Nome);

end;

end.

