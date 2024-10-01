unit Controllers.AuthorsU;

interface

uses
  MVCFramework, MVCFramework.Commons, Controllers.PeopleServiceU,
  MVCFramework.Serializer.Commons, System.Generics.Collections;

type
  [MVCPath('/api/authors')]
  TAuthorsController = class(TMVCController)
  end;

implementation

uses
  System.StrUtils, System.SysUtils, MVCFramework.Logger;


end.

