program Calculadora;

uses
  Forms,
  UCalculadora in 'UCalculadora.pas' {FrCalculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrCalculadora, FrCalculadora);
  Application.Run;
end.
