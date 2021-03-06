unit uClasse.Bomba;

interface

type
  TClasseBomba = class
  private
    FDescricao: string;
    FIDBomba: Integer;
    FIDTanque: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetIDBomba(const Value: Integer);
    procedure SetIDTanque(const Value: Integer);

  public
    constructor Create;
    destructor Destroy; override;

    property IDBomba: Integer read FIDBomba write SetIDBomba;
    property Descricao: string read FDescricao write SetDescricao;
    property IDTanque: Integer read FIDTanque write SetIDTanque;
    procedure Salvar(ABomba: TClasseBomba);
    procedure Excluir(IDBomba: Integer);

  end;

implementation

uses
  uDMPrincipal;

{ TClasseTanque }

{ TClasseTanque }

constructor TClasseBomba.Create;
begin

end;

destructor TClasseBomba.Destroy;
begin

  inherited;
end;

procedure TClasseBomba.Excluir(IDBomba: Integer);
begin
  if dmPrincipal.qryBomba.Locate('IDBomba', IDBomba, []) then
  begin
    dmPrincipal.qryBomba.Delete;
    dmPrincipal.qryBomba.Close;
    dmPrincipal.qryBomba.Open;
  end;
end;

procedure TClasseBomba.Salvar(ABomba: TClasseBomba);
begin
  dmPrincipal.qryBomba.Append;
  dmPrincipal.qryBomba.FieldByName('Des_Bomba').Value := ABomba.Descricao;
  dmPrincipal.qryBomba.FieldByName('IDTanque').Value := ABomba.IDTanque;
  dmPrincipal.qryBomba.Post;

  dmPrincipal.qryBomba.Close;
  dmPrincipal.qryBomba.Open;
end;

procedure TClasseBomba.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TClasseBomba.SetIDBomba(const Value: Integer);
begin
  FIDBomba := Value;
end;

procedure TClasseBomba.SetIDTanque(const Value: Integer);
begin
  FIDTanque := Value;
end;

end.

