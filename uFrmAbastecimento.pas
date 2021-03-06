unit uFrmAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.VirtualImage, Vcl.StdCtrls, Vcl.ExtCtrls, uClasse.Abastecimento,
  Vcl.Buttons, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.WinXPickers;

type
  TfrmAbastecimento = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    VirtualImage3: TVirtualImage;
    Panel1: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    btnRemoverTanque: TSpeedButton;
    btnAdcionarTanque: TSpeedButton;
    Label2: TLabel;
    qryBomba: TFDQuery;
    dsBomba: TDataSource;
    lkcBomba: TDBLookupComboBox;
    edtCodTBomba: TDBText;
    edtData: TDatePicker;
    Label4: TLabel;
    Label5: TLabel;
    edtLitros: TEdit;
    edtValor: TEdit;
    procedure btnRemoverTanqueClick(Sender: TObject);
    procedure btnAdcionarTanqueClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtLitrosExit(Sender: TObject);
    procedure edtLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private    { Private declarations }
  public    { Public declarations }
    procedure Abrir(ABastecimento: TClasseAbastecimento);
  end;

var
  frmAbastecimento: TfrmAbastecimento;


implementation

uses
  uFrmPrincipal, uDMPrincipal;

{$R *.dfm}

{ TfrmTanque }

procedure TfrmAbastecimento.Abrir(ABastecimento: TClasseAbastecimento);
begin
  frmAbastecimento := TfrmAbastecimento.Create(Application);
  try
    frmAbastecimento.ShowModal;
    ABastecimento.IdBomba := frmAbastecimento.edtCodTBomba.Field.AsInteger;
    ABastecimento.Data := Trunc(frmAbastecimento.EdtData.Date);
    ABastecimento.QtdLitros := frmAbastecimento.edtLitros.ConverterValorMoeda(frmAbastecimento.edtLitros.Text);
    ABastecimento.Valor := frmAbastecimento.edtValor.ConverterValorMoeda(frmAbastecimento.edtValor.Text);
  finally
    frmAbastecimento.Free;
  end;
end;

procedure TfrmAbastecimento.btnAdcionarTanqueClick(Sender: TObject);
begin
  if lkcBomba.Text = EmptyStr then
  begin
    MessageDlg('? necess?rio informar a Bomba!', mtInformation, [mbOk], 0);
    lkcBomba.SetFocus;
    Exit;
  end;

  if edtLitros.Text = EmptyStr then
  begin
    MessageDlg('? necess?rio informar a Quantidade de Litros!', mtInformation, [mbOk], 0);
    edtLitros.SetFocus;
    Exit;
  end;

  if edtValor.Text = EmptyStr then
  begin
    MessageDlg('? necess?rio informar o Valor!', mtInformation, [mbOk], 0);
    edtValor.SetFocus;
    Exit;
  end;
  Close;
end;

procedure TfrmAbastecimento.btnRemoverTanqueClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbastecimento.edtLitrosExit(Sender: TObject);
begin
  edtLitros.Text := edtLitros.ConverterValorDecimal(edtLitros.Text, 3);
end;

procedure TfrmAbastecimento.edtLitrosKeyPress(Sender: TObject; var Key: Char);
begin
  Key := FrmPrincipal.SomenteNumeros(Key, edtLitros.Text, True);
end;

procedure TfrmAbastecimento.edtValorExit(Sender: TObject);
begin
  edtValor.Text := edtLitros.ConverterValorDecimal(edtValor.Text)
end;

procedure TfrmAbastecimento.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Key := FrmPrincipal.SomenteNumeros(Key, edtValor.Text, True);
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
  qryBomba.Open;
  edtData.Date := Date;
end;

end.

