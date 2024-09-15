object Form1: TForm1
  Left = 522
  Top = 237
  Width = 1044
  Height = 412
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cht1: TChart
    Left = 152
    Top = 8
    Width = 585
    Height = 345
    Legend.CheckBoxes = True
    Title.Text.Strings = (
      'Runge-Kutta')
    View3D = False
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Euler'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Heun'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clAqua
      Title = 'Relston'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'Midpoint'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Title = 'RK Orde 3'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series6: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = 16711808
      Title = 'RK Orde 4'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series7: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clGray
      Title = 'RK Orde 6'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series8: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = 4227327
      Title = 'f(x)'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 345
    Caption = 'Control Panel'
    TabOrder = 1
    object lbledt_freq: TLabeledEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Frequency'
      TabOrder = 0
    end
    object lbledt_step_max: TLabeledEdit
      Left = 8
      Top = 80
      Width = 121
      Height = 21
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'Step Maximum'
      TabOrder = 1
    end
    object lbledt_step_size: TLabeledEdit
      Left = 8
      Top = 120
      Width = 121
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Step Size'
      TabOrder = 2
    end
    object lbledt_x0: TLabeledEdit
      Left = 8
      Top = 160
      Width = 121
      Height = 21
      EditLabel.Width = 87
      EditLabel.Height = 13
      EditLabel.Caption = 'Initial x Value (x0)'
      TabOrder = 3
    end
    object lbledt_y0: TLabeledEdit
      Left = 8
      Top = 200
      Width = 121
      Height = 21
      EditLabel.Width = 87
      EditLabel.Height = 13
      EditLabel.Caption = 'Initial y Value (y0)'
      TabOrder = 4
    end
    object btn_clickProcess: TBitBtn
      Left = 8
      Top = 288
      Width = 121
      Height = 41
      Caption = 'Process'
      TabOrder = 5
      OnClick = btn_clickProcessClick
    end
    object btn_inputParameter: TBitBtn
      Left = 8
      Top = 240
      Width = 121
      Height = 41
      Caption = 'Input'
      TabOrder = 6
      OnClick = btn_inputParameterClick
    end
  end
  object btn1: TBitBtn
    Left = 752
    Top = 304
    Width = 121
    Height = 49
    TabOrder = 2
    Kind = bkClose
  end
end
