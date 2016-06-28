<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvisoTerminoDeJuicio.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosCuatro.AvisoTerminoDeJuicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: left; font-family: Verdana;">
                Santiago,
                <asp:Label ID="lblFecha" runat="server" EnableViewState="False"></asp:Label>
            </p>
            <br />
            <br />
            <p style="text-align: left; font-family: Verdana;">
                Señor
            <br />
                Procurador
            <br />
                Presente
            </p>
            <br />
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Por intermedio de la presente, le informo a usted que nuestro cliente a procedido a poner término al presente juicio, por la siguiente razón:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <table cellpadding="0" cellspacing="0" border="1" style="width: 100%;">
                    <tr>
                        <td style="width: 30%; font-weight: bold; text-align: center;">Juzgado</td>
                        <td style="width: 20%; font-weight: bold; text-align: center;">Rol</td>
                        <td style="width: 50%; font-weight: bold; text-align: center;">Partes</td>
                    </tr>
                    <tr>
                        <td style="width: 30%; text-align: center;">
                            <asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                        <td style="width: 20%; text-align: center;">
                            <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                        <td style="width: 50%; text-align: center;">
                            <asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label>
                            <br />
                            <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </p>
            <br />
            <p style="text-align: left; font-family: Verdana;">
                Rut:
                <asp:Label ID="lblDeudorUno" runat="server" EnableViewState="False"></asp:Label>
            </p>
            <br />
            <p style="text-align: left; font-family: Verdana;">
                RAZÓN DEL TÉRMINO:_______________________________________________________
            </p>
            <br />
            <p style="text-align: left; font-family: Verdana;">
                En virtud de lo anterior, este juicio no puede seguir tramitándose y además se debe informar en el sistema ALCSA el motivo del término utilizando para ello el subtrámite creado para tal efecto y eventualmente proceder a tramitar el avenimiento o presentar el escrito dando cuenta de pago para poner término al juicio.
            </p>
            <br />
            <p style="text-align: left; font-family: Verdana;">
                También solicito por esta misma vía, comunicar este término al receptor judicial correspondiente para que se abstenga de seguir realizando diligencias en este juicio.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Atte.-
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>José Santander Robles</strong>
                <br />
                Abogado
            </p>
        </div>
    </form>
</body>
</html>
