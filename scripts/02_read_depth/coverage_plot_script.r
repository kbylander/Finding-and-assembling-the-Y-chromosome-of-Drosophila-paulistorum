library(ggplot2)
library(patchwork)

rm(list = ls())

datan = read.table('average_normalised_samples_2.out', header=FALSE)
head(datan)
mixed = datan$V5
female = datan$V4
mxf=datan$V6
ctg = datan$V1

fm_std = sd(female, na.rm=TRUE)
mx_std = sd(mixed,na.rm=TRUE)
mxf_std=sd(mxf,na.rm=TRUE)
mxf_mean=mean(mxf,na.rm=TRUE)
fm_mean=mean(female,na.rm=TRUE)
mx_mean=mean(mixed,na.rm=TRUE)

fm_norm <- matrix(0, length(female), 1)
mx_norm <- matrix(0, length(mixed), 1)
mxf_ratio <- matrix(0, length(mxf), 1)

for (ind in 1:length(female))
{
  fm_norm[ind]=1+(female[ind]-fm_mean)/fm_mean
  mx_norm[ind]=1+(mixed[ind]-mx_mean)/mx_mean
  mxf_ratio[ind]=1+(mxf[ind]-mxf_mean)/mxf_mean
}

#png(to)
saved_plot=par(mfrow=c(1,1))

c1 <- rgb(0,136,111,max = 256, alpha = 100)
c2 <- rgb(28,0,100, max = 256, alpha = 100)
c1_legend <- rgb(0,136,111,max = 256, alpha = 256)
c2_legend <- rgb(28,0,100, max = 256, alpha = 256)
plot_colors=c(c1_legend,c2_legend)
cov=data.frame(x=mxf)


dat1 = data.frame(x=fm_norm, group="Female")
dat2 = data.frame(x=mx_norm, group="Mixed")
dat = rbind(dat2, dat1)

contigs=c("ctg000890", "ctg000470","ctg000350", "ctg000660", "ctg000600", "ctg000240", "ctg000830", "ctg000840", "ctg000410","ctg000480","ctg000560")
plot(x=1:nrow(datan), mxf, pch=".",col=c1,ylim=c(-0.5,2))
for (i in contigs)
{
  x_list=datan$V2[which(ctg==i)]
  print(x_list[1])
  points(x=1:length(ctg), y=ifelse(ctg==i, 0,NA), pch=1, col=c2_legend,labels=i)
  text(x_list[1],y=ifelse(ctg==i, 0,NA), labels=i)
}
#points(x=1:length(ctg), y=ifelse(ctg=="ctg000890"| ctg=="ctg000470"|ctg=="ctg000350"|ctg=="ctg000660"|ctg=="ctg000600"|ctg=="ctg000240"|ctg=="ctg000830"|ctg=="ctg000840"|ctg=="ctg000410"|ctg=="ctg000480"|ctg=="ctg000560", -0.2,NA), pch=1, col=c2_legend,labels=datan$V1)
grid(nx = NULL, ny = NULL,
     lty = 1,      # Grid line type
     col = "gray", # Grid line color
     lwd = 0.5)      # Grid line width


plot1 <- ggplot(cov, aes(x=1:length(female),y=x,col=c2_legend)) + 
     geom_line(size = 0.5) + ggtitle("Mean coverage ratio (Female & Mixed)") + 
     ylim(0, 2) + xlab("Position (kpb)") + ylab("Coverage") +
      theme_classic() +theme(legend.position = "none", plot.title = element_text(hjust = 0.5),
      panel.grid.major.y = element_line(color = "grey", size = 0.5, linetype = 1)
      )

plot2 <- ggplot(dat, aes(x,fill=group, col=group,)) + ggtitle("Sum of coverage between samples") + ylab("Number of occurences") + xlab("Ratio") +
  geom_density(alpha=0.4, lwd=0.8, adjust=0.5,aes(y = (..count..))) + xlim(0,2)+theme_classic() +
  theme(panel.grid.major.x = element_line(color = "grey", size = 0.5,linetype = 1), plot.title = element_text(hjust = 0.5)
  )

plot3 <- ggplot(cov, aes(x,fill=c2, col=c2)) + ggtitle("Mean coverage ratio (Female & Mixed)") + ylab("Number of occurences") + xlab("Ratio (F & MX)")+
  geom_density(alpha=0.4, lwd=0.8, adjust=0.5,aes(y = (..count..))) + xlim(0,2) + theme_classic()+
  theme(legend.position = "none", plot.title = element_text(hjust = 0.5), panel.grid.major.x = element_line(color = "grey", size = 0.5, linetype = 1))

plot1 + plot3 + plot2 + plot_layout(ncol = 1)

#print(saved_plot)
#q()

