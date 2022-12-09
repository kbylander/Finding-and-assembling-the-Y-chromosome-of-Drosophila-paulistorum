cd /proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping

#!/usr/bin/env Rscript

dat = read.table('average_F_vs_Mixed_2.out', header=FALSE)
mixed = dat$V5
female = dat$V4
mixed[mixed > 1000000] = NA
female[female > 1000000] = NA
plot(x=1:length(female), female, pch=".", ylim=c(0,10))
hist(female)
plot(x=1:nrow(dat), dat$V7, pch=".", ylim=c(0,10))
head(dat)
plot(x=1:nrow(dat), dat$V7, pch=".", ylim=c(0,4))
ctg = dat$V1
points(x=1:length(ctg), y=ifelse(ctg=="ctg000890"|ctg=="ctg000470",0.1,NA), pch=".", col="red")
points(x=1:length(ctg), y=ifelse(ctg=="ctg000890"|ctg=="ctg000470",0.1,NA), pch="-", col="red")
points(x=1:length(ctg), y=ifelse(ctg=="ctg000890"|ctg=="ctg000470",0.1,NA), pch=1, col="red")
points(x=1:length(ctg), y=ifelse(ctg=="ctg000890"|ctg=="ctg000470"|ctg=="ctg000350",0.1,NA), pch=1, col="red")
points(x=1:length(ctg), y=ifelse(ctg=="ctg000890"|ctg=="ctg000470"|ctg=="ctg000350"|ctg=="ctg000660",0.1,NA), pch=1, col="red")
points(x=1:length(ctg), y=ifelse(ctg=="ctg000890"|ctg=="ctg000470"|ctg=="ctg000350"|ctg=="ctg000660"|ctg=="ctg000600",0.1,NA), pch=1, col="red")

q()
