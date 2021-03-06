unit uFrmTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.VirtualImage, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uClasse.Tanque, Vcl.Buttons;

type
  TfrmTanque = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    VirtualImage3: TVirtualImage;
    Panel1: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    edtDescricao: TEdit;
    btnRemoverTanque: TSpeedButton;
    btnAdcionarTanque: TSpeedButton;
    procedure btnRemoverTanqueClick(Sender: TObject);
    procedure btnAdcionarTanqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Abrir(ATanque: TClasseTanque);
  end;

var
  frmTanque: TfrmTanque;

implementation

uses
  uFrmPrincipal;

{$R *.dfm}

{ TfrmTanque }

procedure TfrmTanque.Abrir(ATanque: TClasseTanque);
begin
  frmTanque := TfrmTanque.Create(Application);
  try
    frmTanque.ShowModal;
    ATanque.Descricao := frmTanque.edtDescricao.Text;
  finally
    frmTanque.Free;
  end;
end;

procedure TfrmTanque.btnAdcionarTanqueClick(Sender: TObject);
begin
  if edtDescricao.Text = EmptyStr then
  begin
    MessageDlg('? necess?rio informar a Descri??o!', mtInformation, [mbOk], 0);
    edtDescricao.SetFocus;
    Exit;
  end;
  Close;
end;

procedure TfrmTanque.btnRemoverTanqueClick(Sender: TObject);
begin
  Close;
end;

end.
