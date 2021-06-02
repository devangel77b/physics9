library('tidyverse')
data <- read.csv('momentum-data-1-3.csv')
results <- mutate(data,
p0=m1.kg*v1.ms+m2.kg*v2.ms,
pf=m1.kg*v1f.ms+m2.kg*v2f.ms,
dp=pf-p0,
p2hat=m2.kg/m1.kg*v2.ms/v1.ms,
dphat=dp/m1.kg/v1.ms)

summary(results)

# plot as a bar chart with mean and sd
plottable <- summarize(group_by(results,type),
dpbar = mean(dp),
sddp = sd(dp))
fig3 <- ggplot(plottable,aes(x=type,y=dpbar))+geom_hline(yintercept=0,color="darkgray")+geom_bar(stat="identity",width=0.2,fill="orange")+geom_errorbar(aes(ymin=dpbar-sddp,ymax=dpbar+sddp),width=0.1,position=position_dodge(0.9))+ylab('momentum change (kg m/s)')+theme_bw(base_size=8)+theme(axis.title.x=element_blank(),axis.text.x=element_blank())

pdf('momentum-change.pdf',width=3,height=2,pointsize=8)
print(fig3)
dev.off()
