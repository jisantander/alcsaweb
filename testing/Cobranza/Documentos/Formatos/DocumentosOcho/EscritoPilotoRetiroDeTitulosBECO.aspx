<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EscritoPilotoRetiroDeTitulosBECO.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosOcho.EscritoPilotoRetiroDeTitulosBECO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: justify; font-family: Verdana;"><strong>EN LO PRINCIPAL: </strong>Da cuenta de pago de cuotas morosas y comunica acuerdo extrajudicial.<strong> OTROSÍ: </strong>Solicita devolución de documentos y archivo. 
            
        <p style="text-align: center; font-family: Verdana;">
            <strong>S. J. L. (<asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>).-</strong>
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong>JOSÉ SANTANDER ROBLES,</strong> por la parte demandante en los autos caratulados <strong>&quot;<asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label>&nbsp;</strong>con <strong>
                <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label>&quot;
            </strong>, Rol Nº <strong>
                C-
                <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label>
            </strong>, cuaderno principal a US. respetuosamente digo:
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            Que vengo en hacer presente a S.S. que el demandado(a) don(ña)
            <asp:Label ID="Label1" runat="server" EnableViewState="False"></asp:Label>&quot; 
            ha pagado extrajudicialmente a mi representado <strong><u>parte de la deuda que mantenía en mora,</u></strong> razón por la cual mi representado –en su calidad de titular del crédito cobrado en este juicio- ha aceptado dicho acuerdo.
            En mérito de lo expuesto, pido a S.S. se sirva dar por terminado el presente juicio, en atención a que la parte ejecutada continuará con el servicio extrajudicial normal de su deuda, en los términos establecidos en el título ejecutivo.
        </p>
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>POR TANTO,</strong>
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong>A S.S. PIDO</strong> acceder a lo solicitado.
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong><u>OTROSÍ:</u></strong> Solicito a S.S. se sirva ordenar la devolución de los documentos <u>a esta parte ejecutante</u> y se ordene el archivo de estos autos.
        </p>
        
    </form>
</body>
</html>

