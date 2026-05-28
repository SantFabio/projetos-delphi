program estacionamento;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frEstacionamento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrEstacionamento, frEstacionamento);
  Application.Run;
end.
