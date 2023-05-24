unit Utils.ObjectClone;

interface

uses
  System.Rtti, System.TypInfo, System.Generics.Collections;

type
  TObjectCloner<T: class, constructor> = class
  public
    class function Clone<T: class, constructor>(const Obj: T): T;
  end;

implementation

{ TObjectCloner<T> }

class function TObjectCloner<T>.Clone<T>(const Obj: T): T;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  CloneObj: T;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(TClass(Obj.ClassType));
    CloneObj := T.Create;

    for RttiProperty in RttiType.GetProperties do
    begin
      if RttiProperty.IsWritable then
        RttiProperty.SetValue(Pointer(CloneObj), RttiProperty.GetValue(Pointer(Obj)));
    end;
  finally
    Result := CloneObj;
    RttiContext.Free;
  end;

end;

end.

