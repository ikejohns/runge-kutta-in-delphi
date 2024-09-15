unit tugas_runge_kutta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, StdCtrls, Buttons, ExtCtrls, TeeProcs, Chart, Math;

type
  TForm1 = class(TForm)
    cht1: TChart;
    btn1: TBitBtn;
    btn_clickProcess: TBitBtn;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    lbledt_freq: TLabeledEdit;
    grp1: TGroupBox;
    lbledt_step_max: TLabeledEdit;
    lbledt_step_size: TLabeledEdit;
    lbledt_x0: TLabeledEdit;
    lbledt_y0: TLabeledEdit;
    btn_inputParameter: TBitBtn;
    procedure btn_clickProcessClick(Sender: TObject);
    procedure eulerMethod();
    procedure midpointMethod();
    procedure heunMethod();
    procedure RKThirdOrderMethod();
    procedure RKFourthOrderMethod();
    procedure RKSixthOrderMethod();
    procedure setValue();
    procedure showValue();
    procedure btn_inputParameterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  freq, x0, y0, step_size : Extended;
  step_max : Integer;

implementation

{$R *.dfm}
function f(t : Extended) : Extended;
begin
  Result := -(Cos(2 * Pi * t * freq))/(2 * PI * freq) + 1 + 1/(2 * Pi * freq);
end;

function first_f(t : Extended; y : Extended) : Extended;
begin
  Result := Sin(2 * Pi * t * freq);
end;

procedure TForm1.setValue;
var
  i: Integer;
  labeledEdit: TLabeledEdit;
  var_name: String;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabeledEdit then
    begin
      labeledEdit := TLabeledEdit(Components[i]);
      if labeledEdit.Text <> '' then
      begin
        var_name := Copy(labeledEdit.Name, 8, Length(labeledEdit.Name) - 7);

        if var_name = 'freq' then
          freq := StrToFloat(labeledEdit.Text)
        else if var_name = 'step_max' then
          step_max := StrToInt(labeledEdit.Text)
        else if var_name = 'step_size' then
          step_size := StrToFloat(labeledEdit.Text)
        else if var_name = 'x0' then
          x0 := StrToFloat(labeledEdit.Text)
        else if var_name = 'y0' then
          y0 := StrToFloat(labeledEdit.Text);
      end;
    end;
  end;
end;

procedure TForm1.showValue;
var
  i: Integer;
  labeledEdit: TLabeledEdit;
  var_name: String;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabeledEdit then
    begin
      labeledEdit := TLabeledEdit(Components[i]);
      var_name := Copy(labeledEdit.Name, 8, Length(labeledEdit.Name) - 7);

      if var_name = 'freq' then
        labeledEdit.Text := FloatToStr(freq)
      else if var_name = 'step_max' then
        labeledEdit.Text := IntToStr(step_max)
      else if var_name = 'step_size' then
        labeledEdit.Text := FloatToStr(step_size)
      else if var_name = 'x0' then
        labeledEdit.Text := FloatToStr(x0)
      else if var_name = 'y0' then
        labeledEdit.Text := FloatToStr(y0);
    end;
  end;
end;

procedure TForm1.eulerMethod();
var
  i : Integer;
  x_before : Extended;
  euler_result : array of Extended;
begin
  Series1.Clear;
  SetLength(euler_result, step_max);
  x_before := x0;
  euler_result[0] := y0;
  Series1.AddXY(x_before, euler_result[0]);

  for i := 1 to step_max - 1 do
    begin
      x_before := x_before + step_size;
      euler_result[i] := euler_result[i-1] + step_size * first_f(x_before, 0.0);
      Series1.AddXY(x_before, euler_result[i]);
    end;
end;

procedure TForm1.midpointMethod();
var
  i: Integer;
  x_before: Extended;
  midpoint_result, half_calc: array of Extended;
begin
  Series4.Clear;
  SetLength(midpoint_result, step_max);
  SetLength(half_calc, step_max);
  x_before := x0;
  midpoint_result[0] := y0;
  Series4.AddXY(x_before, midpoint_result[0]);

  for i := 1 to step_max - 1 do
  begin
    half_calc[i-1] := midpoint_result[i-1] + (step_size / 2) * first_f(x_before, midpoint_result[i-1]);
    x_before := x_before + (step_size/2);
    midpoint_result[i] := midpoint_result[i-1] + step_size * first_f(x_before, half_calc[i-1]);
    x_before := x_before + (step_size/2);
    Series4.AddXY(x_before, midpoint_result[i]);
  end;
end;

procedure TForm1.heunMethod(); // One correction
var
  i: Integer;
  x_before: Extended;
  heun_result, predictor, corrector: array of Extended;
begin
  Series2.Clear;
  SetLength(heun_result, step_max);
  SetLength(predictor, step_max);
  SetLength(corrector, step_max);
  x_before := x0;
  heun_result[0] := y0;
  Series2.AddXY(x_before, heun_result[0]);

  for i := 1 to step_max - 1 do
  begin
    predictor[i-1] := heun_result[i-1] + step_size * first_f(x_before, heun_result[i-1]);
    corrector[i-1] := heun_result[i-1] + (step_size / 2) * (first_f(x_before, heun_result[i-1]) + first_f(x_before + step_size, predictor[i-2]));
    x_before := x_before + step_size;
    heun_result[i] := corrector[i-1];
    Series2.AddXY(x_before, heun_result[i]);
  end;
end;

procedure TForm1.RKThirdOrderMethod();
var
  i: Integer;
  x_before, k1, k2, k3: Extended;
  RK_Result : array of Extended;
begin
  Series5.Clear;
  SetLength(RK_result, step_max);
  x_before := x0;
  RK_result[0] := y0;
  Series5.AddXY(x_before, RK_result[0]);

  for i := 1 to step_max - 1 do
  begin
    k1 := first_f(x_before, RK_result[i-1]);
    k2 := first_f(x_before + (step_size/2), (RK_result[i-1] + 0.5 * k1 * step_size));
    k3 := first_f(x_before + step_size, RK_result[i-1] - k1 * step_size + 2 * k2 * step_size);
    RK_result[i] := RK_result[i-1] + (step_size / 6) * (k1 + 4 * k2 + k3);
    x_before := x_before + step_size;
    Series5.AddXY(x_before, RK_result[i]);
  end;
end;

procedure TForm1.RKFourthOrderMethod();
var
  i: Integer;
  x_before, k1, k2, k3, k4: Extended;
  RK_Result : array of Extended;
begin
  Series6.Clear;
  SetLength(RK_result, step_max);
  x_before := x0;
  RK_result[0] := y0;
  Series6.AddXY(x_before, RK_result[0]);

  for i := 1 to step_max - 1 do
  begin
    k1 := first_f(x_before, RK_result[i-1]);
    k2 := first_f(x_before + step_size/2, (RK_result[i-1] + 0.5 * k1 * step_size));
    k3 := first_f(x_before + step_size/2, (RK_result[i-1] + 0.5 * k2 * step_size));
    k4 := first_f(x_before + step_size, RK_result[i-1] + k3 * step_size);
    RK_result[i] := RK_result[i-1] + (step_size / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
    x_before := x_before + step_size;
    Series6.AddXY(x_before, RK_result[i]);
  end;
end;

procedure TForm1.RKSixthOrderMethod();
var
  i: Integer;
  x_before, k1, k2, k3, k4, k5, k6: Extended;
  RK_Result : array of Extended;
begin
  Series7.Clear;
  SetLength(RK_result, step_max);
  x_before := x0;
  RK_result[0] := y0;
  Series7.AddXY(x_before, RK_result[0]);

  for i := 1 to step_max - 1 do
  begin
    k1 := first_f(x_before, RK_result[i-1]);
    k2 := first_f(x_before + step_size/4, (RK_result[i-1] + 0.25 * k1 * step_size));
    k3 := first_f(x_before + step_size/4, (RK_result[i-1] + (k1 * step_size)/8 + (k2 * step_size)/8));
    k4 := first_f(x_before + step_size/2, RK_result[i-1] - 0.5 * k2 * step_size + k3 * step_size);
    k5 := first_f(x_before + 0.75 * step_size, RK_result[i-1] + (3 * k1 * step_size)/16 + (9 * k4 * step_size)/16);
    k6 := first_f(x_before + step_size, RK_result[i-1] - (3 * k1 * step_size)/7 + (2 * k2 * step_size)/7 + (12 * k3 * step_size)/7 - (12 * k4 * step_size)/7 + (8 * k5 * step_size)/7);
    RK_result[i] := RK_result[i-1] + (step_size / 90) * (7 * k1 + 32 * k3 + 12 * k4 + 32 * k5 + 7 * k6);
    x_before := x_before + step_size;
    Series7.AddXY(x_before, RK_result[i]);
  end;
end;

procedure TForm1.btn_clickProcessClick(Sender: TObject);
var
  i : Integer;
  x : Extended;
begin
  showValue();
  Series8.Clear;
  x := x0;
  for i := 0 to step_max - 1 do
  begin
    Series8.AddXY(x, f(x));
    x := x + step_size;
  end;

  eulerMethod();
  midpointMethod();
  heunMethod();
  RKThirdOrderMethod();
  RKFourthOrderMethod();
  RKSixthOrderMethod();
end;

procedure TForm1.btn_inputParameterClick(Sender: TObject);
begin
  setValue();
  showValue();
end;

begin
 freq := 0.5;
 x0 := 0.0;
 y0 := 1.0;
 step_size := 0.01;
 step_max := 500;
end.
