library('tidyverse')
raw <- read.csv('inelastic.csv')
data <- select(raw,c('Data.Set.28.Time.s.','Data.Set.28.Position.1.m.','Data.Set.28.Position.2.m.'))
data<-rename(data, t=Data.Set.28.Time.s.,x1=Data.Set.28.Position.1.m.,x2=Data.Set.28.Position.2.m.)
#data<-mutate(data,
#x1=1.8-1.5*x1)

fig2<-ggplot(data)+geom_vline(aes(xintercept=1.5),color="orange")+geom_hline(yintercept=0,color="darkgray")+geom_line(aes(x=t,y=x1),color="blue")+geom_line(aes(x=t,y=x2),color="red")+annotate('text',x=0.25,y=0.85,label='mass 2',size=3)+annotate('text',x=0.25,y=0.25,label='mass 1',size=3)+theme_bw(base_size=8)+xlab('time, s')+ylab('position, m')+ylim(0,1.5)+xlim(0,3)

pdf('inelastic.pdf',width=3,height=2)
print(fig2)
dev.off()