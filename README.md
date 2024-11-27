# LapshaEffect

[Powered By Lazarus (ObjectPascal)](https://www.lazarus-ide.org/)  

![scr](scr.png)

Powered By Lazarus (ObjectPascal)

Прочие яп в папке "other_langs"  

Также попробуй это:
``` Pascal
procedure TFormMain.PaintBoxPaint(Sender: TObject);
var
  I, J, K: Integer;
  X, Y: Double;
  X1, Y1, X2, Y2: Double;
  Bitmap: TBGRABitmap;
begin
  Bitmap := TBGRABitmap.Create(WindowWidth, WindowHeight);
  try
    Bitmap.Fill($00220011);
    for I := 0 to 9 do
    begin
      for J := 0 to 7 do
      begin
        X := I;
        Y := J;
        for K := 0 to 57 do
        begin
          Y := Y + Cos(X + 3 * Cos(0.124 * Time + X + Y * 0.3) + 0.7 * Sin(3.0 * X + Time) - Time) * 0.1;
          X := X - Sin(Y + Cos(0.232 * Time + X) - 0.7 * Cos(4.0 * Y + Time * 1.323) - Time * 1.323) * 0.1;

          X2 := {%H-}X1;
          Y2 := {%H-}Y1;
          X1 := X * 90.0 - 192.0;
          Y1 := Y * 90.0 - 80.0;

          if K <> 0 then
          begin
            Bitmap.DrawLineAntialias(X1, Y1, X2, Y2, $00FFDDEE, 1.0);
          end;
        end;
      end;
    end;

    Bitmap.Draw(PaintBox.Canvas, 0, 0);
  finally
    Bitmap.Free();
  end;
end;
```
