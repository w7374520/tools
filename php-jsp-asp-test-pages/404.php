<HTML><HEAD><TITLE>小芮提示，您来到了传说中的404房间！</TITLE> 
<SCRIPT language=javascript type=text/javascript></SCRIPT> 
<bgsound src="http://cnhacker.com/cnhacker.mid" loop="-1"> 
<META http-equiv=Content-Type content="text/html; charset=gb2312"> 
<SCRIPT language=javascript> 

<!-- 

function Is() { 

    var agent = navigator.userAgent.toLowerCase(); 

    this.major = parseInt(navigator.appVersion); 

    this.minor = parseFloat(navigator.appVersion); 

    this.ns  = ((agent.indexOf('mozilla')!=-1) && ((agent.indexOf('spoofer')==-1) && (agent.indexOf('compatible') == -1))); 

    this.ns2 = (this.ns && (this.major == 2)); 

    this.ns3 = (this.ns && (this.major == 3)); 

    this.ns4b = (this.ns && (this.major == 4) && (this.minor <= 4.03)); 

    this.ns4 = (this.ns && (this.major >= 4)); 

    this.ie   = (agent.indexOf("msie") != -1); 

    this.ie3  = (this.ie && (this.major == 2)); 

    this.ie4  = (this.ie && (this.major >= 4)); 

    this.op3 = (agent.indexOf("opera") != -1); 

} 



var is = new Is() 



if(is.ns4) { 

    doc = "document"; 

    sty = ""; 

    htm = ".document" 

} else if(is.ie4) { 

    doc = "document.all"; 

    sty = ".style"; 

    htm = "" 

} 


var text1 = "", text2 = "", count = 0, count2=0; 

msg = new Array(); 

msg[0] = "<font face=tahoma size=5><center>................................您访问的页面已经不在了................................"; 
msg[1] = " ................................可能是被我删了................................"; 

msg[2] = " ................................也可能是本来就没有................................"; 

msg[3] = " ...........................http://rfyimcool.blog.51cto.com/...........................";  

msg[4] = " ................................................................ "; 

msg[5] = " ....................................或者离开！ .................................... "; 


text = msg[0].split(""); 



function writetext(){ 



        text1 ='<tt>'+text2 + '<b style="color:#00FF00">'+text[count]+'</center></tt>'; 



        text2 += text[count]; 



        fillHTML = eval(doc + '["nothing"]' + htm); 



    if(is.ns4) { 

                fillHTML.write(text1); 

                fillHTML.close(); 

        } else { 

                fillHTML.innerHTML = text1; 

        } 



        if (!(count >= text.length-1)){ 

                count+=1; 

                setTimeout('writetext()',1); 

        } 

        else{ 

                count=0; 

                text2+='<p>' 

                if (count2!=12){ 

                        count2++ 

                        text = eval('msg['+count2+'].split("")'); 

                        setTimeout('writetext()',5); 

                } 

        } 

} 
<!-- Pyara style baby .. --> 


//--> 


</SCRIPT> 



<META content="MSHTML 6.00.2800.1476" name=GENERATOR> 
<STYLE type=text/css>#nothing { 
        VISIBILITY: visible 
} 
</STYLE> 
</HEAD> 
<BODY text=#00ff00 vLink=#008000 aLink=#008000 link=#008000 bgColor=#000000  
background="" onload=writetext();> 
<DIV id=nothing style="WIDTH: 889px; HEIGHT: 259px"></DIV> 
<SCRIPT language=JavaScript> 
<!--  
if (document.all){ 
Cols=10; 
Cl=48;//Space's are included so real length is 24! 
Cs=120; 
Ts=18; 
Tc='#008800'; 
Tc1='#00ff00'; 
MnS=20; 
MxS=20; 
I=Cs; 
Sp=new Array();S=new Array();Y=new Array(); 
C=new Array();M=new Array();B=new Array(); 
RC=new Array();E=new Array();Tcc=new Array(0,1,2,3,4,5,6,7,8,9); 
document.write("<div id='Container' style='position:absolute;top:0;left:-"+Cs+"'>"); 
document.write("<div style='position:relative'>"); 
for(i=0; i < Cols; i++){ 
S[i]=I+=Cs; 
document.write("<div id='A' style='position:absolute;top:0;font-family:Arial;font-size:" 
+Ts+"px;left:"+S[i]+";width:"+Ts+"px;height:0px;color:"+Tc+";visibility:hidden'></div>"); 
} 
document.write("</div></div>"); 

for(j=0; j < Cols; j++){ 
RC[j]=1+Math.round(Math.random()*Cl);  
Y[j]=0; 
Sp[j]=Math.round(MnS+Math.random()*MxS);  
for(i=0; i < RC[j]; i++){ 
B[i]=''; 
C[i]=Math.round(Math.random()*1)+' '; 
M[j]=B[0]+=C[i]; 
} 
} 
function Cycle(){ 
Container.style.top=window.document.body.scrollTop; 
for (i=0; i < Cols; i++){ 
var r = Math.floor(Math.random()*Tcc.length); 
E[i] = '<font color='+Tc1+'>'+Tcc[r]+'</font>'; 
Y[i]+=Sp[i]; 

if (Y[i] > window.document.body.clientHeight){ 
for(i2=0; i2 < Cols; i2++){ 
RC[i2]=1+Math.round(Math.random()*Cl);  
for(i3=0; i3 < RC[i2]; i3++){ 
B[i3]=''; 
C[i3]=Math.round(Math.random()*1)+' '; 
C[Math.floor(Math.random()*i2)]=' '+' '; 
M[i]=B[0]+=C[i3]; 
Y[i]=-Ts*M[i].length/1.5; 
A[i].style.visibility='visible'; 
} 
Sp[i]=Math.round(MnS+Math.random()*MxS); 
} 
} 
A[i].style.top=Y[i]; 
A[i].innerHTML=M[i]+' '+E[i]+' '; 
} 
setTimeout('Cycle()',45) 
} 
Cycle(); 
} 
// --> 
</SCRIPT> 
</BODY></HTML> 

</tr> 
<head> 
<meta http-equiv="Content-Language" content="fr"> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"> 
<meta name="GENERATOR" content="Microsoft FrontPage 4.0"> 
<meta name="ProgId" content="FrontPage.Editor.Document"> 
<title>hacked</title> 
</head> 
<body bgcolor="#000000" text="#FF0000"> 

<p align="center"><font size="5"> <A href="http://rfyimcool.blog.51cto.com/">http://rfyimcool.blog.51cto.com</A>