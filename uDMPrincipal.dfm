object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 448
  Width = 571
  object FDConexaoSQLite: TFDConnection
    Params.Strings = (
      'Database=C:\Users\User\Documents\ControleAbastecimentos.db'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = FDConexaoSQLiteBeforeConnect
    Left = 64
    Top = 32
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 64
    Top = 96
  end
  object dsTanque: TDataSource
    DataSet = qryTanque
    Left = 72
    Top = 160
  end
  object qryTanque: TFDQuery
    Connection = FDConexaoSQLite
    SQL.Strings = (
      'SELECT * FROM Tanque {IF !Where} WHERE !Where {FI}')
    Left = 136
    Top = 160
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
  end
  object dsBomba: TDataSource
    DataSet = qryBomba
    Left = 72
    Top = 232
  end
  object qryBomba: TFDQuery
    Connection = FDConexaoSQLite
    SQL.Strings = (
      'SELECT '
      '    b.idbomba  '
      '  , b.descricao as des_bomba'
      '  , b.idtanque'
      '  , t.descricao as des_tanque'
      'FROM Bomba as b'
      'inner join tanque as t'
      'on t.idtanque = b.idtanque'
      '{IF !Where} WHERE !Where {FI}')
    Left = 136
    Top = 232
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
  end
  object dsAbastecimento: TDataSource
    DataSet = qryAbastecimento
    Left = 72
    Top = 304
  end
  object qryAbastecimento: TFDQuery
    Connection = FDConexaoSQLite
    SQL.Strings = (
      'select '
      '  a.idabastecimento'
      '  , a.idbomba'
      '  , a.data'
      '  , b.Descricao as bomba'
      '  , t.descricao as tanque'
      '  , a.qtdlitros'
      '  , a.valor'
      '  , a.ImpostoPercentual'
      '  , a.ImpostoValor'
      '  , a.ValorTotal'
      'from abastecimento as a'
      'inner join bomba as b'
      'on b.idBomba = a.idBomba'
      'inner join tanque as t'
      'on t.IdTanque = b.IdTanque'
      '{IF !Where} WHERE !Where {FI}')
    Left = 168
    Top = 296
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qryAbastecimentoQtdLitros: TFMTBCDField
      FieldName = 'QtdLitros'
      Origin = 'QtdLitros'
      DisplayFormat = '##,###0.000'
      Precision = 18
      Size = 3
    end
    object qryAbastecimentoValor: TFMTBCDField
      FieldName = 'Valor'
      Origin = 'Valor'
      DisplayFormat = '##,###0.00'
      Precision = 18
      Size = 2
    end
    object qryAbastecimentoImpostoPercentual: TFMTBCDField
      FieldName = 'ImpostoPercentual'
      Origin = 'ImpostoPercentual'
      DisplayFormat = '##,###0.00'
      Precision = 18
      Size = 2
    end
    object qryAbastecimentoValorTotal: TFMTBCDField
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
      DisplayFormat = '##,###0.00'
      Precision = 18
      Size = 2
    end
    object qryAbastecimentoIdAbastecimento: TFDAutoIncField
      FieldName = 'IdAbastecimento'
      Origin = 'IdAbastecimento'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryAbastecimentoData: TDateTimeField
      DisplayWidth = 50
      FieldName = 'Data'
      Origin = 'Data'
    end
    object qryAbastecimentoIdBomba: TIntegerField
      FieldName = 'IdBomba'
      Origin = 'IdBomba'
    end
    object qryAbastecimentoImpostoValor: TFMTBCDField
      FieldName = 'ImpostoValor'
      Origin = 'ImpostoValor'
      Precision = 18
      Size = 2
    end
    object qryAbastecimentotanque: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tanque'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryAbastecimentobomba: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bomba'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qryRelatorio: TFDQuery
    Connection = FDConexaoSQLite
    SQL.Strings = (
      'select '
      '   a.data'
      '  , a.idBomba'
      '  , b.Descricao as bomba'
      '  , b.idtanque'
      '  , t.descricao as tanque'
      '  , a.valor'
      'from abastecimento as a'
      'inner join bomba as b'
      'on b.idBomba = a.idBomba'
      'inner join tanque as t'
      'on t.IdTanque = b.IdTanque'
      'group by'
      '   a.data'
      '  , a.idBomba'
      '  , b.Descricao'
      '  , b.idtanque'
      '  , t.descricao'
      '  , a.valor'
      'order by '
      'a.data')
    Left = 248
    Top = 304
    object qryRelatorioData: TDateTimeField
      DisplayWidth = 10
      FieldName = 'Data'
      Origin = 'Data'
    end
    object qryRelatorioIdBomba: TIntegerField
      DisplayWidth = 10
      FieldName = 'IdBomba'
      Origin = 'IdBomba'
    end
    object qryRelatoriobomba: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 100
      FieldName = 'bomba'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryRelatorioIdTanque: TIntegerField
      AutoGenerateValue = arDefault
      DisplayWidth = 10
      FieldName = 'IdTanque'
      Origin = 'IdTanque'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelatoriotanque: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 100
      FieldName = 'tanque'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryRelatorioValor: TFMTBCDField
      DisplayWidth = 19
      FieldName = 'Valor'
      Origin = 'Valor'
      DisplayFormat = '##,###0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsRelatorio: TDataSource
    DataSet = qryRelatorio
    Left = 312
    Top = 312
  end
  object qryConsulta: TFDQuery
    Connection = FDConexaoSQLite
    Left = 328
    Top = 112
  end
end
