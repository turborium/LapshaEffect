unit UnitMain;

{$mode delphiunicode}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, BGRABitmap, BGRABitmapTypes;

type

  { TFormMain }

  TFormMain = class(TForm)
    PaintBox: TPaintBox;
    Timer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    Time: Double;
  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

const
  WindowWidth = 640;
  WindowHeight = 480;

{ TFormMain }

procedure TFormMain.TimerTimer(Sender: TObject);
begin
  PaintBox.Invalidate();
  Time := Time + 0.0007;
end;

procedure TFormMain.PaintBoxPaint(Sender: TObject);
var
  I, J, K: Integer;
  X, Y: Double;
  X1, Y1, X2, Y2: Double;
  Bitmap: TBGRABitmap;
begin
  Bitmap := TBGRABitmap.Create(WindowWidth, WindowHeight);
  try
    Bitmap.Fill(CSSDarkRed);
    for I := 0 to 9 do
    begin
      for J := 0 to 7 do
      begin
        X := I;
        Y := J;
        for K := 0 to 57 do
        begin
          Y := Y + Cos(X + 0.7 * Sin(3.0 * X + Time) - Time) * 0.1;
          X := X - Sin(Y + 0.7 * Cos(4.0 * Y + Time * 1.323) - Time * 1.323) * 0.1;

          X2 := {%H-}X1;
          Y2 := {%H-}Y1;
          X1 := X * 90.0 - 192.0;
          Y1 := Y * 90.0 - 80.0;

          if K <> 0 then
            Bitmap.DrawLineAntialias(X1, Y1, X2, Y2, CSSOrange, 1.0);
        end;
      end;
    end;

    Bitmap.Draw(PaintBox.Canvas, 0, 0);
  finally
    Bitmap.Free();
  end;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  ClientWidth := WindowWidth;
  ClientHeight := WindowHeight;
end;

end.

