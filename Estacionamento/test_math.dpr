program test_math;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function TestFunc(wEntrada: Currency; wSaida: Currency; Rate: Currency): Currency;
var
  wMinutosEntrada: Integer;
  wMinutosSaida: Integer;
  wDiferencaMinutos: Integer;
  wHoras: Integer;
  wMinutos: Integer;
  wTempoDoEstacionamento: Currency;
begin
  wMinutosEntrada := (Trunc(wEntrada) * 60) + Round(Frac(wEntrada) * 100);
  wMinutosSaida := (Trunc(wSaida) * 60) + Round(Frac(wSaida) * 100);

  wDiferencaMinutos := wMinutosSaida - wMinutosEntrada;
  if wDiferencaMinutos < 0 then
    wDiferencaMinutos := wDiferencaMinutos + (24 * 60);

  wHoras := wDiferencaMinutos div 60;
  wMinutos := wDiferencaMinutos mod 60;
  wTempoDoEstacionamento := wHoras + (wMinutos / 100);

  Result := Rate * wTempoDoEstacionamento;
end;

procedure RunTest(wEntrada, wSaida, Rate: Currency; Expected: Currency);
var
  Res: Currency;
begin
  Res := TestFunc(wEntrada, wSaida, Rate);
  WriteLn('Entrada: ', CurrToStr(wEntrada), ' Saida: ', CurrToStr(wSaida), ' Rate: ', CurrToStr(Rate));
  WriteLn('Result: ', CurrToStr(Res), ' Expected: ', CurrToStr(Expected));
  if Res = Expected then
    WriteLn('PASS')
  else
    WriteLn('FAIL');
  WriteLn('--------------------');
end;

begin
  try
    // Test 1: 9:50 to 11:20 (1h30m diff = 1.30 simulated, rate 10) -> Expected: 13.00
    // 9:50 = 590 min. 11:20 = 680 min. Diff = 90 min = 1h30m. Simulated duration = 1.30. Rate = 10. Total = 13.00.
    RunTest(9.50, 11.20, 10.0, 13.00);

    // Test 2: 23:30 to 01:15 (next day) (1h45m diff = 1.45 simulated, rate 5) -> Expected: 7.25
    // 23:30 = 1410 min. 01:15 = 75 min. Diff = 75 - 1410 = -1335. + 1440 = 105 min = 1h45m. Simulated duration = 1.45. Rate = 5. Total = 7.25.
    RunTest(23.30, 1.15, 5.0, 7.25);
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
end.
