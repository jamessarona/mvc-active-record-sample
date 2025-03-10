unit Controllers.CustomersU;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  System.Generics.Collections, MVCFramework.ActiveRecord;

type
  [MVCPath('/api/customers')]
  TCustomersController = class(TMVCController)
  protected
    procedure OnBeforeAction(AContext: TWebContext; const AActionName: string;
      var AHandled: Boolean); override;
    procedure OnAfterAction(AContext: TWebContext; const AActionName: string); override;
  public
    [MVCPath]
    [MVCDoc('Retrieves all the customers')]
    [MVCHTTPMethods([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomers;
  end;

implementation

uses
  System.StrUtils, System.SysUtils, MVCFramework.Logger, FireDAC.Comp.Client,
  EntitiesU;

procedure TCustomersController.GetCustomers;
begin
  Render<TCustomer>(TMVCActiveRecord.All<TCustomer>);
end;

procedure TCustomersController.OnBeforeAction(AContext: TWebContext;
  const AActionName: string; var AHandled: Boolean);
var
  lConn: TFDConnection;
begin
  inherited;
  lConn := TFDConnection.Create(nil);
  lConn.ConnectionDefName := 'municipal_library';
  ActiveRecordConnectionsRegistry.AddDefaultConnection(lConn, True);
end;

procedure TCustomersController.OnAfterAction(AContext: TWebContext;
  const AActionName: string);
begin
  ActiveRecordConnectionsRegistry.RemoveDefaultConnection;
  inherited;
end;

end.
