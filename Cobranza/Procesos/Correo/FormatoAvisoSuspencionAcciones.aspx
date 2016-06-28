<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormatoAvisoSuspencionAcciones.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Correo.FormatoAvisoSuspencionAcciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: center; font-family: Verdana;">
            <strong>AVISO DE SUSPENSION DE ACCIONES</strong>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            FECHA:
            <asp:Label ID="lblFecha" runat="server"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            REF.: SOLICITA SUSPENDER ACCIONES JUDICIAL DEL JUICIO
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <asp:Label ID="lblCliente" runat="server"></asp:Label>
            &nbsp;con 
            <asp:Label ID="lblDeudor" runat="server"></asp:Label>
            ,rut:
            <asp:Label ID="lblRutDeudor" runat="server"></asp:Label>
            , ROL:
            <asp:Label ID="lblRolJuicio" runat="server"></asp:Label>
            , TRIBUNAL: 
            <asp:Label ID="lblTribunalJuicio" runat="server"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            EXHORTO ASOCIADO:
            <asp:Label ID="lblTituloExhorto" runat="server" Visible="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <asp:Label ID="lblTextoExhorto" runat="server"></asp:Label>
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            Mucho les agradeceré, proceder a la suspensión del juicio y del exhorto de la referencia, atendido que nuestro cliente nos ha instruido iniciar el proceso de término de las acciones judiciales y/o la suspensión de las mismas.
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            En virtud de ello, procede que a partir de esta fecha no se realicen nuevas diligencias en esta causa tendientes a su prosecución y que generen nuevos gastos.-
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            En caso que el Sr. Receptor Judicial, mantenga el expediente en su poder, le agradeceremos proceder con su devolución a los Tribunales, sin realizar nuevas gestiones e informarnos las ya realizadas.-
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            Atte.-
        </p>
        <br />
        <p style="text-align: center; font-family: Verdana;">
            José Santander Robles
        </p>
        <p style="text-align: center; font-family: Verdana;">
            Abogado
        </p>
    </form>
</body>
</html>
