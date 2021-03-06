object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Abastecimentos'
  ClientHeight = 496
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
      Width = 224
      Height = 57
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Abastecimento'
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
      ExplicitLeft = -3
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 426
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
    Height = 344
    Align = alClient
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 2
    object Label3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 44
      Height = 30
      Caption = 'Data'
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
      Top = 84
      Width = 65
      Height = 30
      Caption = 'Bomba'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtCodTBomba: TDBText
      Left = 501
      Top = 132
      Width = 65
      Height = 17
      DataField = 'IdBomba'
      DataSource = dsBomba
      Visible = False
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 164
      Width = 91
      Height = 30
      Caption = 'Qtd Litros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 248
      Width = 76
      Height = 30
      Caption = 'Valor R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lkcBomba: TDBLookupComboBox
      Left = 3
      Top = 120
      Width = 594
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'IdBomba'
      ListField = 'Descricao'
      ListSource = dsBomba
      ParentFont = False
      TabOrder = 0
    end
    object edtData: TDatePicker
      Left = 3
      Top = 39
      Date = 44631.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 3
      TabStop = False
    end
    object edtLitros: TEdit
      Left = 5
      Top = 200
      Width = 592
      Height = 29
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = edtLitrosExit
      OnKeyPress = edtLitrosKeyPress
    end
    object edtValor: TEdit
      Left = 5
      Top = 280
      Width = 592
      Height = 29
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = edtValorExit
      OnKeyPress = edtValorKeyPress
    end
  end
  object qryBomba: TFDQuery
    Connection = dmPrincipal.FDConexaoSQLite
    SQL.Strings = (
      'select * from bomba')
    Left = 299
    Top = 124
  end
  object dsBomba: TDataSource
    DataSet = qryBomba
    Left = 371
    Top = 116
  end
end
