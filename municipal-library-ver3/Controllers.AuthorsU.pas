unit Controllers.AuthorsU;

interface

uses
  MVCFramework, MVCFramework.Commons, Controllers.PeopleServiceU,
  MVCFramework.Serializer.Commons, System.Generics.Collections,
  Controllers.BaseU;

type
  [MVCPath('/api/authors')]
  TAuthorsController = class(TControllerBase)
  end;

implementation

uses
  System.StrUtils, System.SysUtils, MVCFramework.Logger;


end.

