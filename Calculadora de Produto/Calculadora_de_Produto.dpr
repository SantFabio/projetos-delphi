program Calculadora_de_Produto;

uses
  Forms,
  uCalculadoraProdutoBase in 'uCalculadoraProdutoBase.pas' {frCalculoProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrCalculoProduto, frCalculoProduto);
  Application.Run;
end.
