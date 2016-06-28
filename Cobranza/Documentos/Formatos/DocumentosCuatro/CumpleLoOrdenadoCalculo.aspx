<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CumpleLoOrdenadoCalculo.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosCuatro.CumpleLoOrdenadoCalculo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: left; font-family: Verdana;"><strong>CUMPLE LO ORDENADO 
            </strong>
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <strong>S. J. L. (<asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>).-</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>JOSÉ SANTANDER ROBLES,</strong> por la parte demandante en los autos caratulados <strong>&quot;<asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label>&nbsp;</strong>con <strong>
                    <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label>&quot;</strong>, Rol Nº <strong>C-
                        <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label></strong>, cuaderno principal a US. respetuosamente digo:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Que atendido al mérito de autos; doy cumplimiento a lo ordenado por S.S., por resolución de fecha ___________, rolante a fojas ____________, de acuerdo a lo siguiente:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                El deudor suscribió el pagare acompañado en la demanda por la suma de $__________, pagadero a _____ cuotas, con vencimiento la primera de ellas el día ________________________.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Es del caso S.S., que el ejecutado dejo de pagar la cuota Número ____, cuyo vencimiento fue el día _______________________, en consecuencia solo pagó ____cuotas quedando impagas las ____ cuotas restantes.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                La operación aritmética para arribar al monto demandado en autos es la siguiente: Dividido el capital por el total de cuotas nos da el<strong> valor cuota sin intereses</strong>, por la suma de $_________.-; cada una de las cuales, multiplicado por el número de cuotas impagas nos da la suma a demandar  por $_____________.-, correspondiente solo al capital; cantidad, por la cual, se debe despachar mandamiento de ejecución y embargo.
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>Ruego a S.S</strong>., Tener por cumplido lo ordenado, modificando la demanda en todo lo señalado, ordenando se despache mandamiento de ejecución y embargo por la suma de $ _______________, más intereses, reajustes y costas reajustes.
            </p>
        </div>
    </form>
</body>
</html>
