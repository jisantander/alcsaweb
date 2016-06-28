<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="09_PreparacionNotificacionProtestoDeCheque.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Formatos._09_PreparacionNotificacionProtestoDeCheque" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                <tr>
                    <td style="width: 30%">PROCEDIMIENTO</td>
                    <td style="width: 70%">:&nbsp;EJECUTIVO</td>
                </tr>
                <tr>
                    <td style="width: 30%">MATERIA</td>
                    <td style="width: 70%">:&nbsp;COBRO DE PAGARÉ</td>
                </tr>
                <tr>
                    <td style="width: 30%">DEMANDANTE</td>
                    <td style="width: 70%">:&nbsp;<asp:Label ID="lblNombreCliente" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%">RUT</td>
                    <td style="width: 70%">:&nbsp;<asp:Label ID="lblRutCliente" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%">ABOGADO PATROCINANTE</td>
                    <td style="width: 70%">:&nbsp;JOSE SANTANDER ROBLES</td>
                </tr>
                <tr>
                    <td style="width: 30%">RUT</td>
                    <td style="width: 70%">:&nbsp;10.050.813-3</td>
                </tr>
                <tr>
                    <td style="width: 30%">APODERADO</td>
                    <td style="width: 70%">:&nbsp;CLAUDIO VILLARROEL MELENDEZ</td>
                </tr>
                <tr>
                    <td style="width: 30%">RUT</td>
                    <td style="width: 70%">:&nbsp;10.650.279-K</td>
                </tr>
                <tr>
                    <td style="width: 30%">DEMANDADO</td>
                    <td style="width: 70%">:&nbsp;<asp:Label ID="lblNombreDeudor" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%">RUT</td>
                    <td style="width: 70%">:
                        <asp:Label ID="lblRutDeudor" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                <tr>
                    <td style="width: 30%">EN LO PRINCIPAL</td>
                    <td style="width: 70%">:&nbsp Citación a confesar deuda</td>
                </tr>
                <tr>
                    <td style="width: 30%">PRIMER OTROSI</td>
                    <td style="width: 70%">:&nbsp Acompaña documento, con citación.</td>
                </tr>
                <tr>
                    <td style="width: 30%">SEGUNDO OTROSI</td>
                    <td style="width: 70%">:&nbsp Acompaña personería, con citación.</td>
                </tr>
                <tr>
                    <td style="width: 30%">TERCER OTROSI</td>
                    <td style="width: 70%">:&nbsp Patrocinio y poder.</td>
                </tr>
            </table>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                PREGUNTAR POR ESTE FORMATO...

            </p>
        </div>
    </form>
</body>
</html>
