unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    FDConnection: TFDConnection;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses MVCFramework.ActiveRecord, EntitiesU;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ActiveRecordConnectionsRegistry.AddDefaultConnection(FDConnection);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ActiveRecordConnectionsRegistry.RemoveDefaultConnection;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  lCustomer: TCustomer;
  lCustId: Integer;
begin
  lCustomer := TCustomer.Create;
  try
    lCustomer.FirstName := 'Jim';
    lCustomer.LastName := 'Cal';
    lCustomer.DateOfBirth := EncodeDate(1998, 09, 27);

    lCustomer.Insert;

    lCustID := lCustomer.ID;
  finally
    lCustomer.Free;
  end;

  lCustomer := TMVCActiveRecord.GetByPK<TCustomer>(lCustID);
  try
    lCustomer.Note := 'Engineer';

    lCustomer.Update;
  finally
    lCustomer.Free;
  end;

// Invalid Record
  lCustomer := TCustomer.Create;
  try
    lCustomer.FirstName := '';
    lCustomer.LastName := 'Gelo';
    lCustomer.DateOfBirth := EncodeDate(1998, 09, 27);

    lCustomer.Insert;

    lCustID := lCustomer.ID;
  finally
    lCustomer.Free;
  end;

end;

end.
