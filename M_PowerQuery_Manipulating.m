let
    Source = Csv.Document(File.Contents("C:\Users\Samsung\Documents\Curso PBI Claudio Bonel\Dim_Periodo.csv"),[Delimiter=";", Columns=2, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"MesAno", type text}, {"Data", type date}}),
    #"Filtered Rows" = Table.SelectRows(#"Changed Type", each [Data] >= #date(2015, 1, 1)),
    #"Inserted First Characters" = Table.AddColumn(#"Filtered Rows", "First Characters", each Text.Start([MesAno], 4), type text),
    #"Changed Type1" = Table.TransformColumnTypes(#"Inserted First Characters",{{"First Characters", Int64.Type}}),
    #"Inserted Text After Delimiter" = Table.AddColumn(#"Changed Type1", "Text After Delimiter", each Text.AfterDelimiter([MesAno], "m"), type text),
    #"Changed Type 2" = Table.TransformColumnTypes(#"Inserted Text After Delimiter",{{"MesAno", type text}, {"Data", type date}, {"Text After Delimiter", Int64.Type}}),
    #"Extracting the m" = Table.AddColumn(#"Changed Type 2", "Cod_Mes", each Text.Middle([MesAno],4 ,3), type text)
in
    #"Extracting the m"