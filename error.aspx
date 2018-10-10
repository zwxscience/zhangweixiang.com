<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>错误页</title>
</head>
<body>
    <form id="form1" runat="server">
   <div> 

您使用了不安全的操作，请确认后重新执行 .... 

</div> 

<div style="color:#ffffff;"> 

<asp:Literal ID="Literal1" runat="server"></asp:Literal> 

</div> 

    </form>
</body>
</html>
