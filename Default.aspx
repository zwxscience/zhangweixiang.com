<%@ Page   Language="C#"   AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="zwx._Default" %>
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel = "Shortcut Icon" href="favicon.ico"/>
<title>����΢��</title>
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
	 <h1>Hi����ӭ���ʵ�����ط���</h1>
<div>��һ���������������İɣ����ﻹû�н����Ŷ��</div>
 <div>��������ĵ�<span class="red" style="margin: 10px;background: url(images/404/sky-background.png);"><%=visitCount%><%//System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase%></span>���ÿ�Ŷ��</div>



<div><a href="http://image.cnki.net" target="_blank">����Կ����ҹ�������վ</a></div>
<div>��ô�����������վ���Ļ������</div>
<div>�Ժ��������дһ�����֣��������˵��о�����ѧ�ĸ���ɶ��</div>
<div style="margin-bottom: 20px;">������д����һ�㡣����ͶԲ��������վ��������</div>
<div style="margin: 0 auto;  background: url(images/sky-shine.jpg);font-size: 32px; width: 160px;text-align: center;width: 200px;border-radius: 20px;text-shadow: 1px 1px 1px rgba(0,0,0,0.4);border-bottom: 3px solid rgba(255,255,255,0.5);-webkit-box-shadow: 10px 10px 7px rgba(0,0,0,.7);  box-shadow: 10px 10px 7px rgba(0,0,0,.7);  -webkit-transform: scale(1.25);  -moz-transform: scale(1.25);  -o-transform: scale(1.25);  position: relative;  -o-transform: rotate(0deg);  -webkit-transform: rotate(-5deg);  -moz-transform: rotate(0deg);">����΢��</div>
<div style="margin-top: 20px;">�����ʲô����Ļ��ǵ�<a href="Mailto:admin@zhangweixiang.com?CC=zwxscience@gmail.com&amp;Subject=some suggestions for zhangweixiang.com&amp;Body=Hello,Here is my suggestion:">���ҷ��ʼ�</a> </div>
<div>�����ҳ��ͣһ�ᣬ���о�ϲŶ</div>
</div>
<div><a href="http://www.miitbeian.gov.cn/" style="font-size:small;bottom:5px; position:absolute; text-align:center; margin-left:50%">��վ�����ž�ICP��14023890��</a></div>

</form>
</body>
</html>
