library(sf)
library(openxlsx)

# Defina os caminhos dos arquivos
caminho_arquivo <- "C:/Users/marco/OneDrive/Área de Trabalho/coordenadas/gateados-csv.csv"
caminho_saida <- "C:/Users/marco/OneDrive/Área de Trabalho/coordenadas/harmonizacao.xlsx"

# Leia os dados do arquivo CSV
dados <- read.csv(caminho_arquivo)

# Verifique os primeiros dados para garantir que foram lidos corretamente
head(dados)

# Verifique se há valores não numéricos ou faltantes nas colunas X e Y
dados$X <- as.numeric(as.character(dados$X))
dados$Y <- as.numeric(as.character(dados$Y))

# Remova linhas com valores faltantes em X ou Y
dados <- na.omit(dados)

# Verifique os dados novamente após a limpeza
head(dados)

# Converta os dados para um objeto sf (usando o EPSG:31982 para SIRGAS 2000 UTM 22S)
dados_sf <- st_as_sf(dados, coords = c("X", "Y"), crs = 31982)

# Transforme para WGS 84 (EPSG:4326)
dados_wgs <- st_transform(dados_sf, crs = 4326)

# Extraia as coordenadas em graus decimais
dados_wgs <- cbind(dados, st_coordinates(dados_wgs))

# Renomeie as colunas de saída para algo mais intuitivo
colnames(dados_wgs)[which(colnames(dados_wgs) %in% c("X", "Y"))] <- c("Longitude", "Latitude")

# Salve os dados convertidos em um novo arquivo Excel
write.xlsx(dados_wgs, caminho_saida, rowNames = FALSE)

# Verifique os dados convertidos
head(dados_wgs)
