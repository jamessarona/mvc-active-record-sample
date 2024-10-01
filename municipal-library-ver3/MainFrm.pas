unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    FDConnection: TFDConnection;
    btnMultiThreading: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnMultiThreadingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses MVCFramework.ActiveRecord, CustomerU, System.Threading;

{$R *.dfm}

procedure TMainForm.btnMultiThreadingClick(Sender: TObject);
var
  lTasks:TArray<ITask>;
  lProc:TProc;
begin
  lProc := procedure
    var
      lConn: TFDConnection;
      lCustomer: TCustomer;
      I: Integer;
    begin
      lConn := TFDConnection.Create(nil);
      try
        lConn.ConnectionDefName := 'MyConnectionDefName';
        ActiveRecordConnectionsRegistry.AddDefaultConnection(lConn, True);
        lConn.Open;
        lCustomer := TCustomer.Create;
        try
          lCustomer.Code := '3456';
          lCustomer.City := 'Rome';
          lCustomer.CompanyName := 'bit Time Professionals';
          lCustomer.Insert;
        finally
          lCustomer.Free;
        end;
      finally
        ActiveRecordConnectionsRegistry.RemoveDefaultConnection;
      end;
    end;

  lTasks:=[
    TTask.Run(lProc),TTask.Run(lProc),TTask.Run(lProc),
    TTask.Run(lProc),TTask.Run(lProc),TTask.Run(lProc),
    TTask.Run(lProc),TTask.Run(lProc),TTask.Run(lProc),
    TTask.Run(lProc),TTask.Run(lProc),TTask.Run(lProc),
    TTask.Run(lProc),TTask.Run(lProc),TTask.Run(lProc),
    TTask.Run(lProc),TTask.Run(lProc),TTask.Run(lProc)
  ];

  TTask.WaitForAll(lTasks);

  ShowMessage('Done!');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FDConnection.ConnectionDefName := 'MyConnectionDefName';
  ActiveRecordConnectionsRegistry.AddDefaultConnection(FDConnection, True);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ActiveRecordConnectionsRegistry.RemoveDefaultConnection;
end;

end.
