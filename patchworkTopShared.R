#cd4 alpha

tc1 <- trackClonotypes(alphaCDR3CD4data$data, list(3, 10), .col = "aa") #F
tc1
p1 <- vis(tc1, .order = c(1,2,3,4, 12, 13, 22, 5,6,7,8,9,10,11,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p1
fixVis(p1)


tc1 <- trackClonotypes(alphaCDR3CD4data$data, list(5, 10), .col = "aa") #K
tc1
p2 <- vis(tc1, .order = c(1,2,3,4, 12, 13, 22, 5,6,7,8,9,10,11,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p2
fixVis(p2)

tc1 <- trackClonotypes(alphaCDR3CD4data$data, list(9, 10), .col = "aa") #L
tc1
p3 <- vis(tc1, .order = c(1,2,3,4, 12, 13, 22, 5,6,7,8,9,10,11,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p3
fixVis(p3)

tc1 <- trackClonotypes(alphaCDR3CD4data$data, list(12, 10), .col = "aa") #P
tc1
p4 <- vis(tc1, .order = c(1,2,3,4, 12, 13, 22, 5,6,7,8,9,10,11,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p4
fixVis(p4)

tc1 <- trackClonotypes(alphaCDR3CD4data$data, list(14, 10), .col = "aa") #Q
tc1
p5 <- vis(tc1, .order = c(1,2,3,4, 12, 13, 22, 5,6,7,8,9,10,11,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p5
fixVis(p5)
#Clonotype tracking in CD4+ alpha (CT)

tc1 <- trackClonotypes(alphaCDR3CD4data$data, list(18, 10), .col = "aa") #T
tc1
p6 <- vis(tc1, .order = c(1,2,3,4, 12, 13, 22, 5,6,7,8,9,10,11,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p6
fixVis(p6)
#patchwork them

top10_CD4A_CT <- p1 +p4

top10_CD4A_CT
ggsave("top10_CD4A_CT_Start.pdf", width = 35, height = 15, units = c('cm'))

top10_CD4A_PTI <- (p2 +p3)/
  (p5 + p6)

top10_CD4A_PTI
ggsave("top10_CD4A_PTI_Start.pdf", width = 35, height = 30, units = c('cm'))

#CD4 beta

tc1 <- trackClonotypes(betaCDR3CD4data$data, list(1, 10), .col = "aa") #D
tc1
p1 <- vis(tc1, .order = c(1,2,3,4,5,6, 15, 16, 22,23,7,8,9,10,11,12,13,14,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p1
fixVis(p1)

tc1 <- trackClonotypes(betaCDR3CD4data$data, list(3, 10), .col = "aa") #E
tc1
p2 <- vis(tc1, .order = c(1,2,3,4,5,6, 15, 16, 22,23,7,8,9,10,11,12,13,14,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p2
fixVis(p2)

tc1 <- trackClonotypes(betaCDR3CD4data$data, list(5, 10), .col = "aa") #F
tc1
p3 <- vis(tc1, .order = c(1,2,3,4,5,6, 15, 16, 22,23,7,8,9,10,11,12,13,14,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p3
fixVis(p3)

tc1 <- trackClonotypes(betaCDR3CD4data$data, list(7, 10), .col = "aa") #K
tc1
p4 <- vis(tc1, .order = c(1,2,3,4,5,6, 15, 16, 22,23,7,8,9,10,11,12,13,14,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p4
fixVis(p4)

tc1 <- trackClonotypes(betaCDR3CD4data$data, list(11, 10), .col = "aa") #L
tc1
p5 <- vis(tc1, .order = c(1,2,3,4,5,6, 15, 16, 22,23,7,8,9,10,11,12,13,14,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p5
fixVis(p5)

tc1 <- trackClonotypes(betaCDR3CD4data$data, list(15, 10), .col = "aa") #P
tc1
p6 <- vis(tc1, .order = c(1,2,3,4,5,6, 15, 16, 22,23,7,8,9,10,11,12,13,14,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p6
fixVis(p6)


tc1 <- trackClonotypes(betaCDR3CD4data$data, list(17, 10), .col = "aa") #Q
tc1
p7 <- vis(tc1, .order = c(1,2,3,4,5,6, 15, 16, 22,23,7,8,9,10,11,12,13,14,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p7
fixVis(p7)

tc1 <- trackClonotypes(betaCDR3CD4data$data, list(19, 10), .col = "aa") #T
tc1
p8 <- vis(tc1, .order = c(1,2,3,4,5,6, 15, 16, 22,23,7,8,9,10,11,12,13,14,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p8
fixVis(p8)

top10_CD4B_CT <- (p1 +p2)/
  (p3 + p6)

top10_CD4B_CT
ggsave("top10_CD4B_CT_Start.pdf", width = 35, height = 30, units = c('cm'))


top10_CD4B_PTI <- (p4 +p5)/
  (p7 + p8)

top10_CD4B_PTI
ggsave("top10_CD4B_PTI_Start.pdf", width = 35, height = 30, units = c('cm'))

#cd8 alpha

tc1 <- trackClonotypes(alphaCDR3CD8data$data, list(1, 10), .col = "aa") #E
tc1
p1 <- vis(tc1)
p1 <- vis(tc1, .order = c(1,2,3,4,13,21,22,23,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20))+ scale_fill_brewer(palette = "BrBG")
p1
fixVis(p1)

tc1 <- trackClonotypes(alphaCDR3CD8data$data, list(3, 10), .col = "aa") #F
tc1
p2 <- vis(tc1, .order = c(1,2,3,4,13,21,22,23,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20))+ scale_fill_brewer(palette = "BrBG")
p2
fixVis(p2)

tc1 <- trackClonotypes(alphaCDR3CD8data$data, list(5, 10), .col = "aa") #K
tc1
p3 <- vis(tc1, .order = c(1,2,3,4,13,21,22,23,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20))+ scale_fill_brewer(palette = "PRGn")
p3
fixVis(p3)

tc1 <- trackClonotypes(alphaCDR3CD8data$data, list(9, 10), .col = "aa") #L
tc1
p4 <- vis(tc1, .order = c(1,2,3,4,13,21,22,23,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20))+ scale_fill_brewer(palette = "PRGn")
p4
fixVis(p4)

tc1 <- trackClonotypes(alphaCDR3CD8data$data, list(14, 10), .col = "aa") #Q
tc1
p5 <- vis(tc1, .order = c(1,2,3,4,13,21,22,23,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20))+ scale_fill_brewer(palette = "PRGn")
p5
fixVis(p5)

tc1 <- trackClonotypes(alphaCDR3CD8data$data, list(18, 10), .col = "aa") #T
tc1
p6 <- vis(tc1, .order = c(1,2,3,4,13,21,22,23,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20))+ scale_fill_brewer(palette = "PRGn")
p6
fixVis(p6)

tc1 <- trackClonotypes(alphaCDR3CD8data$data, list(21, 10), .col = "aa") #V
tc1
p7 <- vis(tc1, .order = c(1,2,3,4,13,21,22,23,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20))+ scale_fill_brewer(palette = "BrBG")
p7
fixVis(p7)

top10_CD8A_CT <- (p1 +p2)/
  (p7 + wrap_elements(grid::textGrob(' ')))

top10_CD8A_CT
ggsave("top10_CD8A_CT_Start.pdf", width = 35, height = 30, units = c('cm'))


top10_CD8A_PTI <- (p3 +p4)/
  (p5 + p6)

top10_CD8A_PTI
ggsave("top10_CD8A_PTI_Start.pdf", width = 35, height = 30, units = c('cm'))


#cd8 beta
tc1 <- trackClonotypes(betaCDR3CD8data$data, list(1, 10), .col = "aa") #E
tc1
p1 <- vis(tc1, .order = c(1,2,3,4,13,22,23,24,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p1
fixVis(p1)

tc1 <- trackClonotypes(betaCDR3CD8data$data, list(3, 10), .col = "aa") #F
tc1
p2 <- vis(tc1, .order = c(1,2,3,4,13,22,23,24,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p2
fixVis(p2)

tc1 <- trackClonotypes(betaCDR3CD8data$data, list(5, 10), .col = "aa") #K
tc1
p3 <- vis(tc1, .order = c(1,2,3,4,13,22,23,24,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p3
fixVis(p3)

tc1 <- trackClonotypes(betaCDR3CD8data$data, list(9, 10), .col = "aa") #L
tc1
p4 <- vis(tc1, .order = c(1,2,3,4,13,22,23,24,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p4
fixVis(p4)

tc1 <- trackClonotypes(betaCDR3CD8data$data, list(14, 10), .col = "aa") #Q
tc1
p5 <- vis(tc1, .order = c(1,2,3,4,13,22,23,24,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p5
fixVis(p5)

tc1 <- trackClonotypes(betaCDR3CD8data$data, list(18, 10), .col = "aa") #T
tc1
p6 <- vis(tc1, .order = c(1,2,3,4,13,22,23,24,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "PRGn")
p6
fixVis(p6)

tc1 <- trackClonotypes(betaCDR3CD8data$data, list(22, 10), .col = "aa") #V
tc1
p7 <- vis(tc1, .order = c(1,2,3,4,13,22,23,24,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21))+ scale_fill_brewer(palette = "BrBG")
p7
fixVis(p7)

top10_CD8B_CT <- (p1 +p2)/
  (p7 + wrap_elements(grid::textGrob(' ')))

top10_CD8B_CT
ggsave("top10_CD8B_CT_Start.pdf", width = 35, height = 30, units = c('cm'))


top10_CD8B_PTI <- (p3 +p4)/
  (p5 + p6)

top10_CD8B_PTI
ggsave("top10_CD8B_PTI_Start.pdf", width = 35, height = 30, units = c('cm'))



