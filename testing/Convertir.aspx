<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Convertir.aspx.cs" Inherits="CobranzaALC.Convertir" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Utilidades ALC</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
      <h1>UTILIDAD ALC</h1>
    </center>
    <br/><br/><br/><br/><br/>
        Ingrese Número&nbsp;:
        <asp:TextBox ID="TextBox1" runat="server" Width="337px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Traducir" onclick="Button1_Click" />
        <br/><br/><br/>
        Traducción&nbsp;:<br/><br/>
        <asp:Label ID="Label1" runat="server" ></asp:Label>
        <br/>
        
        
    
    </div>
    </form>
</body>
</html>
