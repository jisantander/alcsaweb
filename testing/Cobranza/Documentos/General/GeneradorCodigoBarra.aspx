<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneradorCodigoBarra.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.General.GeneradorCodigoBarra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 100%; border: 2px solid #000;">
                <tr>
                    <td style="width: 30%; padding: 10px 0 10px 0;" align="center">
                        <asp:Image ID="imgCodigoBarra" runat="server" Width="95%" />
                    </td>
                    <td style="width: 70%; padding: 10px 0 10px 10px;" valign="top">
                        <asp:Image ID="imgCodigoQr" runat="server" Width="80px" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%; padding: 10px 0 10px 0;" align="center">
                        <asp:Label ID="lblTexto" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="width: 70%; padding: 10px 0 10px 10px;" valign="top">

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
