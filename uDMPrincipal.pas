unit uDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat, Data.DB, FireDAC.Comp.Client, System.IOUtils,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Data.Bind.Components, Data.Bind.DBScope, System.Math,
  Vcl.Forms;

type
  TdmPrincipal = class(TDataModule)
    FDConexaoSQLite: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    dsTanque: TDataSource;
    qryTanque: TFDQuery;
    dsBomba: TDataSource;
    qryBomba: TFDQuery;
    dsAbastecimento: TDataSource;
    qryAbastecimento: TFDQuery;
    qryAbastecimentoQtdLitros: TFMTBCDField;
    qryAbastecimentoValor: TFMTBCDField;
    qryAbastecimentoImpostoPercentual: TFMTBCDField;
    qryAbastecimentoValorTotal: TFMTBCDField;
    qryAbastecimentoIdAbastecimento: TFDAutoIncField;
    qryAbastecimentoData: TDateTimeField;
    qryAbastecimentoIdBomba: TIntegerField;
    qryAbastecimentoImpostoValor: TFMTBCDField;
    qryAbastecimentotanque: TStringField;
    qryRelatorio: TFDQuery;
    dsRelatorio: TDataSource;
    qryRelatorioData: TDateTimeField;
    qryRelatorioIdBomba: TIntegerField;
    qryRelatoriobomba: TStringField;
    qryRelatorioIdTanque: TIntegerField;
    qryRelatoriotanque: TStringField;
    qryRelatorioValor: TFMTBCDField;
    qryConsulta: TFDQuery;
    qryAbastecimentobomba: TStringField;
    procedure FDConexaoSQLiteBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private    { Private declarations }
    procedure PesquisarQuery(const ASQL: string; AQuery: TFDQuery);
  public    { Public declarations }
    procedure PesquisarTanque(const APesquisa: string);
    procedure PesquisarAbastecimento(const APesquisa: string);
    procedure PesquisarBomba(const APesquisa: string);
    procedure Indicadores(var TotalAbastecimentos: Integer; var TicketMedio, TotalLitros: Double);
  end;

var
  dmPrincipal: TdmPrincipal;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  FDConexaoSQLite.Connected := True;
end;

procedure TdmPrincipal.FDConexaoSQLiteBeforeConnect(Sender: TObject);
begin
  TFDConnection(Sender).Params.Database := TPath.Combine(ExtractFilePath(Application.ExeName), 'ControleAbastecimentos.db');
  TFDConnection(Sender).DriverName := 'SQLite';
end;

procedure TdmPrincipal.Indicadores(var TotalAbastecimentos: Integer; var TicketMedio, TotalLitros: Double);
begin
  qryConsulta.Close;
  qryConsulta.SQL.Clear;
  qryConsulta.SQL.Add('select count(IdAbastecimento) as total from abastecimento');
  qryConsulta.Open;
  if qryConsulta.IsEmpty then
    TotalAbastecimentos := 0
  else
    TotalAbastecimentos := qryConsulta.FieldByName('total').Value;

  qryConsulta.Close;
  qryConsulta.SQL.Clear;
  qryConsulta.SQL.Add('select (sum(valor) / sum(IdAbastecimento)) as total from abastecimento');
  qryConsulta.Open;
  if qryConsulta.IsEmpty then
    TicketMedio := 0
  else
    TicketMedio := qryConsulta.FieldByName('total').Value;

  qryConsulta.Close;
  qryConsulta.SQL.Clear;
  qryConsulta.SQL.Add('select sum(QtdLitros) as total from abastecimento');
  qryConsulta.Open;
  if qryConsulta.IsEmpty then
    TotalLitros := 0
  else
    TotalLitros := qryConsulta.FieldByName('total').Value;
end;

procedure TdmPrincipal.PesquisarTanque(const APesquisa: string);
begin
  PesquisarQuery('UPPER(Descricao) LIKE ''%' + UpperCase(APesquisa) + '%''', qryTanque);
end;

procedure TdmPrincipal.PesquisarQuery(const ASQL: string; AQuery: TFDQuery);
begin
  AQuery.Close;
  AQuery.MacroByName('Where').AsRaw := ASQL;
  AQuery.Open;
end;

procedure TdmPrincipal.PesquisarAbastecimento(const APesquisa: string);
begin
  PesquisarQuery('UPPER(bomba) LIKE ''%' + UpperCase(APesquisa) + '%''', qryAbastecimento);
end;

procedure TdmPrincipal.PesquisarBomba(const APesquisa: string);
begin
  PesquisarQuery('UPPER(des_bomba) LIKE ''%' + UpperCase(APesquisa) + '%''', qryBomba);
end;

end.

