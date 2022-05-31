# Session1

#for running a line run bottom north east.
#for running whole script ctrl+alt+r
#arithmatic operations. ^ is same.
5/2
5%/%2
5%%2
#Logical operations 
T|FALSE
TRUE & F
#Assigning variable
x=2
y<-5
6->t
print(y)
##Numeric logical Character
x=2.8
y="hossein"
#get class of variable type() in python
class(y)
#vector hame element hash az single class.
x=c(1,3,4,c(5,2))   #concatnation index starts from 1.
x[1]
y=1:10
z=seq(1,10,3)
z1=rep(1:2,times=3)
z2=rep(1:4,each=2)
x=c(7,26,74,7,36,8,8)
x[1:4]=5
# by value
x[x>30] #fancy syntax like python
x=c(1,0)
x_label=c('man','woman')
names(x)=x_label
setNames(x_label,x)
y=c(4,6)
x-y #elementwise multiply or power
x=c(7,26,7)
y=c(3,5,13)
sum(x)
mean(x)
sd(x)
data()#built in datasets 
#Help
help("median")
?median
example("median")
?mtcars

#Functions
norm <- function(v) {
  return(sqrt(sum(v^2)))
}
norm(c(3,4))
for (i in 1:10) {
  print('sdfg')
}

#Matrix
m=matrix(1:10,nrow = 2)# column by column michineh.
m=matrix(1:10,byrow = T,nrow = 2)
rownames(m)=c('small','big')
m[,2]#all of rows
m[1:2,2:4]#all of rows
t(m)#transpose
dim(m)
#Binding
cbind(m,rowSums(m))
m*c(1,0)

#matrix multiplication.
c(4,5)%*%m
#Factors good practice for some discrete variables.
x=c('m','f')
x=factor(x)
y=c('a','c','b','a','c')
y=factor(y,ordered = T,levels = c('a','b','c'))
y[1]<y[2] #significant
summary(y)[1]+4

#DataFrames:

View(mtcars)
head(mtcars)
tail(mtcars)
str(mtcars)#structure
summary(mtcars)
mtcars[,'cyl']
mtcars$cyl=factor(mtcars$cyl)

#DataFrame Constructor
names=c('ali','hossein','zahra')
gender=factor(c('M','M','F'))
age=c(10,20,21)
class_df = data.frame(names,gender,age,stringsAsFactors = F) 
View(class_df)
class_df[class_df$age>20,]
subset(class_df,subset = (age>=20))
t=c(14,63,8,146,95)
order(t)

#R_markdown
data(iris)
summary(iris)
setRepositories() #where my packages come.
#multicursor

#install these packages dplyr,ggplot2 readr ggthemes
library(readr)
library(ggplot2)
library(dplyr)

library(ggthemes)
dplyr::select()
getwd()
setwd('')
#ggplot2
View(mpg)
?mpg
#aes motenazer ba variable.
p=ggplot(data=mpg)+geom_point(aes(cty,hwy))
p+theme_dark()
p+theme_economist()
p+xlab("city miles per galon")+ylab("highway")+ggtitle("hwy vs. cty")
p+labs(x='',y='y',title = "d")
# show three variable in 2 dimension.
ggplot(data = mpg)+geom_point(mapping = aes(x=cty,y=hwy, color=cyl))#continious cause cyl isn't factor
mpg$cyl=as.factor(mpg$cyl)
View(mpg)
ggplot(data = mpg)+geom_point(mapping = aes(x=cty,y=hwy, color=cyl,shape=class))
ggplot(data = mpg)+geom_point(mapping = aes(x=cty,y=hwy),color="blue")# shape=2, size =1 numeric.
#ggplot(data = mpg)+geom_point(mapping = aes(x=cyl,y=hwy, color=displ))

#facets breaking plots.
ggplot(data = mpg)+geom_point(mapping = aes(x=cty,y=hwy),shape=1)+
  facet_wrap(~class,nrow=2)
#formula ~
ggplot(data = mpg)+geom_point(mapping = aes(x=cty,y=hwy),shape=1)+
  facet_grid(drv~cyl)
#geometric objects geom ha
ggplot(data = mpg)+geom_smooth(mapping = aes(x=displ,y=hwy))
ggplot(data = mpg,mapping = aes(x=displ,y=hwy))+geom_smooth()+
  geom_point()

#2 different dataset in a single plot.
ggplot(data=mpg,aes(cyl))+geom_bar()
#stat statistical transformations

#position
ggplot(data=mpg,aes(cyl))+geom_bar(aes(fill=cyl)) #color hashieh
ggplot(data=mpg,aes(cyl))+geom_bar(aes(fill=class))
ggplot(data=mpg,aes(cyl))+geom_bar(aes(fill=class),position = "fill")#kasri
ggplot(data=mpg,aes(cyl))+geom_bar(aes(fill=class),position = "dodge")#near eachother


#coordinates system 


#dplyr data manipulation &transformation.
#filter row
#select column
#arrange sort 
#mutate  add
#summarize
#group_by  grouping

#1
data(iris)
summary(iris)
View(iris)
View(filter(iris, Species=="setosa" & `Sepal.Length`>5))
#| &
View(filter(iris, `Sepal.Length`>5))
is.na(iris[3,"Species"])
#2
sorted=arrange(iris,Petal.Width)
View(arrange(iris,desc(Petal.Width)))
#desc(Petal.Length)

#3
frame3=select(iris, Sepal.Length,Petal.Width,Species)
View(frame3)
View(select(iris,Species,everything()))
#4 mutate
View(mutate(iris,Sepal.S = Sepal.Length *Sepal.Width))
#transmute hamoon ro faghat migire.

#5 summary
flower=group_by(iris,Species)
summarize(flower,mean_petal_width=mean(Petal.Width))
#pipe operation :then %>%
iris %>% group_by(Species) %>% summarize(flower,mean_petal_width=mean(Petal.Width))%>%
  filter(!is.na(Petal.Length)) %>% View()

#ungroup



