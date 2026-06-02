program FolhaDePagamento;

uses
  Forms,
  uFolhaPagamento in 'uFolhaPagamento.pas' {frFolhaPagamento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrFolhaPagamento, frFolhaPagamento);
  Application.Run;
end.
