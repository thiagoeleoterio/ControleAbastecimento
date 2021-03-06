unit uClasse.Tanque;

interface

type
  TClasseTanque = class
  private
    FIdTanque: Integer;
    FDescricao: string;
    procedure SetIdTanque(const Value: Integer);
    procedure SetDescricao(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property IdTanque: Integer read FIdTanque write SetIdTanque;
    property Descricao: string read FDescricao write SetDescricao;
    procedure Salvar(ATanque: TClasseTanque);
    procedure Excluir(IDTanque: Integer);

  end;

implementation

uses
  uDMPrincipal;

{ TClasseTanque }

{ TClasseTanque }

constructor TClasseTanque.Create;
begin

end;

destructor TClasseTanque.Destroy;
begin

  inherited;
end;

procedure TClasseTanque.Excluir(IDTanque: Integer);
begin
  if dmPrincipal.qryTanque.Locate('IDTanque', IDTanque, []) then
  begin
    dmPrincipal.qryTanque.Delete;
    dmPrincipal.qryTanque.Close;
    dmPrincipal.qryTanque.Open;
  end;
end;

procedure TClasseTanque.Salvar(ATanque: TClasseTanque);
begin
  dmPrincipal.qryTanque.Append;
  dmPrincipal.qryTanque.FieldByName('Descricao').Value := ATanque.Descricao;
  dmPrincipal.qryTanque.Post;

  dmPrincipal.qryTanque.Close;
  dmPrincipal.qryTanque.Open;
end;

procedure TClasseTanque.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TClasseTanque.SetIdTanque(const Value: Integer);
begin
  FIdTanque := Value;
end;

end.

