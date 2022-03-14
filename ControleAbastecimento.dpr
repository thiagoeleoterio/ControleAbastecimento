program ControleAbastecimento;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  uDMPrincipal in 'uDMPrincipal.pas' {dmPrincipal: TDataModule},
  uFrmAbastecimento in 'uFrmAbastecimento.pas' {frmAbastecimento},
  uClasse.Bomba in 'uClasse.Bomba.pas',
  uClasse.Tanque in 'uClasse.Tanque.pas',
  uClasse.Abastecimento in 'uClasse.Abastecimento.pas',
  uFrmBomba in 'uFrmBomba.pas' {frmBomba},
  uFrmRelatorio in 'uFrmRelatorio.pas' {FrmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmAbastecimento, frmAbastecimento);
  Application.CreateForm(TfrmBomba, frmBomba);
  Application.CreateForm(TfrmBomba, frmBomba);
  Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  Application.Run;
end.
