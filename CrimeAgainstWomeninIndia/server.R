library(reshape2)
library(ggplot2)
library(gridExtra)
options(scipen=999)



shinyServer(
    
    function(input,output)
    {
        output$plot1<-renderPlot({
            
            
        ggplot(s,aes(x=as.numeric(Year),y=s[,13]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("TOTAL CRIME ON WOMEN")
            
        })
        
        output$plot2<-renderPlot({ 
            
            m<-melt(x)
            ggplot(m,aes(x=variable,y=value,group=CRIME.HEAD,color=CRIME.HEAD))+geom_point()+geom_line()+xlab("Year") + ggtitle("CRIME AGAINST WOMEN")+ theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
            })
        
        output$plot3<-renderPlot({
            
            ggplot(s,aes(x=as.numeric(Year),y=s[,4]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("CRUELTY BY HUSBAND OR HIS RELATIVES")
        })
        
        
        output$plot4<-renderPlot({ 
            
            p1<-ggplot(s,aes(x=as.numeric(Year),y=s[,6]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("DOWRY PROHIBITION ACT")
            
            p2<-ggplot(s,aes(x=as.numeric(Year),y=s[,5]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("DOWRY DEATHS")

            grid.arrange(p1,p2,ncol=2)  
        })
        
        output$plot5<-renderPlot({
            
            ggplot(s,aes(x=as.numeric(Year),y=s[,11]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("KIDNAPPING AND ABDUCTION OF WOMEN")
            
                    })
        
        output$plot6<-renderPlot({
            
            b<-(barplot(m[,2],names.arg=m$Age_Group,col="green",ylim=c(0,5000),xlab="Category",ylab="Number",main="Murder of Women/Girls by Age(2013)"))
            
            text(b,m[,2]+500,labels=as.character(m[,2]))
            
        })
        
        output$plot7<-renderPlot({
            
            
            p1<-ggplot(s,aes(x=as.numeric(Year),y=s[,12]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("TOTAL RAPE ON WOMEN")
    
            
            p2<-ggplot(r,aes(as.factor(r[,1]),y=r[,2]))+geom_bar(stat="identity",fill="#FF9999",colour="black")+geom_text(data=r,aes(label=r[,2]),vjust=-1)+ylim(0,20000)+xlab("Category")+ylab("Number of Cases")+ggtitle("Relation of offenders to the Rape Victims(for 2013)")+theme(axis.text.x=element_text(angle=90,hjust=1))
            grid.arrange(p1,p2,ncol=2)
    })
    
    output$plot8<-renderPlot({
    
        mb<-melt(inc,id.var="YEAR")
        ggplot(mb,aes(as.factor(YEAR),value),group=1)+geom_bar(aes(fill=variable),position="dodge",stat="identity")+xlab("YEAR")+ylab("Number")+ggtitle("INCEST RAPES SCENARIO")
            
    })
    
    output$plot9<-renderPlot({
        p1<-ggplot(s,aes(x=as.numeric(Year),y=s[,10]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("INSULT TO THE MODESTY OF WOMEN")
        
        p2<-ggplot(s,aes(x=as.numeric(Year),y=s[,9]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("INDECENT REPRESENTATION OF WOMEN")
        
        p3<-ggplot(s,aes(x=as.numeric(Year),y=s[,8]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("IMPORTATION OF GIRLS FROM FOREIGN COUNTRY")
        
        p4<-ggplot(s,aes(x=as.numeric(Year),y=s[,7]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("IMMORAL TRAFFIC (PROSTITUTION)")
        
        p5<-ggplot(s,aes(x=as.numeric(Year),y=s[,3]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("COMMISION OF SATI")
        
        p6<-ggplot(s,aes(x=as.numeric(Year),y=s[,2]))+geom_point()+geom_line()+scale_y_continuous(expand=c(0,0))+scale_x_continuous(expand=c(0,0))+xlab("Year")+ylab("Number")+ggtitle("ASSAULT ON WOMEN WITH INTENT TO OUTRAGE HER MODESTY")
        
        grid.arrange(p1,p2,p3,p4,p5,p6)
    })
    
       
        
    }
)