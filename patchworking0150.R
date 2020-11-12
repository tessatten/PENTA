

#CD4 alpha

#QUFCD4alpha
p1 = ggplot(QUFCD4alpha.mod0150, aes(x=QUFCD4alpha.mod0150$week, y=QUFCD4alpha.mod0150$V2, color=QUFCD4alpha.mod0150$V1, fill=QUFCD4alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient F: CD4 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p1

p2 = ggplot(QUKCD4alpha.mod0150, aes(x=QUKCD4alpha.mod0150$week, y=QUKCD4alpha.mod0150$V2, color=QUKCD4alpha.mod0150$V1, fill=QUKCD4alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient K: CD4 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p2

p3 = ggplot(QULCD4alpha.mod0150, aes(x=QULCD4alpha.mod0150$week, y=QULCD4alpha.mod0150$V2, color=QULCD4alpha.mod0150$V1, fill=QULCD4alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient L: CD4 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p3

p4 = ggplot(QUPCD4alpha.mod0150, aes(x=QUPCD4alpha.mod0150$week, y=QUPCD4alpha.mod0150$V2, color=QUPCD4alpha.mod0150$V1, fill=QUPCD4alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient P: CD4 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p4

p5 = ggplot(QUQCD4alpha.mod0150, aes(x=QUQCD4alpha.mod0150$week, y=QUQCD4alpha.mod0150$V2, color=QUQCD4alpha.mod0150$V1, fill=QUQCD4alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient Q: CD4 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p5

p6 = ggplot(QUTCD4alpha.mod0150, aes(x=QUTCD4alpha.mod0150$week, y=QUTCD4alpha.mod0150$V2, color=QUTCD4alpha.mod0150$V1, fill=QUTCD4alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient T: CD4 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p6

#patchwork them

shared_CD4A <- (p1 + p2) /
  (p4 + p3) /
  (wrap_elements(grid::textGrob(' ')) + p5) / 
  (wrap_elements(grid::textGrob(' ')) + p6)

shared_CD4A
ggsave("shared_CD4A_topStart.pdf", width = 25, height = 45, units = c('cm'))


#CD4 beta

p1 = ggplot(QUDCD4beta.mod0150, aes(x=QUDCD4beta.mod0150$week, y=QUDCD4beta.mod0150$V2, color=QUDCD4beta.mod0150$V1, fill=QUDCD4beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient D: CD4 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p1

p2 = ggplot(QUECD4beta.mod0150, aes(x=QUECD4beta.mod0150$week, y=QUECD4beta.mod0150$V2, color=QUECD4beta.mod0150$V1, fill=QUECD4beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient E: CD4 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p2

p3 = ggplot(QUFCD4beta.mod0150, aes(x=QUFCD4beta.mod0150$week, y=QUFCD4beta.mod0150$V2, color=QUFCD4beta.mod0150$V1, fill=QUFCD4beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient F: CD4 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p3

p4 = ggplot(QUPCD4beta.mod0150, aes(x=QUPCD4beta.mod0150$week, y=QUPCD4beta.mod0150$V2, color=QUPCD4beta.mod0150$V1, fill=QUPCD4beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient P: CD4 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p4

p5 = ggplot(QUKCD4beta.mod0150, aes(x=QUKCD4beta.mod0150$week, y=QUKCD4beta.mod0150$V2, color=QUKCD4beta.mod0150$V1, fill=QUKCD4beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient K: CD4 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p5

p6 = ggplot(QULCD4beta.mod0150, aes(x=QULCD4beta.mod0150$week, y=QULCD4beta.mod0150$V2, color=QULCD4beta.mod0150$V1, fill=QULCD4beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient L: CD4 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p6

#patchwork them

shared_CD4B <- (p1 + p5) /
  (p2 + p6) /
  (p3 + wrap_elements(grid::textGrob(' '))) / 
  (p4 + wrap_elements(grid::textGrob(' ')))

shared_CD4B
ggsave("shared_CD4B_topStart.pdf", width = 25, height = 45, units = c('cm'))


#CD8 alpha

p1 = ggplot(QUKCD8alpha.mod0150, aes(x=QUKCD8alpha.mod0150$week, y=QUKCD8alpha.mod0150$V2, color=QUKCD8alpha.mod0150$V1, fill=QUKCD8alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient K: CD8 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p1

p2 = ggplot(QULCD8alpha.mod0150, aes(x=QULCD8alpha.mod0150$week, y=QULCD8alpha.mod0150$V2, color=QULCD8alpha.mod0150$V1, fill=QULCD8alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient L: CD8 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p2

p3 = ggplot(QUQCD8alpha.mod0150, aes(x=QUQCD8alpha.mod0150$week, y=QUQCD8alpha.mod0150$V2, color=QUQCD8alpha.mod0150$V1, fill=QUQCD8alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient Q: CD8 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p3

p4 = ggplot(QUTCD8alpha.mod0150, aes(x=QUTCD8alpha.mod0150$week, y=QUTCD8alpha.mod0150$V2, color=QUTCD8alpha.mod0150$V1, fill=QUTCD8alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient T: CD8 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p4

p5 = ggplot(QUECD8alpha.mod0150, aes(x=QUECD8alpha.mod0150$week, y=QUECD8alpha.mod0150$V2, color=QUECD8alpha.mod0150$V1, fill=QUECD8alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient E: CD8 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p5

p6 = ggplot(QUFCD8alpha.mod0150, aes(x=QUFCD8alpha.mod0150$week, y=QUFCD8alpha.mod0150$V2, color=QUFCD8alpha.mod0150$V1, fill=QUFCD8alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient F: CD8 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p6

p7 = ggplot(QUVCD8alpha.mod0150, aes(x=QUVCD8alpha.mod0150$week, y=QUVCD8alpha.mod0150$V2, color=QUVCD8alpha.mod0150$V1, fill=QUVCD8alpha.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient V: CD8 (alpha chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p7

#patchwork them

shared_CD8A <-   (p5 + p1) /
  (p6 + p2) /
  (p7 + p3) /
  (wrap_elements(grid::textGrob(' ')) + p4)

shared_CD8A
ggsave("shared_CD8A_topStart.pdf", width = 25, height = 45, units = c('cm'))


#CD8 beeta

p1 = ggplot(QUKCD8beta.mod0150, aes(x=QUKCD8beta.mod0150$week, y=QUKCD8beta.mod0150$V2, color=QUKCD8beta.mod0150$V1, fill=QUKCD8beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient K: CD8 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p1

p2 = ggplot(QULCD8beta.mod0150, aes(x=QULCD8beta.mod0150$week, y=QULCD8beta.mod0150$V2, color=QULCD8beta.mod0150$V1, fill=QULCD8beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient L: CD8 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p2

p3 = ggplot(QUQCD8beta.mod0150, aes(x=QUQCD8beta.mod0150$week, y=QUQCD8beta.mod0150$V2, color=QUQCD8beta.mod0150$V1, fill=QUQCD8beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient Q: CD8 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p3

p4 = ggplot(QUTCD8beta.mod0150, aes(x=QUTCD8beta.mod0150$week, y=QUTCD8beta.mod0150$V2, color=QUTCD8beta.mod0150$V1, fill=QUTCD8beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient T: CD8 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p4

p5 = ggplot(QUECD8beta.mod0150, aes(x=QUECD8beta.mod0150$week, y=QUECD8beta.mod0150$V2, color=QUECD8beta.mod0150$V1, fill=QUECD8beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient E: CD8 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p5

p6 = ggplot(QUFCD8beta.mod0150, aes(x=QUFCD8beta.mod0150$week, y=QUFCD8beta.mod0150$V2, color=QUFCD8beta.mod0150$V1, fill=QUFCD8beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient F: CD8 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p6

p7 = ggplot(QUVCD8beta.mod0150, aes(x=QUVCD8beta.mod0150$week, y=QUVCD8beta.mod0150$V2, color=QUVCD8beta.mod0150$V1, fill=QUVCD8beta.mod0150$V1)) +
  geom_point(size = 4)+ theme(legend.position="none")+
  geom_line(aes(color = V1), size = 1) + labs(title = "Patient V: CD8 (beta chain)", x = "Week", y = "Clonotype size (% of sample)", color = "CDR3") +
  theme_bw() + theme(
    plot.title = element_text(color="black", size=20, face="bold"),
    axis.title.x = element_text(color="black", size=20, face="bold"),
    axis.title.y = element_text(color="black", size=20, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 16),
    legend.text = element_text(color = "black", size = 14)
  ) + guides(fill=FALSE, color=FALSE)
p7

#patchwork them

shared_CD8B <-   (p5 + p1) /
  (p6 + p2) /
  (p7 + p3) /
  (wrap_elements(grid::textGrob(' ')) + p4)

shared_CD8B
ggsave("shared_CD8B_topStart.pdf", width = 25, height = 45, units = c('cm'))