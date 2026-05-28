program Cadastro_de_Pessoas;

uses
  Forms,
  uInicio in '..\CalculadoraDeImposto\uInicio.pas' {frInicio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrInicio, frInicio);
  Application.Run;
end.
