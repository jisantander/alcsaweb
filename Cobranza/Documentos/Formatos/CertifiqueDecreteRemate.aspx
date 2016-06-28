<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CertifiqueDecreteRemate.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.CertifiqueDecreteRemate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: justify; font-family: Verdana;"><strong>EN LO PRINCIPAL: SE CERTIFIQUE; EN EL OTROSÍ: SE DECRETE REMATE.</strong></p>
            <p style="text-align: center; font-family: Verdana;">
                <strong>S. J. L. (<asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>).-</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>JOSÉ SANTANDER ROBLES,</strong> por la parte demandante en los autos caratulados <strong>
                    <asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label></strong> con <strong>
                        <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label></strong>, Rol Nº <strong>
                            C-
                            <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label></strong>, cuaderno principal a US. respetuosamente digo:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Que vengo en solicitar a US. se sirva ordenar se certifique por el Secretario del Tribunal, como es efectivo que el requerido no ha consignado fondos para el pago de las sumas cobradas en autos, no ha objetado la liquidación de la deuda hipotecaria y que el plazo para hacerlo se encuentra vencido.
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO;</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>Sírvase US.</strong> acceder a la certificación solicitada.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>EN EL OTROSÍ:</strong> En conformidad con lo establecido en el ART.103 de la Ley General de Bancos y en mérito de los antecedentes de autos, vengo en solicitar a S.S., se sirva ordenar el remate del inmueble hipotecado, de propiedad del deudor.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>Sírvase US.</strong> acceder a lo solicitado, ordenando el remate de autos.
            </p>
        </div>
    </form>
</body>
</html>
