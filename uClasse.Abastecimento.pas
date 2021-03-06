unit uClasse.Abastecimento;

interface

type
  TClasseAbastecimento = class
  private
    FImpostoValor: Double;
    FValor: Double;
    FIdAbastecimento: Integer;
    FIdBomba: Integer;
    FValorTotal: Double;
    FQtdLitros: Double;
    FData: TDateTime;
    FImpostoPercentual: Double;
    procedure SetData(const Value: TDateTime);
    procedure SetIdAbastecimento(const Value: Integer);
    procedure SetIdBomba(const Value: Integer);
    procedure SetImpostoPercentual(const Value: Double);
    procedure SetImpostoValor(const Value: Double);
    procedure SetQtdLitros(const Value: Double);
    procedure SetValor(const Value: Double);
    procedure SetValorTotal(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;

    property IdAbastecimento: Integer read FIdAbastecimento write SetIdAbastecimento;
    property IdBomba: Integer read FIdBomba write SetIdBomba;
    property Data: TDateTime read FData write SetData;
    property QtdLitros: Double read FQtdLitros write SetQtdLitros;
    property Valor: Double read FValor write SetValor;
    property ImpostoPercentual: Double read FImpostoPercentual write SetImpostoPercentual;
    property ImpostoValor: Double read FImpostoValor write SetImpostoValor;
    property ValorTotal: Double read FValorTotal write SetValorTotal;

    procedure Salvar(ABastecimento: TClasseAbastecimento);
    procedure Excluir(IDAbastecimento: Integer);
    const
      IMPOSTO = 13;

  end;

type
  TClasseAbastecimentoHelper = class helper for TClasseAbastecimento
  public
    function IncidirImposto(APercentual, AValor: Double): Double;
  end;

implementation

uses
  uDMPrincipal;

{ TClasseTanque }

constructor TClasseAbastecimento.Create;
begin

end;

destructor TClasseAbastecimento.Destroy;
begin

  inherited;
end;

procedure TClasseAbastecimento.Excluir(IDAbastecimento: Integer);
begin
  if dmPrincipal.qryAbastecimento.Locate('IDAbastecimento', IDAbastecimento, []) then
  begin
    dmPrincipal.qryAbastecimento.Delete;
    dmPrincipal.qryAbastecimento.Close;
    dmPrincipal.qryAbastecimento.Open;
  end;
end;

procedure TClasseAbastecimento.Salvar(ABastecimento: TClasseAbastecimento);
begin
  dmPrincipal.qryAbastecimento.Append;
  dmPrincipal.qryAbastecimento.FieldByName('Data').Value := ABastecimento.Data;
  dmPrincipal.qryAbastecimento.FieldByName('IDBomba').Value := ABastecimento.IdBomba;
  dmPrincipal.qryAbastecimento.FieldByName('QtdLitros').Value := ABastecimento.QtdLitros;
  dmPrincipal.qryAbastecimento.FieldByName('Valor').Value := ABastecimento.Valor;
  dmPrincipal.qryAbastecimento.FieldByName('ImpostoPercentual').Value := IMPOSTO;
  dmPrincipal.qryAbastecimento.FieldByName('ImpostoValor').Value := ABastecimento.IncidirImposto(IMPOSTO, ABastecimento.Valor) - ABastecimento.Valor;
  dmPrincipal.qryAbastecimento.FieldByName('ValorTotal').Value := ABastecimento.IncidirImposto(IMPOSTO, ABastecimento.Valor);
  dmPrincipal.qryAbastecimento.Post;

  dmPrincipal.qryAbastecimento.Close;
  dmPrincipal.qryAbastecimento.Open;
end;

procedure TClasseAbastecimento.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TClasseAbastecimento.SetIdAbastecimento(const Value: Integer);
begin
  FIdAbastecimento := Value;
end;

procedure TClasseAbastecimento.SetIdBomba(const Value: Integer);
begin
  FIdBomba := Value;
end;

procedure TClasseAbastecimento.SetImpostoPercentual(const Value: Double);
begin
  FImpostoPercentual := Value;
end;

procedure TClasseAbastecimento.SetImpostoValor(const Value: Double);
begin
  FImpostoValor := Value;
end;

procedure TClasseAbastecimento.SetQtdLitros(const Value: Double);
begin
  FQtdLitros := Value;
end;

procedure TClasseAbastecimento.SetValor(const Value: Double);
begin
  FValor := Value;
end;

procedure TClasseAbastecimento.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

{ TClasseAbastecimentoHelper }

function TClasseAbastecimentoHelper.IncidirImposto(APercentual, AValor: Double): Double;
begin
  Result := ((AValor * APercentual) / 100) + AValor
end;

end.

