a <- c(1:6)
b <- factor(c("Good","Bad","Ugly","Bad","Bad"))
a1 <- as.numeric(a)
length(a1)
ab <- c(1,2,3,5,3,32,3,4,5,6,6,54,4,3,22,234)
ab[c(1,length(ab))]

test <- rep(1:10,by=2,each=3,times=2) 
test
test
seq(1,10,by=2) ->odds
letters[runif(10,min=1,max=26)]

#find and remove missing values
a
a[3] <- NA
a
na.omit(a)


a <- c(1:6)
b <- c(5:10)
1 %in% a
a %in% b
is.element(a,b)

union(a,b)
intersect(a,b)
unique(c(a,b))


#get non-repeating elements of a and b

a <- c(11:15)
b = c(13:17)
c <- union(a,b)
i <- intersect(a,b)

setdiff(c,i)

#random sampling

a <- c(1:60)
a
sample(a)
sample(a,replace=TRUE) #replacing the numbers once selected, so can get duplicates

args(sample)

example(sample)

#sorting

sort(b)
sort(b, decreasing = TRUE)

rev(b)

order(b)
ab[order(ab)]

a <- c(1:round(runif(1,min=100,max=150)))
b<-sort(sample(a,length(a) %% 5,replace=TRUE),decreasing=TRUE)
b
a
length(a)
divv <- round(length(a) / 5)
b<-sort(sample(a,divv,replace=TRUE),decreasing=TRUE)
b

#checking conditions

person <- 31
if(person >= 18){
  print("Allow")
}
else
{print("Don't allow")
}
person<- 16 


grp1 <- round(runif(30,10,40))
grp1
any(grp1 , 18)

if(any(grp1 <18)){
  print("Allow")
}
else
{
  print("Don't allow")
}


if(all(grp1 >=10)){
  print("Allow")
} else {
  print("Don't allow")
}

#for multiple levels - against all the elements

output <- ifelse(grp1 >10 | grp1 <18,"Allow","Don't allow") 
output

kids <- c(1:20,min=1,max=6)
kids <- round(runif(20,1,6))
kids
status <- ifelse(kids>=3,"Paid","Free")
status

#loops proper
vec<-c(1:15)
total<- 1

for(i in vec){
 total<-total * i 
}
vec
total

options(scipen=999) #to get rid of the scientific number notation E
total

vec<-c(1:15)
total<- 1

for(i in vec){
  if(i %%2==0){
    total<-total * i
  } 
}
total



total<- 1

for(i in seq(2,15,by=2)){
    total<-total * i
}
total

#break out of loop if needed
total<- 1

for(i in seq(2,15,by=2)){
  total<-total * i
  if(i==8){
    break
  }
}
total

#to skip
total<- 1

for(i in seq(2,15,by=2)){
  if(i==8){
    next
  }
  total<-total * i
}
total

a <- letters
a
for(i in a){
  print(i)
}



#DATAFRAMES
a <-c(1,2,3,4,NA)
b<-c(6,7,8,NA,10)
c<-c(11,12,NA,14,15)
d<-c(16,NA,18,19,20)
e<-c(21,22,23,24,25)

df <- data.frame(a,b,c,d,e)
nrow(df)
ncol(df)

df1<-stack(df) #ind created

rdf <- rbind(df,df,df) #row bind, appends arguments into it
rdf
cdf<-cbind(df,df,df)
cdf
class(df)
head(rdf,3)
tail(rdf,4)

str(rdf) 
class(rdf$a)

which(rdf$e > 22)
rdf[which(rdf$e > 22),] #return rows
z<-which(names(rdf)%in% c("c","d"))
rdf[,which(names(rdf)%in% c("c","d"))]
rdf[, z]
rdf
which(rdf[,5] > 22) == which(rdf$e >22)


#sort dataframe

rdf[order(rdf$e),]
rdf[rev(order(rdf$e)),]

attach(rdf) #adds the cols to environemnt so you don't need rdf$columnname - careful of existing variables (like here!)

#matrices

m1<-matrix(1:100,nrow=10)
m1

class(m1)

#summary

summary(rdf)
names(rdf)
colnames(rdf)
rownames(rdf)
colnames(rdf) <- c("a1","b1","c1","d1","e1")
rdf
View(rdf)

#Transpose
trdf<-t(rdf)
trdf
class(rdf)

#remove rows with missing values (NAs)

ref_n<-na.omit(rdf)
ref_n

rdf[4,]
rdf[c(4,5),c(2,3,5)]
rdf$a1

#practicing

a<-c(round(runif(100,min=1,max=10)))
b<-c(round(runif(100,min=1,max=10)))
c<-c(round(runif(100,min=1,max=10)))
d<-c(round(runif(100,min=1,max=10)))
e<-c(round(runif(100,min=1,max=10)))
df<-data.frame(cbind(a,b,c,d,e))
df
class(df)



df[sample(1:100,5),1] <- NA
df[sample(1:100,5),2] <- NA
df[sample(1:100,5),3] <- NA
df[sample(1:100,5),4] <- NA
df[sample(1:100,5),5] <- NA

df

#same with a loop

for(colnum in c(1:ncol(df))){
  df[sample(1:100,5),colnum] <- NA
}
summary(df)

df[is.na(df$a),]
which(is.na(df$a))


#sorting levels in the dataframe

df[order(df$a, -df$b),] #a ascending, b descending (-)

#Practice3 top 2
library(datasets)
?USArrests

View(USArrests)
df
ansa <- df[1:length(df$Murder*0.25),]

#or

numrows <- (nrow(df)*0.25)
df[c(1:round(numrows)),]

df[,]