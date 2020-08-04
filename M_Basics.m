
//Power BI - M

//https://docs.microsoft.com/en-us/powerquery-m/m-spec-introduction

//Scripts

//Abre arquivo CSV:
= Csv.Document(File.Contents("C:\Users\Samsung\Documents\Curso PBI Claudio Bonel\BaseDPEvolucaoMensalCisp.csv"),[Delimiter=";", Columns=63, Encoding=1252, QuoteStyle=QuoteStyle.None])

//Serve para transformar string em int
= Table.TransformColumnTypes(#"Renamed Columns",{{"roubo_bicicleta", Int64.Type}, {"posse_drogas", Int64.Type}, {"trafico_drogas", Int64.Type}, {"apreensao_drogas_sem_autor", Int64.Type}, {"apf", Int64.Type}, {"aaapai", Int64.Type}, {"cmp", Int64.Type}, {"cmba", Int64.Type}})

//Determinar o tipo de conteúdo da coluna:
= Table.TransformColumnTypes(Source,{{"Column1", type text}, {"Column2", type text}, {"Column3", type text}, {"Column4", type text})

//Retira linhas de uma tabela:
= Table.Skip(#"Changed Type",5)

//Remoção de linhas nulas:
= Table.SelectRows(#"Remoção do cabeçalho do ERP 15032019", each not List.IsEmpty(List.RemoveMatchingItems(Record.FieldValues(_), {"", null})))

//Primeira linha como cabeçalho:
= Table.PromoteHeaders(#"Removed Blank Rows", [PromoteAllScalars=true])

//Renomear colunas:
= Table.RenameColumns(#"Changed Type1",{{"mcirc", "Cod_Munic_IBGE"}})

/*Rows filtered by Data*/
= Table.SelectRows(#"Changed Type2", each [vano] >= 2015)
