library(reshape2)
library(ggplot2)
library(gridExtra)

wc<-read.csv("WC.csv")

shinyServer(
    
    function(input,output)
    {
        output$plot1<-renderPlot({
            
            par(mfrow=c(2,2))
            
            x1<-barplot(wc$WINNZ,names.arg=wc[,1],col="red",ylim=c(0,80),xlab="Team",ylab="Win%",main="Winning record for last 13 years in New Zealand ")
            
            text(x1,wc$WINNZ+6,labels=as.character(wc$WINNZ))
            
            x2<-barplot(wc$WINAUS,names.arg=wc[,1],col="orange",ylim=c(0,80),xlab="Team",ylab="Win%",main="Winning record for last 13 years in Australia ")
            
            text(x2,wc$WINAUS+6,labels=as.character(wc$WINAUS))
            
            x3<-barplot(wc$WINNZ_AUS,names.arg=wc[,1],col="green",ylim=c(0,80),xlab="Team",ylab="Win%",main="Overall record for last 13 years in Australia and Newzealand ")
            y<-wc$WINNZ_AUS
            
            text(x3,wc$WINNZ_AUS+6,labels=as.character(wc$WINNZ_AUS))
        })
        
        output$plot2<-renderPlot({
            
            ddf<-subset(wc,select=c(Team,WIN2011,WIN2012,WIN2013,WIN2014))
            mm=melt(ddf)
            
            
            p1<-ggplot(mm,aes(x=variable,y=value,group=Team,color=Team))+geom_point()+geom_line()+ylab("WIN %") + ggtitle("Winning pattern since 2011") +xlab("Year")
            p2<-ggplot(data=wc,aes(x=Team,y=TOTALWIN,fill=Team))+geom_bar(stat="identity",colour="white")+geom_text(aes(label=TOTALWIN),size=4) +ggtitle("Winning record of last four years")
            
            
            grid.arrange(p1,p2,ncol=2)
        })
    
        
        output$plot3<-renderPlot({ 
            
            x<-barplot(wc$WINWC,names.arg=wc[,1],col="yellow",ylim=c(0,80),xlab="Team",ylab="Win%",main=" WORLD CUP PERFORMANCE OF RESPECTIVE TEAMS ")
            text(x,(wc$WINWC)+4,labels=as.character(wc$WINWC))
            
            })
        
        output$plot4<-renderPlot({
            
            x4<-barplot(wc$TOTALWINPERCENT,names.arg=wc[,1],col="blue",ylim=c(0,80),xlab="Team",ylab="Win%",main=" PREDICTIVE WIN PERCENTAGE FOR WORLD CUP 2015 ")
            text(x4,(wc$TOTALWINPERCENT)+4,labels=as.character(wc$TOTALWINPERCENT))
        })
        
        output$val1<-renderPrint({c("Top 4 team records in New Zealand: 1) AUSTRALIA 2) NEW ZEALAND 3) SOUTH AFRICA 4) SRI LANKA", 
                                    "Top 4 team records in Australia 1) AUSTRALIA 2) SoUTH AFRICA 3) INDIA 4) SRI LANKA",
                                    "Top 4 team records at both veneues 1) AUSTRALIA 2) SOUTH AFRICA 3) NEW ZEALAND 4) INDIA " ) })
   
        output$val2<-renderPrint({"Top 4 team records since last four years : 1)INDIA 2) SOUTH AFRICA 3) AUSTRALIA 4) PAKISTAN" 
                                    
                                    })
    
        output$val3<-renderPrint({"Top 4 team records in WORLD CUPS: 1) AUSTRALIA 2) PAKISTAN 3) SOUTH AFRICA 4) WEST INDIES"
                                    })
        
        output$val4<-renderPrint({"Top 4  teams for World Cup 2015: 1) AUSTRALIA 2) SOUTH AFRICA 3) INDIA 4) NEW ZEALAND"
                                    })
        
    }
        )