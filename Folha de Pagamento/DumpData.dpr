program DumpData;
{$APPTYPE CONSOLE}
uses
  SysUtils, Classes, DB, DBClient, uFolhaPagamento in 'uFolhaPagamento.pas';
var
  Form: TfrFolhaPagamento;
begin
  try
    Form := TfrFolhaPagamento.Create(nil);
    try
      Writeln('--- cdsFuncionarios ---');
      Form.cdsFuncionarios.First;
      while not Form.cdsFuncionarios.Eof do
      begin
        Writeln(Format('%d - %s - %s', [
          Form.cdsFuncionarios.FieldByName('bdCODFUNCIONARIO').AsInteger,
          Form.cdsFuncionarios.FieldByName('bdNOME').AsString,
          Form.cdsFuncionarios.FieldByName('bdCARGO').AsString
        ]));
        Form.cdsFuncionarios.Next;
      end;

      Writeln('--- cdsFolhaPagamento ---');
      Form.cdsFolhaPagamento.First;
      while not Form.cdsFolhaPagamento.Eof do
      begin
        Writeln(Format('Folha %d: Func %d - %s - %s - %s/%d', [
          Form.cdsFolhaPagamento.FieldByName('bdCODFOLHA').AsInteger,
          Form.cdsFolhaPagamento.FieldByName('bdCODFUNCIONARIO').AsInteger,
          Form.cdsFolhaPagamento.FieldByName('bdNOMEFUNCIONARIO').AsString,
          Form.cdsFolhaPagamento.FieldByName('bdCARGO').AsString,
          Form.cdsFolhaPagamento.FieldByName('bdMESCOMPETENCIA').AsString,
          Form.cdsFolhaPagamento.FieldByName('bdANOCOMPETENCIA').AsInteger
        ]));
        Form.cdsFolhaPagamento.Next;
      end;
    finally
      Form.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
