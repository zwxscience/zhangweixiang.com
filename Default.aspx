<%@ Page   Language="C#"   AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="zwx._Default" %>
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel = "Shortcut Icon" href="favicon.ico"/>
<title>此章微详</title>
    <link href="css/Site.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/updateResult.js"></script>
</head>
<script  type="text/javascript" >
    setTimeout("happy()", 100000);
    function happy() {
        window.location.href = 'private/index.html';
    }

</script>
<body onload="">
<form id="Form1" runat="Server">
<div class="main">
	 <h1>Hi，欢迎访问到这个地方。</h1>
<div>你一定是无意进入这里的吧，这里还没有建设好哦。</div>
 <div>你是这里的第<span class="red" style="margin: 10px;background: url(images/404/sky-background.png);"><%=visitCount%><%//System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase%></span>个访客哦。</div>



<div><a href="http://image.cnki.net" target="_blank">你可以看看我工作的网站</a></div>
<div>怎么样，上面的网站做的还不错吧</div>
<div>以后会在这里写一点文字，包括个人的研究、文学的感悟啥的</div>
<div style="margin-bottom: 20px;">尽可能写深入一点。否则就对不起这个网站的名字啦</div>
<div style="margin: 0 auto;  background: url(images/sky-shine.jpg);font-size: 32px; width: 160px;text-align: center;width: 200px;border-radius: 20px;text-shadow: 1px 1px 1px rgba(0,0,0,0.4);border-bottom: 3px solid rgba(255,255,255,0.5);-webkit-box-shadow: 10px 10px 7px rgba(0,0,0,.7);  box-shadow: 10px 10px 7px rgba(0,0,0,.7);  -webkit-transform: scale(1.25);  -moz-transform: scale(1.25);  -o-transform: scale(1.25);  position: relative;  -o-transform: rotate(0deg);  -webkit-transform: rotate(-5deg);  -moz-transform: rotate(0deg);">此章微详</div>
<div style="margin-top: 20px;">如果有什么建议的话记得<a href="Mailto:admin@zhangweixiang.com?CC=zwxscience@gmail.com&amp;Subject=some suggestions for zhangweixiang.com&amp;Body=Hello,Here is my suggestion:">给我发邮件</a> </div>
<div>在这个页面停一会，会有惊喜哦</div>
</div>
<div><a href="http://www.miitbeian.gov.cn/" style="font-size:small;bottom:5px; position:absolute; text-align:center; margin-left:50%">网站备案号京ICP备14023890号</a></div>

</form>
</body>
</html>
