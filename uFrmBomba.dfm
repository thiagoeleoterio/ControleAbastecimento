object frmBomba: TfrmBomba
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Tanque'
  ClientHeight = 359
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 601
    Height = 67
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 108
      Top = 5
      Width = 107
      Height = 57
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Bomba'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 45
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
      ImageIndex = 17
      ImageName = 'gas-pump'
      ExplicitLeft = 24
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 289
    Width = 601
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 1
    object btnRemoverTanque: TSpeedButton
      Left = 341
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
      Left = 477
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
    Width = 601
    Height = 207
    Align = alClient
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 2
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
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 100
      Width = 67
      Height = 30
      Caption = 'Tanque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtCodTanque: TDBText
      Left = 504
      Top = 144
      Width = 65
      Height = 17
      DataField = 'IdTanque'
      DataSource = dsTanque
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
    object lkcTanque: TDBLookupComboBox
      Left = 3
      Top = 136
      Width = 594
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'IdTanque'
      ListField = 'Descricao'
      ListSource = dsTanque
      ParentFont = False
      TabOrder = 1
    end
  end
  object qryTanque: TFDQuery
    Connection = dmPrincipal.FDConexaoSQLite
    SQL.Strings = (
      'select * from tanque')
    Left = 283
    Top = 172
    object qryTanqueIdTanque: TFDAutoIncField
      FieldName = 'IdTanque'
      Origin = 'IdTanque'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTanqueDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 100
    end
  end
  object dsTanque: TDataSource
    DataSet = qryTanque
    Left = 347
    Top = 188
  end
end
