unit uFrmRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TFrmRelatorio = class(TForm)
    Relatorio: TRLReport;
    RLBand1: TRLBand;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand5: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLBand4: TRLBand;
    lbTotal: TRLLabel;
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private    { Private declarations }
    var
      SomaTotal: Double;
  public    { Public declarations }
    procedure Imprimir;
  end;

var
  FrmRelatorio: TFrmRelatorio;


implementation

uses
  uDMPrincipal;

{$R *.dfm}

{ TFrmRelatorio }

procedure TFrmRelatorio.Imprimir;
begin
  FrmRelatorio := TFrmRelatorio.Create(Application);
  try
    FrmRelatorio.Relatorio.PreviewModal;
  finally
    FrmRelatorio.Free;
  end;
end;

procedure TFrmRelatorio.RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  lbTotal.Caption := 'Total R$: ' + FormatFloat('##,###0.00', SomaTotal);
end;

procedure TFrmRelatorio.RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  SomaTotal := SomaTotal + RLDBText4.DataSet.Fields.FieldByName('Valor').Value;
end;

end.

