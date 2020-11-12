library("ape")
library("ggplot2")
library("plyr")
library("scales")
library("vegan")
library("knitr")
library("dplyr")
library("praise")
library("tidyverse")
library("phyloseq")
library("Bios2cor")
library("grid")
library("ggpubr")

#can i heatmap???
gpt <- prune_taxa(names(sort(taxa_sums(phyloseq_CD4_alpha),TRUE)[1:100]), phyloseq_CD4_alpha)
plot_heatmap(gpt, sample.label="SampleID")
ggsave("heatmap100CD4alpha.png", width = 100, height = 70, units = c('cm'))

#can i heatmap???
gpt <- prune_taxa(names(sort(taxa_sums(phyloseq_CD4_beta),TRUE)[1:100]), phyloseq_CD4_beta)
plot_heatmap(gpt, sample.label="SampleID")
ggsave("heatmap100CD4beta.png", width = 100, height = 70, units = c('cm'))

#can i heatmap???
gpt <- prune_taxa(names(sort(taxa_sums(phyloseq_CD8_alpha),TRUE)[1:100]), phyloseq_CD8_alpha)
plot_heatmap(gpt, sample.label="SampleID")
ggsave("heatmap100CD8alpha.png", width = 100, height = 70, units = c('cm'))

#can i heatmap???

newgpt = subset_samples(newgpt, SampleID != "QUEW0CD8-b")
newgpt = subset_samples(gpt, SampleID != "QUEW150CD8-b")
sample_sums(newgpt)
gpt <- prune_taxa(names(sort(taxa_sums(newphyloseq_CD8_beta),TRUE)[1:100]), newphyloseq_CD8_beta)
plot_heatmap(newgpt, sample.label="SampleID")
ggsave("heatmap100CD8beta.png", width = 100, height = 70, units = c('cm'))

plot_bar(gpt)

#can i plot with phyloseq too?
PTI_phyloseq_CD4_alpha = subset_samples(phyloseq_CD4_alpha, Status == "PTI") #just

p = plot_richness(PTI_phyloseq_CD4_alpha, x="Week", color="Patient", measures=c("Shannon", "Observed", "Chao1"))
p + geom_boxplot(data = p$data, aes(x = Week, y = value, color = NULL), 
                 alpha = 0.1)+
  geom_point(size = 10)+ 
  labs(title = "", x = "Week", y = "Alpha Diversity Measure", color = " ") + theme(
    plot.title = element_text(color="black", size=28, face="bold"),
    axis.title.x = element_text(color="black", size=28, face="bold"),
    axis.title.y = element_text(color="black", size=28, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 26),
    legend.text = element_text(color = "black", size = 18))
ggsave("diversityInPTIOverTimeallCD4alphaboxplot.pdf", width = 47, height = 40, units = c('cm'))

#can i plot with phyloseq too?
PTI_phyloseq_CD4_beta = subset_samples(phyloseq_CD4_beta, Status == "PTI") #just

p = plot_richness(PTI_phyloseq_CD4_beta, x="Week", color="Patient", measures=c("Shannon", "Observed", "Chao1"))
p + geom_boxplot(data = p$data, aes(x = Week, y = value, color = NULL), 
                 alpha = 0.1)+
  geom_point(size = 10)+ 
  labs(title = "", x = "Week", y = "Alpha Diversity Measure", color = " ") + theme(
    plot.title = element_text(color="black", size=28, face="bold"),
    axis.title.x = element_text(color="black", size=28, face="bold"),
    axis.title.y = element_text(color="black", size=28, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 26),
    legend.text = element_text(color = "black", size = 18))
ggsave("diversityInPTIOverTimeallCD4betaboxplot.pdf", width = 47, height = 40, units = c('cm'))


#can i plot with phyloseq too?
PTI_phyloseq_CD8_alpha = subset_samples(phyloseq_CD8_alpha, Status == "PTI") #just

p = plot_richness(PTI_phyloseq_CD8_alpha, x="Week", color="Patient", measures=c("Shannon", "Observed", "Chao1"))
p + geom_boxplot(data = p$data, aes(x = Week, y = value, color = NULL), 
                 alpha = 0.1)+
  geom_point(size = 10)+ 
  labs(title = "", x = "Week", y = "Alpha Diversity Measure", color = " ") + theme(
    plot.title = element_text(color="black", size=28, face="bold"),
    axis.title.x = element_text(color="black", size=28, face="bold"),
    axis.title.y = element_text(color="black", size=28, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 26),
    legend.text = element_text(color = "black", size = 18))
ggsave("diversityInPTIOverTimeallCD8alphaboxplot.pdf", width = 47, height = 40, units = c('cm'))

#can i plot with phyloseq too?
PTI_phyloseq_CD8_beta = subset_samples(phyloseq_CD8_beta, Status == "PTI") #just

p = plot_richness(PTI_phyloseq_CD8_beta, x="Week", color="Patient", measures=c("Shannon", "Observed", "Chao1"))
p + geom_boxplot(data = p$data, aes(x = Week, y = value, color = NULL), 
                 alpha = 0.1)+
  geom_point(size = 10)+ 
  labs(title = "", x = "Week", y = "Alpha Diversity Measure", color = " ") + theme(
    plot.title = element_text(color="black", size=28, face="bold"),
    axis.title.x = element_text(color="black", size=28, face="bold"),
    axis.title.y = element_text(color="black", size=28, face="bold"),
    axis.text=element_text(size=20),
    legend.title = element_text(color = "black", size = 26),
    legend.text = element_text(color = "black", size = 18))
ggsave("diversityInPTIOverTimeallCD8betaboxplot.pdf", width = 47, height = 40, units = c('cm'))

#ordinate

GP.ord <- ordinate(PTI_phyloseq_CD8_beta, "NMDS", "bray")
p1 = plot_ordination(PTI_phyloseq_CD8_beta, GP.ord, type="Week", color="Patient", title="") + geom_point(size = 10)
print(p1)
ggsave("nmdsPTICD8betabypatient.pdf", width = 47, height = 40, units = c('cm'))


GP.ord <- ordinate(PTI_phyloseq_CD4_beta, "NMDS", "bray")
p1 = plot_ordination(PTI_phyloseq_CD4_beta, GP.ord, type="Week", color="Week", title="taxa") + geom_point(size = 10)
print(p1)