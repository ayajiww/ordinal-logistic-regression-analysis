# Description: Logistoc Ordinal regression in R
# Author: Randi Wijaya
library(dplyr)
library(tidyr)
library(tidyverse)
library(ggplot2)

# import data
data <- read_excel("Data kecelakaan.xlsx")
View(data)

##VISUALISASI

data %>%
  count(keparahan) %>%
  ggplot(aes(x = keparahan, y = n)) +
  geom_bar(stat = 'identity',fill="orange") +
  geom_text(aes(label=n), vjust=-0.10, color="black", size=5) 


data%>%
  ggplot(aes(x = keparahan , y = Usia)) +
  geom_boxplot(shape=18, color="Green",size=1.5)


# correlation study
library(psych)
pairs.panels(data,
             method = "pearson", # correlation method
             hist.col = "#00AFBB",
             density = TRUE,  # show density plots
             ellipses = TRUE # show correlation ellipses
) # correlated features: tidak ada data yang mengalami multikolinearitas


## Handlin Missing Value  
View(colSums(is.na(data)))

# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

a <- getmode(data$Jenis_Kecelakaan)
data[is.na(data$Jenis_Kecelakaan),'Jenis_Kecelakaan'] <- a

b <- getmode(data$Peran_Korban)
data[is.na(data$Peran_Korban),'Peran_Korban'] <- b 


#c <- getmode(data$Kendaraan_Korban)
data[is.na(data$Kendaraan_Korban),'Kendaraan_Korban'] <- 'PJ'

#d <- getmode(data$Kendaraan_Lawan)
data[is.na(data$Kendaraan_Lawan),'Kendaraan_Lawan'] <- 'PJ'

data[is.na(data$Usia),'Usia'] <- mean(data$Usia,na.rm = TRUE)

View(colSums(is.na(data)))
str(data)

#Encode categorical data
data$keparahan = factor(data$keparahan,
levels = c('LR','LB','MD'),labels = c(1,2,3))

data$Jenis_Kelamin = factor(data$Jenis_Kelamin,
levels = c('Perempuan','Lakilaki'),labels = c(0,1))

data$Jenis_Kecelakaan = factor(data$Jenis_Kecelakaan,
levels = c('TDB','TDD','TDS','PJ'),labels = c(0,1,2,3))

data$Peran_Korban = factor(data$Peran_Korban,
levels = c('Pengemudi','Penumpang','Penyeberang'),labels = c(0,1,2))

data$Kendaraan_Korban = factor(data$Kendaraan_Korban,
levels = c('Roda2_3','Roda4','Roda>4','PJ'),labels = c(1,2,2,3))

data$Kendaraan_Lawan = factor(data$Kendaraan_Lawan,
levels = c('Roda2_3','Roda4','Roda>4','PJ'),labels = c(1,2,2,3))

data$Kendaraan_Korban = as.numeric(data$Kendaraan_Korban)
data$Kendaraan_Lawan = as.numeric(data$Kendaraan_Lawan)
data$Jenis_Tabrakan <- (data$Kendaraan_Korban + data$Kendaraan_Lawan)
data$Jenis_Tabrakan = as.factor(data$Jenis_Tabrakan)
str(data)

drop_column <- c('Kendaraan_Korban',
               'Kendaraan_Lawan')
databaru <- data [,!names(data) %in% drop_column]
View(databaru)



# feature preprocessing
# to ensure we handle categorical features
x <- model.matrix(keparahan ~ ., train)[,-1]
y <-  databaru$keparahan

# Ordinal logistic models
data$keparahan <-as.ordered(databaru$keparahan)
str(databaru)
library(glmnet)
library(MASS)
m <- polr(keparahan ~ Usia + Jenis_Kelamin + Jenis_Kecelakaan + Peran_Korban + Jenis_Tabrakan , data = databaru, Hess=TRUE)
summary(m)

#p-value calculation
(ctable <- coef(summary(m)))
p <- pnorm(abs(ctable[,"t value"]), lower.tail = FALSE) *2 
(ctable <- cbind(ctable, "p value" = p))

##
