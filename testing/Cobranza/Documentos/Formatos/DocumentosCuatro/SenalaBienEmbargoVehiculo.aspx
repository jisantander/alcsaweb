<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SenalaBienEmbargoVehiculo.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosCuatro.SenalaBienEmbargoVehiculo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>EN LO PRINCIPAL: SEÑALA BIEN PARA LA TRABA DE EMBARGO; EN EL PRIMER OTROSI: SE TRABE EMBARGO NOTIFICANDO A REGISTRO CIVIL; EN EL SEGUNDO OTROSI: ACOMPAÑA DOCUMENTO.-
                </strong>
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>S. J. L. (<asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>).-</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>JOSÉ SANTANDER ROBLES,</strong> por la parte demandante en los autos caratulados <strong>&quot;<asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label>&nbsp;</strong>con <strong>
                    <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label>&quot;</strong>, Rol Nº <strong>C-
                        <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label></strong>, cuaderno apremio a US. respetuosamente digo:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Que vengo, en señalar como bien para la traba de embargo el vehículo consistente en _______________________, placa patente ______________, Marca ____________, modelo __________________, año de fabricación ____________  de propiedad del demandado.
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO,</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>RUEGO A US.</strong> tener por señalado el bien para la traba de embargo.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSI:</strong> Sírvase SS. Disponer se proceda al embargo del vehículo señalado anteriormente disponiendo que se efectúe mediante la notificación que efectúe el señor receptor judicial, al Registro Nacional de Vehículos Motorizados del Registro Civil e Identificación.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SEGUNDO OTROSI:</strong> Sírvase SS. tener por acompañado certificado de anotaciones del vehículo señalado para la traba de embargo en el cual consta que es de propiedad del demandado.
            </p>
        </div>
    </form>
</body>
</html>
