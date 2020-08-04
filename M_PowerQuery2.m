// Extract the first characters (4, in this case)
= Table.AddColumn(#"Filtered Rows", "First Characters", each Text.Start([MesAno], 4), type text)

// Extract content after a delimiter (m in this case)
= Table.AddColumn(#"Changed Type1", "Text After Delimiter", each Text.AfterDelimiter([MesAno], "m"), type text)