unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.Bind.Controls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.Grids, Vcl.WinXCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Vcl.WinXCalendars, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageXML, Vcl.WinXPanels,
  System.Actions, Vcl.ActnList, Vcl.Themes, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.VirtualImage, System.IOUtils, Vcl.TitleBarCtrls, Vcl.DBGrids, Vcl.DBCtrls;

type
  TFrmPrincipal = class(TForm)
    pnlToolbar: TPanel;
    SplitView: TSplitView;
    NavPanel: TPanel;
    lblTitle: TLabel;
    PageControl: TPageControl;
    TabTanque: TTabSheet;
    TabCalendario: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Image5: TImage;
    CalendarView1: TCalendarView;
    sbTanque: TSearchBox;
    Panel4: TPanel;
    Label3: TLabel;
    TabDashboard: TTabSheet;
    Panel5: TPanel;
    Label4: TLabel;
    FlowPanel1: TFlowPanel;
    RelativePanel1: TRelativePanel;
    Label5: TLabel;
    Label6: TLabel;
    lblAbastecimentos: TLabel;
    RelativePanel2: TRelativePanel;
    Label8: TLabel;
    Label9: TLabel;
    lblTM: TLabel;
    RelativePanel3: TRelativePanel;
    Label11: TLabel;
    Label12: TLabel;
    lblTL: TLabel;
    TabBomba: TTabSheet;
    Panel6: TPanel;
    Label23: TLabel;
    sbBomba: TSearchBox;
    TabAbastecimento: TTabSheet;
    Panel7: TPanel;
    Label24: TLabel;
    sbAbastecimento: TSearchBox;
    TabRelatorio: TTabSheet;
    Panel3: TPanel;
    Label2: TLabel;
    TitleBarPanel1: TTitleBarPanel;
    VCLStylesCB: TComboBox;
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
    TanqueRelativePanel: TRelativePanel;
    AbastecimentoRelativePanel: TRelativePanel;
    BombaRelativePanel: TRelativePanel;
    MarketingRelativePanel: TRelativePanel;
    DashboardButton: TButton;
    btnAbastecimento: TButton;
    btnTanque: TButton;
    btnBomba: TButton;
    btnRelatorio: TButton;
    btnCalendario: TButton;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    VirtualImage6: TVirtualImage;
    MenuVirtualImage: TVirtualImage;
    btnRemoverTanque: TSpeedButton;
    btnAdcionarTanque: TSpeedButton;
    nvgTanque: TDBNavigator;
    gradeTanque: TDBGrid;
    btnRemoverBomba: TSpeedButton;
    btnAdicionarBomba: TSpeedButton;
    gradeBomba: TDBGrid;
    nvgBomba: TDBNavigator;
    btnRemoverAbastecimento: TSpeedButton;
    btnAdicionarAbastecimento: TSpeedButton;
    gradeAbastecimento: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnImprimi: TSpeedButton;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    procedure CalendarView1DrawDayItem(Sender: TObject; DrawParams: TDrawViewInfoParams; CalendarViewViewInfo: TCellItemViewInfo);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VCLStylesCBChange(Sender: TObject);
    procedure TanqueRelativePanelResize(Sender: TObject);
    procedure AbastecimentoRelativePanelResize(Sender: TObject);
    procedure BombaRelativePanelResize(Sender: TObject);
    procedure SplitViewOpening(Sender: TObject);
    procedure SplitViewClosing(Sender: TObject);
    procedure DashboardButtonClick(Sender: TObject);
    procedure MenuVirtualImageClick(Sender: TObject);
    procedure UsernameComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure VCLStylesCBKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdcionarTanqueClick(Sender: TObject);
    procedure TabTanqueShow(Sender: TObject);
    procedure sbTanqueChange(Sender: TObject);
    procedure btnRemoverTanqueClick(Sender: TObject);
    procedure btnAdicionarBombaClick(Sender: TObject);
    procedure btnRemoverBombaClick(Sender: TObject);
    procedure TabBombaShow(Sender: TObject);
    procedure TabAbastecimentoShow(Sender: TObject);
    procedure btnAdicionarAbastecimentoClick(Sender: TObject);
    procedure btnRemoverAbastecimentoClick(Sender: TObject);
    procedure sbAbastecimentoChange(Sender: TObject);
    procedure sbBombaChange(Sender: TObject);
    procedure TabRelatorioShow(Sender: TObject);
    procedure btnImprimiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabDashboardShow(Sender: TObject);
  private    { Private declarations }
    FRanOnce: Boolean;
    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure UpdateNavButtons;
    procedure AutoSizeDBGrid(dbg: TDBGrid);
  public    { Public declarations }
    function SomenteNumeros(Key: Char; Texto: string; EhDecimal: Boolean = False): Char;
  end;

type
  TEditHelper = class helper for TEdit
  public
    function ConverterValorDecimal(ATexto: string; const AQtdCasasDecimnal: Integer = 2): string;
    function ConverterValorMoeda(ATexto: string): Double;
  end;

var
  FrmPrincipal: TFrmPrincipal;


implementation

uses
  uDMPrincipal, uClasse.Tanque, uFrmTanque, uClasse.Bomba, uFrmBomba,
  uClasse.Abastecimento, uFrmAbastecimento, uFrmRelatorio;

{$R *.dfm}

function TFrmPrincipal.SomenteNumeros(Key: Char; Texto: string; EhDecimal: Boolean = False): Char;
var
  SeparadorDecimal: System.SysUtils.TFormatSettings;
begin
  SeparadorDecimal := System.SysUtils.TFormatSettings.Create;
  try
    if not EhDecimal then
    begin
      if not (Key in ['0'..'9', Chr(8)]) then
        Key := #0
    end
    else
    begin
      if Key = #46 then
        Key := SeparadorDecimal.DecimalSeparator;

      if not (Key in ['0'..'9', Chr(8), SeparadorDecimal.DecimalSeparator]) then
        Key := #0
      else if (Key = SeparadorDecimal.DecimalSeparator) and (Pos(Key, Texto) > 0) then
        Key := #0;
    end;
  finally
    Result := Key;
  end;
end;

procedure TFrmPrincipal.CalendarView1DrawDayItem(Sender: TObject; DrawParams: TDrawViewInfoParams; CalendarViewViewInfo: TCellItemViewInfo);
begin
  if DayOfWeek(CalendarViewViewInfo.Date) in [1, 7] then
  begin
    DrawParams.Font.Style := [fsBold];
  end;
end;

procedure TFrmPrincipal.SplitViewClosing(Sender: TObject);
begin
  DashboardButton.Caption := '';
  btnAbastecimento.Caption := '';
  btnTanque.Caption := '';
  btnBomba.Caption := '';
  btnRelatorio.Caption := '';
  btnCalendario.Caption := '';
end;

procedure TFrmPrincipal.SplitViewOpening(Sender: TObject);
begin
  DashboardButton.Caption := '          ' + DashboardButton.Hint;
  btnAbastecimento.Caption := '          ' + btnAbastecimento.Hint;
  btnTanque.Caption := '          ' + btnTanque.Hint;
  btnBomba.Caption := '          ' + btnBomba.Hint;
  btnRelatorio.Caption := '          ' + btnRelatorio.Hint;
  btnCalendario.Caption := '          ' + btnCalendario.Hint;
end;

procedure TFrmPrincipal.UsernameComboBoxKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TFrmPrincipal.VCLStylesCBChange(Sender: TObject);
begin
  TStyleManager.TrySetStyle(VCLStylesCB.Text);
  UpdateNavButtons;
end;

procedure TFrmPrincipal.VCLStylesCBKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TFrmPrincipal.MenuVirtualImageClick(Sender: TObject);
begin
  SplitView.Opened := not SplitView.Opened;
end;

procedure TFrmPrincipal.AbastecimentoRelativePanelResize(Sender: TObject);
begin
  if AbastecimentoRelativePanel.Width <= 634 then
  begin
    btnAdicionarAbastecimento.Caption := '';
    btnAdicionarAbastecimento.Width := 40;
    btnRemoverAbastecimento.Caption := '';
    btnRemoverAbastecimento.Width := 40;
  end
  else
  begin
    btnAdicionarAbastecimento.Caption := btnAdicionarAbastecimento.Hint;
    btnAdicionarAbastecimento.Width := 112;
    btnRemoverAbastecimento.Caption := btnRemoverAbastecimento.Hint;
    btnRemoverAbastecimento.Width := 112;
  end;
end;

procedure TFrmPrincipal.BombaRelativePanelResize(Sender: TObject);
begin
  if BombaRelativePanel.Width <= 781 then
  begin
    btnAdicionarBomba.Caption := '';
    btnAdicionarBomba.Width := 40;
    btnRemoverBomba.Caption := '';
    btnRemoverBomba.Width := 40;
  end
  else
  begin
    btnAdicionarBomba.Caption := btnAdicionarBomba.Hint;
    btnAdicionarBomba.Width := 121;
    btnRemoverBomba.Caption := btnRemoverBomba.Hint;
    btnRemoverBomba.Width := 121;
  end;
end;

procedure TFrmPrincipal.btnAdcionarTanqueClick(Sender: TObject);
var
  lTanque: TClasseTanque;
begin
  lTanque := TClasseTanque.Create;
  try
    frmTanque.Abrir(lTanque);
    if lTanque.Descricao <> EmptyStr then
      lTanque.Salvar(lTanque);
  finally
    FreeAndNil(lTanque);
  end;
end;

procedure TFrmPrincipal.btnAdicionarAbastecimentoClick(Sender: TObject);
var
  lAbastecimento: TClasseAbastecimento;
begin
  lAbastecimento := TClasseAbastecimento.Create;
  try
    FrmAbastecimento.Abrir(lAbastecimento);
    if lAbastecimento.Valor > 0 then
      lAbastecimento.Salvar(lAbastecimento);
  finally
    FreeAndNil(lAbastecimento);
  end;

end;

procedure TFrmPrincipal.btnAdicionarBombaClick(Sender: TObject);
var
  lBomba: TClasseBomba;
begin
  lBomba := TClasseBomba.Create;
  try
    frmBomba.Abrir(lBomba);
    if lBomba.Descricao <> EmptyStr then
      lBomba.Salvar(lBomba);
  finally
    FreeAndNil(lBomba);
  end;
end;

procedure TFrmPrincipal.btnImprimiClick(Sender: TObject);
begin
  FrmRelatorio.Imprimir;
end;

procedure TFrmPrincipal.btnRemoverAbastecimentoClick(Sender: TObject);
var
  lIDAbastecimento: TClasseAbastecimento;
begin
  lIDAbastecimento := TClasseAbastecimento.Create;
  try
    if dmPrincipal.qryAbastecimento.Active and (dmPrincipal.qryAbastecimento.RecordCount > 0) then
      lIDAbastecimento.Excluir(dmPrincipal.qryAbastecimento.FieldByName('IDAbastecimento').Value);
  finally
    lIDAbastecimento.Free;
  end;
end;

procedure TFrmPrincipal.btnRemoverBombaClick(Sender: TObject);
var
  lIDBomba: TClasseBomba;
begin
  lIDBomba := TClasseBomba.Create;
  try
    if dmPrincipal.qryBomba.Active and (dmPrincipal.qryBomba.RecordCount > 0) then
      lIDBomba.Excluir(dmPrincipal.qryBomba.FieldByName('IDBomba').Value);
  finally
    lIDBomba.Free;
  end
end;

procedure TFrmPrincipal.btnRemoverTanqueClick(Sender: TObject);
var
  lIDTanque: TClasseTanque;
begin
  lIDTanque := TClasseTanque.Create;
  try
    if dmPrincipal.qryTanque.Active and (dmPrincipal.qryTanque.RecordCount > 0) then
      lIDTanque.Excluir(dmPrincipal.qryTanque.FieldByName('IDTanque').Value);
  finally
    lIDTanque.Free;
  end;
end;

procedure TFrmPrincipal.DashboardButtonClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := TButton(Sender).Tag;
end;

procedure TFrmPrincipal.TabAbastecimentoShow(Sender: TObject);
begin
  DMPrincipal.qryAbastecimento.Close;
  DMPrincipal.qryAbastecimento.Open;
end;

procedure TFrmPrincipal.TabBombaShow(Sender: TObject);
begin
  dmPrincipal.qryBomba.Close;
  dmPrincipal.qryBomba.Open;
end;

procedure TFrmPrincipal.TabDashboardShow(Sender: TObject);
var
  TA: Integer;
  TM, TL: Double;
begin
  dmPrincipal.Indicadores(TA, TM, TL);
  lblAbastecimentos.Caption := IntToStr(TA);
  lblTM.Caption := FormatFloat('##,###0.00', TM);
  lblTL.Caption := FormatFloat('##,###0.000', TL);
end;

procedure TFrmPrincipal.TabRelatorioShow(Sender: TObject);
begin
  dmPrincipal.QryRelatorio.Close;
  dmPrincipal.QryRelatorio.Open;
end;

procedure TFrmPrincipal.TabTanqueShow(Sender: TObject);
begin
  dmPrincipal.qryTanque.Close;
  dmPrincipal.qryTanque.Open;
end;

procedure TFrmPrincipal.TanqueRelativePanelResize(Sender: TObject);
begin
  if TanqueRelativePanel.Width <= 781 then
  begin
    btnRemoverTanque.Caption := '';
    btnRemoverTanque.Width := 40;
    btnAdcionarTanque.Caption := '';
    btnAdcionarTanque.Width := 40;
  end
  else
  begin
    btnRemoverTanque.Caption := btnRemoverTanque.Hint;
    btnRemoverTanque.Width := 121;
    btnAdcionarTanque.Caption := btnAdcionarTanque.Hint;
    btnAdcionarTanque.Width := 121;
  end;
end;

procedure TFrmPrincipal.sbAbastecimentoChange(Sender: TObject);
begin
  dmPrincipal.PesquisarAbastecimento(sbAbastecimento.Text);
end;

procedure TFrmPrincipal.sbBombaChange(Sender: TObject);
begin
  dmPrincipal.PesquisarBomba(sbBomba.Text);
end;

procedure TFrmPrincipal.sbTanqueChange(Sender: TObject);
begin
  dmPrincipal.PesquisarTanque(sbTanque.Text);
end;

procedure TFrmPrincipal.AppIdle(Sender: TObject; var Done: Boolean);
begin
  if not FRanOnce then
  begin
    FRanOnce := True;

    DashboardButton.SetFocus;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  Application.OnIdle := AppIdle;

  for StyleName in TStyleManager.StyleNames do
    VCLStylesCB.Items.Add(StyleName);

  TStyleManager.TrySetStyle('Carbon');

  VCLStylesCB.ItemIndex := VCLStylesCB.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  UpdateNavButtons;
end;

procedure TFrmPrincipal.UpdateNavButtons;
var
  LStyle: Dword;
begin
  LStyle := GetWindowLong(DashboardButton.Handle, GWL_STYLE);
  SetWindowLong(DashboardButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  DashboardButton.Caption := '          ' + DashboardButton.Hint;
  SetWindowLong(btnAbastecimento.Handle, GWL_STYLE, LStyle or BS_LEFT);
  btnAbastecimento.Caption := '          ' + btnAbastecimento.Hint;
  SetWindowLong(btnTanque.Handle, GWL_STYLE, LStyle or BS_LEFT);
  btnTanque.Caption := '          ' + btnTanque.Hint;
  SetWindowLong(btnBomba.Handle, GWL_STYLE, LStyle or BS_LEFT);
  btnBomba.Caption := '          ' + btnBomba.Hint;
  SetWindowLong(btnRelatorio.Handle, GWL_STYLE, LStyle or BS_LEFT);
  btnRelatorio.Caption := '          ' + btnRelatorio.Hint;
  SetWindowLong(btnCalendario.Handle, GWL_STYLE, LStyle or BS_LEFT);
  btnCalendario.Caption := '          ' + btnCalendario.Hint;
end;

procedure TFrmPrincipal.FormResize(Sender: TObject);
begin
  if FrmPrincipal.Width <= 640 then
  begin
    if SplitView.Opened = True then
      SplitView.Opened := False;
  end
  else
  begin
    if SplitView.Opened = False then
      SplitView.Opened := True;
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
  TA: Integer;
  TM, TL: Double;
begin
  PageControl.ActivePage := TabDashboard;
  dmPrincipal.Indicadores(TA, TM, TL);

  lblAbastecimentos.Caption := IntToStr(TA);
  lblTM.Caption := FormatFloat('##,###0.00', TM);
  lblTL.Caption := FormatFloat('##,###0.000', TL);
end;

{ TEditHelper }

function TEditHelper.ConverterValorDecimal(ATexto: string; const AQtdCasasDecimnal: Integer = 2): string;
var
  TextOnEdit: UnicodeString;
  Mask: string;
  Value: Currency;
  I: Integer;
begin
  TextOnEdit := ATexto;

  for I := 0 to AQtdCasasDecimnal - 1 do
    Mask := Mask + '0';

  if TryStrToCurr(TextOnEdit, Value) then
    Result := FormatFloat('##,###0.' + Mask, Value)
  else
    Result := '';
end;

function TEditHelper.ConverterValorMoeda(ATexto: string): Double;
var
  TextOnEdit: UnicodeString;
  Value: Double;
begin
  TextOnEdit := ATexto;
  TextOnEdit := StringReplace(ATexto, '.', '', [rfReplaceAll]);
  if TryStrToFloat(TextOnEdit, Value) then
    Result := Value
  else
    Result := 0;
end;

procedure TFrmPrincipal.AutoSizeDBGrid(dbg: TDBGrid);
type
  TArray = array of Integer;

  procedure AjustarColumns(Swidth, TSize: Integer; Asize: TArray);
  var
    idx: Integer;
  begin
    if TSize = 0 then
    begin
      TSize := dbg.Columns.count;
      for idx := 0 to dbg.Columns.count - 1 do
        dbg.Columns[idx].Width := (dbg.Width - dbg.Canvas.TextWidth('AAAAAA')) div TSize
    end
    else
      for idx := 0 to dbg.Columns.count - 1 do
        dbg.Columns[idx].Width := dbg.Columns[idx].Width + (Swidth * Asize[idx] div TSize);
  end;

var
  idx, Twidth, TSize, Swidth: Integer;
  AWidth: TArray;
  Asize: TArray;
  NomeColuna: string;
begin
  SetLength(AWidth, dbg.Columns.count);
  SetLength(Asize, dbg.Columns.count);
  Twidth := 0;
  TSize := 0;
  for idx := 0 to dbg.Columns.count - 1 do
  begin
    NomeColuna := dbg.Columns[idx].Title.Caption;
    dbg.Columns[idx].Width := dbg.Canvas.TextWidth(dbg.Columns[idx].Title.Caption + 'A');
    AWidth[idx] := dbg.Columns[idx].Width;
    Twidth := Twidth + AWidth[idx];

    if Assigned(dbg.Columns[idx].Field) then
      Asize[idx] := dbg.Columns[idx].Field.Size
    else
      Asize[idx] := 1;

    TSize := TSize + Asize[idx];
  end;
  if TDBGridOption.dgColLines in dbg.Options then
    Twidth := Twidth + dbg.Columns.count;

  // adiciona a largura da coluna indicada do cursor
  if TDBGridOption.dgIndicator in dbg.Options then
    Twidth := Twidth + IndicatorWidth;

  Swidth := dbg.ClientWidth - Twidth;
  AjustarColumns(Swidth, TSize, Asize);
end;

end.

