object frmTanque: TfrmTanque
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Tanque'
  ClientHeight = 261
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 615
    Height = 67
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    ExplicitLeft = -225
    ExplicitWidth = 888
    object Label1: TLabel
      AlignWithMargins = True
      Left = 108
      Top = 5
      Width = 108
      Height = 45
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Tanque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object VirtualImage3: TVirtualImage
      Left = 0
      Top = 0
      Width = 105
      Height = 67
      Align = alLeft
      ImageCollection = FrmPrincipal.ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 19
      ImageName = 'pressure'
      ExplicitLeft = 24
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 191
    Width = 615
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 1
    ExplicitLeft = 6
    ExplicitTop = 11
    ExplicitWidth = 574
    object btnRemoverTanque: TSpeedButton
      Left = 349
      Top = 14
      Width = 112
      Height = 38
      Hint = 'Remover'
      Caption = 'Cancelar'
      ImageIndex = 14
      ImageName = 'baseline_clear_white'
      Images = FrmPrincipal.VirtualImageList1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnRemoverTanqueClick
    end
    object btnAdcionarTanque: TSpeedButton
      Left = 485
      Top = 14
      Width = 112
      Height = 38
      Hint = 'Adicionar'
      Caption = 'Salvar'
      ImageIndex = 3
      ImageName = 'baseline_add_white'
      Images = FrmPrincipal.VirtualImageList1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnAdcionarTanqueClick
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 76
    Width = 615
    Height = 109
    Align = alClient
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 2
    ExplicitWidth = 605
    object Label3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 90
      Height = 30
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtDescricao: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 46
      Width = 594
      Height = 29
      Margins.Top = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
end
