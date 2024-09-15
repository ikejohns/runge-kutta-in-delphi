program tugas_runge_kutta_pr;

uses
  Forms,
  tugas_runge_kutta in 'tugas_runge_kutta.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
