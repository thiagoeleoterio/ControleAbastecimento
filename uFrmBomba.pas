unit uFrmBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.VirtualImage, Vcl.StdCtrls, Vcl.ExtCtrls, uClasse.Bomba, Vcl.Buttons,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmBomba = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    VirtualImage3: TVirtualImage;
    Panel1: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    edtDescricao: TEdit;
    btnRemoverTanque: TSpeedButton;
    btnAdcionarTanque: TSpeedButton;
    Label2: TLabel;
    qryTanque: TFDQuery;
    dsTanque: TDataSource;
    lkcTanque: TDBLookupComboBox;
    qryTanqueIdTanque: TFDAutoIncField;
    qryTanqueDescricao: TStringField;
    edtCodTanque: TDBText;
    procedure btnRemoverTanqueClick(Sender: TObject);
    procedure btnAdcionarTanqueClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private    { Private declarations }
  public    { Public declarations }
    procedure Abrir(ABomba: TClasseBomba);
  end;

var
  frmBomba: TfrmBomba;


implementation

uses
  uFrmPrincipal, uDMPrincipal;

{$R *.dfm}

{ TfrmTanque }

procedure TfrmBomba.Abrir(ABomba: TClasseBomba);
begin
  frmBomba := TfrmBomba.Create(Application);
  try
    frmBomba.ShowModal;
    ABomba.Descricao := frmBomba.edtDescricao.Text;
    ABomba.IDTanque := frmBomba.edtCodTanque.Field.AsInteger;
  finally
    frmBomba.Free;
  end;
end;

procedure TfrmBomba.btnAdcionarTanqueClick(Sender: TObject);
begin
  if edtDescricao.Text = EmptyStr then
  begin
    MessageDlg('? necess?rio informar a Descri??o!', mtInformation, [mbOk], 0);
    edtDescricao.SetFocus;
    Exit;
  end;

  if lkcTanque.Text = EmptyStr then
  begin
    MessageDlg('? necess?rio informar o Tanque!', mtInformation, [mbOk], 0);
    lkcTanque.SetFocus;
    Exit;
  end;

  Close;
end;

procedure TfrmBomba.btnRemoverTanqueClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBomba.FormShow(Sender: TObject);
begin
  qryTanque.Open;
end;

end.

