program MvcActiveRecord;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {Form1},
  EntitiesU in 'EntitiesU.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
