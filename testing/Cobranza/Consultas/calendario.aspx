<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendario.aspx.cs" Inherits="CobranzaALC.Cobranza.Consultas.calendario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Pruebas de Calendario</title>


    <link id="Link1" type="text/css" rel="stylesheet" href="../../js/Calendar/calendar-win2k-cold-1.css" />
    <script type="text/javascript" src="../../js/Calendar/calendar.js"></script>
    <script type="text/javascript" src="../../js/Calendar/lang/calendar-en.js"></script>
    <script type="text/javascript" src="../../js/Calendar/calendar-setup.js"></script>


</head>
<body>
    <form id="form1" runat="server">
    <br/><br/>
    
     Fecha :<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:ImageButton ID="btnCalendar1" runat="server" ImageUrl="~/images/calendar.gif"
                                        ToolTip="Ingresar fecha de inicio" />
                                        
     <script type="text/javascript">
         Calendar.setup({ inputField: "TextBox1", ifFormat: "%d/%m/%Y", button: "btnCalendar1", align: "Tr", singleClick: true });
    </script>
    </form>
</body>
</html>
