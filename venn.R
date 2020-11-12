library("plyr")
library("ape")
library("ggplot2")
library("scales")
library("vegan")
library("knitr")
library("dplyr")
library("praise")
library("tidyverse")
library("phyloseq")
library("ineq")
library("igraph")
library("RCytoscape")
library("devtools")
library("VennDiagram")




grid.newpage()
VennDiagram::draw.triple.venn(area1 = 10,
                              area2 = 20,
                              area3 = 15,
                              n12 = 2,
                              n13 = 5,
                              n23 = 9,
                              n123 = 1,
                              scaled = FALSE,
                              category = c("1", "2", "3"),
                              col = c("blue", "green", "red"),
                              fill = c("blue", "green", "red"))
grid.newpage()
VennDiagram::draw.quad.venn(area1 = 40,
                            area2 = 60,
                            area3 = 45,
                            area4 = 50,
                            n12 = 2,
                            n13 = 15,
                            n23 = 9,
                            n123 = 10,
                            n14 = 4,
                            n24 = 6,
                            n34 = 9,
                            n1234 = 5,
                            n234 = 3,
                            n134 = 11,
                            n124 = 4)
?draw.triple.venn


####################################
#making a venn diagram showing shared clonotypes between patients
#start with PTI
# ant cd4 alpha

#QUK is area1
#QUL is area2
#QUQ is area3
#QUT is area4


temp <- unique(QUKCD4alpha$CDR3_AA_sequence) #1
temp <- unique(QULCD4alpha$CDR3_AA_sequence) #2
temp <- unique(QUQCD4alpha$CDR3_AA_sequence) #3
temp <- unique(QUTCD4alpha$CDR3_AA_sequence) #4

#12
tempshared = intersect(QUKCD4alpha$CDR3_AA_sequence,QULCD4alpha$CDR3_AA_sequence)
#13
tempshared = intersect(QUKCD4alpha$CDR3_AA_sequence,QUQCD4alpha$CDR3_AA_sequence)
#23
tempshared = intersect(QULCD4alpha$CDR3_AA_sequence,QUQCD4alpha$CDR3_AA_sequence)
#123
vector.list <- list(QUKCD4alpha$CDR3_AA_sequence, QULCD4alpha$CDR3_AA_sequence, QUQCD4alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#14
tempshared = intersect(QUKCD4alpha$CDR3_AA_sequence,QUTCD4alpha$CDR3_AA_sequence)
#24
tempshared = intersect(QULCD4alpha$CDR3_AA_sequence,QUTCD4alpha$CDR3_AA_sequence)
#34
tempshared = intersect(QUQCD4alpha$CDR3_AA_sequence,QUTCD4alpha$CDR3_AA_sequence)
#1234
vector.list <- list(QUKCD4alpha$CDR3_AA_sequence, QULCD4alpha$CDR3_AA_sequence, QUQCD4alpha$CDR3_AA_sequence, QUTCD4alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#234
vector.list <- list(QULCD4alpha$CDR3_AA_sequence, QUQCD4alpha$CDR3_AA_sequence, QUTCD4alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#134
vector.list <- list(QUKCD4alpha$CDR3_AA_sequence, QUQCD4alpha$CDR3_AA_sequence, QUTCD4alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#124
vector.list <- list(QUKCD4alpha$CDR3_AA_sequence, QULCD4alpha$CDR3_AA_sequence, QUTCD4alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)


grid.newpage()
VennDiagram::draw.quad.venn(area1 = 30939,
                            area2 = 30791,
                            area3 = 25501,
                            area4 = 43807,
                            n12 = 3066,
                            n13 = 2794,
                            n23 = 2816,
                            n123 = 1124,
                            n14 = 4161,
                            n24 = 4282,
                            n34 = 4236,
                            n1234 = 810,
                            n234 = 1543,
                            n134 = 1496,
                            n124 = 1580,
                            category = c("K", "L", "Q", "T"),
                            col = c("#906C97", "#49A5C4", "#3BD4A8", "#CBEF67"),
                            fill = c("#906C97", "#49A5C4", "#3BD4A8", "#CBEF67"))
ggsave("VennCD4alpha.pdf", width = 47, height = 47, units = c('cm'))

# ant cd4 beta

#QUK is area1
#QUL is area2
#QUQ is area3
#QUT is area4


temp <- unique(QUKCD4beta$CDR3_AA_sequence) #1
temp <- unique(QULCD4beta$CDR3_AA_sequence) #2
temp <- unique(QUQCD4beta$CDR3_AA_sequence) #3
temp <- unique(QUTCD4beta$CDR3_AA_sequence) #4


#12
tempshared = intersect(QUKCD4beta$CDR3_AA_sequence,QULCD4beta$CDR3_AA_sequence)
#13
tempshared = intersect(QUKCD4beta$CDR3_AA_sequence,QUQCD4beta$CDR3_AA_sequence)
#23
tempshared = intersect(QULCD4beta$CDR3_AA_sequence,QUQCD4beta$CDR3_AA_sequence)
#123
vector.list <- list(QUKCD4beta$CDR3_AA_sequence, QULCD4beta$CDR3_AA_sequence, QUQCD4beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#14
tempshared = intersect(QUKCD4beta$CDR3_AA_sequence,QUTCD4beta$CDR3_AA_sequence)
#24
tempshared = intersect(QULCD4beta$CDR3_AA_sequence,QUTCD4beta$CDR3_AA_sequence)
#34
tempshared = intersect(QUQCD4beta$CDR3_AA_sequence,QUTCD4beta$CDR3_AA_sequence)
#1234
vector.list <- list(QUKCD4beta$CDR3_AA_sequence, QULCD4beta$CDR3_AA_sequence, QUQCD4beta$CDR3_AA_sequence, QUTCD4beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#234
vector.list <- list(QULCD4beta$CDR3_AA_sequence, QUQCD4beta$CDR3_AA_sequence, QUTCD4beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#134
vector.list <- list(QUKCD4beta$CDR3_AA_sequence, QUQCD4beta$CDR3_AA_sequence, QUTCD4beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#124
vector.list <- list(QUKCD4beta$CDR3_AA_sequence, QULCD4beta$CDR3_AA_sequence, QUTCD4beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)


grid.newpage()
VennDiagram::draw.quad.venn(area1 = 68269,
                            area2 = 74579,
                            area3 = 13960,
                            area4 = 48603,
                            n12 = 1889,
                            n13 = 643,
                            n23 = 437,
                            n123 = 170,
                            n14 = 11081,
                            n24 = 1293,
                            n34 = 476,
                            n1234 = 81,
                            n234 = 115,
                            n134 = 303,
                            n124 = 606,
                            category = c("K", "L", "Q", "T"),
                            col = c("#906C97", "#49A5C4", "#3BD4A8", "#CBEF67"),
                            fill = c("#906C97", "#49A5C4", "#3BD4A8", "#CBEF67"))
ggsave("VennCD4beta.pdf", width = 47, height = 47, units = c('cm'))

# ant CD8 alpha

#QUK is area1
#QUL is area2
#QUQ is area3
#QUT is area4


temp <- unique(QUKCD8alpha$CDR3_AA_sequence) #1
temp <- unique(QULCD8alpha$CDR3_AA_sequence) #2
temp <- unique(QUQCD8alpha$CDR3_AA_sequence) #3
temp <- unique(QUTCD8alpha$CDR3_AA_sequence) #4


#12
tempshared = intersect(QUKCD8alpha$CDR3_AA_sequence,QULCD8alpha$CDR3_AA_sequence)
#13
tempshared = intersect(QUKCD8alpha$CDR3_AA_sequence,QUQCD8alpha$CDR3_AA_sequence)
#23
tempshared = intersect(QULCD8alpha$CDR3_AA_sequence,QUQCD8alpha$CDR3_AA_sequence)
#123
vector.list <- list(QUKCD8alpha$CDR3_AA_sequence, QULCD8alpha$CDR3_AA_sequence, QUQCD8alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#14
tempshared = intersect(QUKCD8alpha$CDR3_AA_sequence,QUTCD8alpha$CDR3_AA_sequence)
#24
tempshared = intersect(QULCD8alpha$CDR3_AA_sequence,QUTCD8alpha$CDR3_AA_sequence)
#34
tempshared = intersect(QUQCD8alpha$CDR3_AA_sequence,QUTCD8alpha$CDR3_AA_sequence)
#1234
vector.list <- list(QUKCD8alpha$CDR3_AA_sequence, QULCD8alpha$CDR3_AA_sequence, QUQCD8alpha$CDR3_AA_sequence, QUTCD8alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#234
vector.list <- list(QULCD8alpha$CDR3_AA_sequence, QUQCD8alpha$CDR3_AA_sequence, QUTCD8alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#134
vector.list <- list(QUKCD8alpha$CDR3_AA_sequence, QUQCD8alpha$CDR3_AA_sequence, QUTCD8alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#124
vector.list <- list(QUKCD8alpha$CDR3_AA_sequence, QULCD8alpha$CDR3_AA_sequence, QUTCD8alpha$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)


grid.newpage()
VennDiagram::draw.quad.venn(area1 = 13028,
                            area2 = 6813,
                            area3 = 8233,
                            area4 = 7567,
                            n12 = 485,
                            n13 = 624,
                            n23 = 335,
                            n123 = 167,
                            n14 = 509,
                            n24 = 364,
                            n34 = 557,
                            n1234 = 87,
                            n234 = 128,
                            n134 = 157,
                            n124 = 175,
                            category = c("K", "L", "Q", "T"),
                            col = c("#906C97", "#49A5C4", "#3BD4A8", "#CBEF67"),
                            fill = c("#906C97", "#49A5C4", "#3BD4A8", "#CBEF67"))
ggsave("VennCD8alpha.pdf", width = 47, height = 47, units = c('cm'))

# ant CD8 beta

#QUK is area1
#QUL is area2
#QUQ is area3
#QUT is area4


temp <- unique(QUKCD8beta$CDR3_AA_sequence) #1
temp <- unique(QULCD8beta$CDR3_AA_sequence) #2
temp <- unique(QUQCD8beta$CDR3_AA_sequence) #3
temp <- unique(QUTCD8beta$CDR3_AA_sequence) #4


#12
tempshared = intersect(QUKCD8beta$CDR3_AA_sequence,QULCD8beta$CDR3_AA_sequence)
#13
tempshared = intersect(QUKCD8beta$CDR3_AA_sequence,QUQCD8beta$CDR3_AA_sequence)
#23
tempshared = intersect(QULCD8beta$CDR3_AA_sequence,QUQCD8beta$CDR3_AA_sequence)
#123
vector.list <- list(QUKCD8beta$CDR3_AA_sequence, QULCD8beta$CDR3_AA_sequence, QUQCD8beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#14
tempshared = intersect(QUKCD8beta$CDR3_AA_sequence,QUTCD8beta$CDR3_AA_sequence)
#24
tempshared = intersect(QULCD8beta$CDR3_AA_sequence,QUTCD8beta$CDR3_AA_sequence)
#34
tempshared = intersect(QUQCD8beta$CDR3_AA_sequence,QUTCD8beta$CDR3_AA_sequence)
#1234
vector.list <- list(QUKCD8beta$CDR3_AA_sequence, QULCD8beta$CDR3_AA_sequence, QUQCD8beta$CDR3_AA_sequence, QUTCD8beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#234
vector.list <- list(QULCD8beta$CDR3_AA_sequence, QUQCD8beta$CDR3_AA_sequence, QUTCD8beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#134
vector.list <- list(QUKCD8beta$CDR3_AA_sequence, QUQCD8beta$CDR3_AA_sequence, QUTCD8beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)
#124
vector.list <- list(QUKCD8beta$CDR3_AA_sequence, QULCD8beta$CDR3_AA_sequence, QUTCD8beta$CDR3_AA_sequence)
tempshared = Reduce("intersect", vector.list)


grid.newpage()
VennDiagram::draw.quad.venn(area1 = 22800,
                            area2 = 13658,
                            area3 = 10932,
                            area4 = 11133,
                            n12 = 298,
                            n13 = 319,
                            n23 = 287,
                            n123 = 75,
                            n14 = 214,
                            n24 = 215,
                            n34 = 369,
                            n1234 = 32,
                            n234 = 96,
                            n134 = 72,
                            n124 = 53,
                            category = c("K", "L", "Q", "T"),
                            col = c("#906C97", "#49A5C4", "#3BD4A8", "#CBEF67"),
                            fill = c("#906C97", "#49A5C4", "#3BD4A8", "#CBEF67"))
ggsave("VennCD8beta.pdf", width = 47, height = 47, units = c('cm'))