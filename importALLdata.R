library(data.table)
library(zoo)
library(plyr)
library(scales)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(plotly)
library(pracma)
library(Hmisc)
library(rpart)
library(survminer)
library(knitr)
library(grid)
library(stringr)
library(ggrepel)
library(ggjoy)
library(RColorBrewer)
library(stringdist)
library(ape)
library(dendextend)
library(reshape2)
library(gplots)
library(ineq)
library(vegan)
library(ggridges)





# Read in final cdr3 files
CD4CDR3Files <- list.files(path = "CD4/", pattern="\\.cdr3", full.names=T, recursive=FALSE)
CD8CDR3Files <- list.files(path = "CD8/", pattern="\\.cdr3", full.names=T, recursive=FALSE)
CD8CDR3Files
CD4CDR3Files
if (length(CD8CDR3Files)>0){
  
  cdr3Dat <- data.frame(character(), character(), character(), character(), character(), character())
  
  for (file in CD8CDR3Files){
    fileName <- strsplit(file, split='/')[[1]]
    fileName <- fileName[length(fileName)]
    fileName <- strsplit(fileName, split='[.]')[[1]][1]
    sampleID <- strsplit(fileName, split='_')[[1]][3]
    chain <- strsplit(fileName, split='-')[[1]][2]
    ID <- strsplit(sampleID, split='-')[[1]][1]
    week <- unlist(strsplit(gsub("[^0-9]", "", unlist(ID)), ""))
    week <- as.numeric(paste(week, collapse = ''))
    ID = gsub("[[:digit:]]", "", ID)
    
    # Read in cdr3 file
    cdr3DatTemp <- read.csv(file,header=F, stringsAsFactors=F)
    cdr3DatTemp$ID <- ID
    cdr3DatTemp$week <- week
    cdr3DatTemp$chain <- chain
    cdr3DatTemp$sampleID <- sampleID
    cdr3Dat <- rbind(cdr3Dat,cdr3DatTemp)
    
  }
  

  # Expand the CDR3 dataset by the frequency of the clonotypes
  cdr3Dat.expanded <- cdr3Dat[rep(row.names(cdr3Dat), cdr3Dat$V2),]
}

#CD4cdr3PostProcess = cdr3Dat
#CD4cdr3PostProcess$Cell.type <- "CD4"
#CD4cdr3PostProcess.expanded =cdr3Dat.expanded
#CD4cdr3PostProcess.expanded$Cell.type <- "CD4"

#CD4cdr3PostProcessW1000 = cdr3Dat
#CD4cdr3PostProcessW1000$Cell.type <- "CD4"
#CD4cdr3PostProcess.expandedW1000 =cdr3Dat.expanded
#CD4cdr3PostProcess.expandedW1000$Cell.type <- "CD4"

#CD8cdr3PostProcess = cdr3Dat
#CD8cdr3PostProcess$Cell.type <- "CD8"
#CD8cdr3PostProcess.expanded =cdr3Dat.expanded
#CD8cdr3PostProcess.expanded$Cell.type <- "CD8"

#CD8cdr3PostProcessW1000 = cdr3Dat
#CD8cdr3PostProcessW1000$Cell.type <- "CD8"
#CD8cdr3PostProcess.expandedW1000 =cdr3Dat.expanded
#CD8cdr3PostProcess.expandedW1000$Cell.type <- "CD8"

# Read in final vdj files
CD4VDJFiles <- list.files(path = "CD4/", pattern="\\.tr_dcrcdr3", full.names=T, recursive=FALSE)
CD8VDJFiles <- list.files(path = "CD8/", pattern="\\.tr_dcrcdr3", full.names=T, recursive=FALSE)
CD4VDJFiles
if (length(CD4VDJFiles)>0){
  gnDat <- data.frame(character(), character(), character(), character(), character(), character(), character(), character(), character(), character())
  
  for(file in CD4VDJFiles){
    fileName <- strsplit(file, split='/')[[1]]
    fileName <- fileName[length(fileName)]
    fileName <- strsplit(fileName, split='[.]')[[1]][1]
    sampleID <- strsplit(fileName, split='_')[[1]][3]
    chain <- strsplit(fileName, split='-')[[1]][2]
    ID <- strsplit(sampleID, split='-')[[1]][1]
    week <- unlist(strsplit(gsub("[^0-9]", "", unlist(ID)), ""))
    week <- as.numeric(paste(week, collapse = ''))
    ID = gsub("[[:digit:]]", "", ID)
    
    # Read in cdr3 file
    gnDatTemp <- read.csv(file,header=F, stringsAsFactors=F)
    gnDatTemp$ID <- ID
    gnDatTemp$week <- week
    gnDatTemp$chain <- chain
    gnDatTemp$sampleID <- sampleID
    gnDat <- rbind(gnDat,gnDatTemp)
  }
  temp <- unlist(strsplit(gnDat$V5, split=':'))
  gnDat$freqID <- temp[seq(1,length(temp),2)]
  gnDat$CDR3 <- temp[seq(2,length(temp),2)]
  
  gnDat.expanded <- gnDat[rep(row.names(gnDat), gnDat$V6),]
}

#CD4vdjPostProcessW1000 = gnDat
#CD4vdjPostProcessW1000$Cell.type <- "CD4"
#CD4vdjPostProcess.expandedW1000 =gnDat.expanded
#CD4vdjPostProcess.expandedW1000$Cell.type <- "CD4"

#CD8vdjPostProcessW1000 = gnDat
#CD8vdjPostProcessW1000$Cell.type <- "CD8"
#CD8vdjPostProcess.expandedW1000 =gnDat.expanded
#CD8vdjPostProcess.expandedW1000$Cell.type <- "CD8"

#CD4vdjPostProcess = gnDat
#CD4vdjPostProcess$Cell.type <- "CD4"
#CD4vdjPostProcess.expanded =gnDat.expanded
#CD4vdjPostProcess.expanded$Cell.type <- "CD4"

#CD8vdjPostProcess = gnDat
#CD8vdjPostProcess$Cell.type <- "CD8"
#CD8vdjPostProcess.expanded =gnDat.expanded
#CD8vdjPostProcess.expanded$Cell.type <- "CD8"




# Gini Index

for (i in unique(cdr3Dat$ID)){
  tempC <- c()
  tempM <- c()
  tempP <- c()
  tempSimp <- c()
  tempShan <- c()
  for (j in unique(cdr3Dat$week[cdr3Dat$ID==i])){
    for (k in unique(cdr3Dat$chain[cdr3Dat$ID==i & cdr3Dat$week==j])){
      temp <- cdr3Dat$V2[cdr3Dat$chain==k & cdr3Dat$week==j & cdr3Dat$ID==i]
      tempC <- append(tempC, k)
      tempM <- append(tempM, j)
      tempP <- append(tempP, ineq(temp))
      tempSimp <- c(tempSimp, diversity(temp, index = 'simpson'))
      tempShan <- c(tempShan, diversity(temp, index = 'shannon', base = 2))
    }
  }
  # Gini
  temp <- data.frame(tempP, tempM, tempC)
  ggp <- ggplot(data = temp)+
    geom_point(aes(x=tempM, y=tempP, group=tempC, colour=tempC))+
    geom_line(aes(x=tempM, y=tempP, group=tempC, colour=tempC))+
    scale_y_continuous(limits=c(0,1))+
    labs(x='Week', y='Gini Coefficient', colour='Chain', title=i)+
    theme_classic()+
    theme(plot.title = element_text(hjust = 1))
  
  ggsave(paste(i, '.pdf', sep = ''), 
         ggp, width = 9, height = 7, units = c('cm'))
}



######make data table of diversity!!!

CD4cdr3PostProcess
CD8cdr3PostProcess


#here i  calculate number of clonotypes, number of reads, gini coefficient, and shannon entropy w base 2
#for the cd4s
CD4cdrdiversity_table <- CD4cdr3PostProcess %>%
  group_by(sampleID) %>%
  summarise(nRows = n(), readCount = sum(V2), gini = ineq(V2, type="Gini"), 
            shannon = diversity(V2, index = "shannon", base = 2)) 

matchT <- CD4cdr3PostProcess[,c(3:6)] %>%
  unique()

CD4cdrdiversity_table <- inner_join(CD4cdrdiversity_table, matchT)

CD4cdrdiversity_table$group = ifelse(CD4cdrdiversity_table$ID == "QUDCTW", "CT",
       ifelse(CD4cdrdiversity_table$ID == "QUECTW", "CT",
              ifelse(CD4cdrdiversity_table$ID == "QUFCTW", "CT",
                     ifelse(CD4cdrdiversity_table$ID == "QUPCTW", "CT",
                            ifelse(CD4cdrdiversity_table$ID == "QUVCTW", "CT", "PTI")))))

write.csv(CD4cdrdiversity_table, "CD4cdrdiversity_table.csv")

#for the cd8s
CD8cdrdiversity_table <- CD8cdr3PostProcess %>%
  group_by(sampleID) %>%
  summarise(nRows = n(), readCount = sum(V2), gini = ineq(V2, type="Gini"), 
            shannon = diversity(V2, index = "shannon", base = 2)) 

matchT <- CD8cdr3PostProcess[,c(3:6)] %>%
  unique()

CD8cdrdiversity_table <- inner_join(CD8cdrdiversity_table, matchT)

CD8cdrdiversity_table$group = ifelse(CD8cdrdiversity_table$ID == "QUECTW", "CT",
                                            ifelse(CD8cdrdiversity_table$ID == "QUFCTW", "CT",
                                                   ifelse(CD8cdrdiversity_table$ID == "QUPCTW", "CT",
                                                          ifelse(CD8cdrdiversity_table$ID == "QUVCTW", "CT", "PTI"))))

write.csv(CD8cdrdiversity_table, "CD8cdrdiversity_table.csv")



########## import immunarch
#making my own immunarch friendly set
metadata_alpha <- read.csv("metadata_alpha.txt", sep = "\t", header = TRUE)
metadata_beta <- read.csv("metadata_beta.txt", sep = "\t", header = TRUE)

meta = as_tibble(metadata_alpha)