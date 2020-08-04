
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

/*Rows filtered by Number*/
= Table.SelectRows(#"Changed Type2", each [vano] >= 2015)

/*Filtered rows by Date*/
= Table.SelectRows(#"Changed Type", each [Data] >= #date(2015, 1, 1))

//Remove one column
= Table.RemoveColumns(#"Filtered Rows",{"Mesorregião Geográfica"})

/* Remove three columns*/
= Table.RemoveColumns(#"Filtered Rows",{"Mesorregião Geográfica", "Microrregião Geográfica", "Município"})

/* Custom Remove columns. I Added the columns I wanted to Remove*/
= Table.RemoveColumns(#"Filtered Rows",{"Mesorregião Geográfica", "Microrregião Geográfica", "Município", "Column10", "Column11", "Column12", "Column13", "Column14", "Column15"})

//With this code, I removed the columns I didn't want with the button "Choose Columns"
= Table.SelectColumns(#"Filtered Rows",{"CISP", "mes_ano", "AISP", "munic", "Cod_Munic_IBGE", "Regiao", "hom_doloso", "lesao_corp_morte", "latrocinio", "hom_por_interv_policial", "tentat_hom", "lesao_corp_dolosa", "estupro", "hom_culposo", "lesao_corp_culposa", "roubo_comercio", "roubo_residencia", "roubo_veiculo", "roubo_carga", "roubo_transeunte", "roubo_em_coletivo", "roubo_banco", "roubo_cx_eletronico", "roubo_celular", "roubo_conducao_saque", "roubo_apos_saque", "roubo_bicicleta", "outros_roubos", "furto_veiculos", "furto_transeunte", "furto_coletivo", "furto_celular", "furto_bicicleta", "outros_furtos", "sequestro", "extorsao", "sequestro_relampago", "estelionato", "apreensao_drogas", "posse_drogas", "trafico_drogas", "apreensao_drogas_sem_autor", "recuperacao_veiculos", "apf", "aaapai", "cmp", "cmba", "ameaca", "pessoas_desaparecidas", "encontro_cadaver", "encontro_ossada", "pol_militares_mortos_serv", "pol_civis_mortos_serv", "fase"})