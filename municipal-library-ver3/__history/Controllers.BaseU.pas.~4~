unit Controllers.BaseU;

interface

uses
  MVCFramework, MVCFramework.Commons, Controllers.PeopleServiceU,
  MVCFramework.Serializer.Commons, System.Generics.Collections;

type
  TControllerBase = class(TMVCController)
  protected
    procedure OnBeforeAction(AContext: TWebContext;
      const AActionName: string; var AHandled: Boolean); override;
    procedure OnAfterAction(ACOntext: TWebContext;
      const AActionName: string); override;
  end;

implementation

uses
  System.StrUtils, System.SysUtils, MVCFramework.Logger, FireDAC.Comp.Client,
  MVCFramework.ActiveRecord;

procedure TControllerBase.OnBeforeAction(AContext: TWebContext;
  const AActionName: string; var AHandled: Boolean);
var
  lConn: TFDConnection;
begin
  inherited;
  lCOnn := TFDConnection.Create(nil);
  lConn.ConnectionDefName := 'municipal_library';
  ActiveRecordConnectionsRegistry.AddDefaultConnection(lConn, True);
end;

procedure TControllerBase.OnAfterAction(ACOntext: TWebContext;
  const AActionName: string);
begin
  ActiveRecordConnectionsRegistry.RemoveDefaultConnection;
  inherited;
end;

end.

