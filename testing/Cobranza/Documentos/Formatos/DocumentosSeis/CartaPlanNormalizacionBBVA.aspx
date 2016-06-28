<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartaPlanNormalizacionBBVA.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosSeis.CartaPlanNormalizacionBBVA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: right; font-family: Verdana;">
                Santiago, <asp:Label ID="lblFecha" runat="server" EnableViewState="False"></asp:Label>
            </p>
            <br />
            <p style="text-align: left; font-family: Verdana;">
                Señor<br />
                <asp:Label ID="lblNombreDeudor" runat="server" EnableViewState="False"></asp:Label>
            </p>
            <br />
            <p style="text-align: left; font-family: Verdana;">
                Presente
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>Ref.: Plan Normalización BBVA.</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                De nuestra consideración:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Por instrucciones de nuestro cliente Banco BBVA, solicitamos a Usted se sirva tomar contacto con nuestro Estudio Jurídico, quien tiene a su cargo la cobranza judicial de su crédito.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                El objetivo es informarle personalmente, una alternativa <strong>real de normalización </strong>de su deuda que el Banco le ofrece, la que estimamos le será muy conveniente para solucionar definitivamente su caso.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Para hacer efectiva esta propuesta, deberá agendar una reunión con nuestro Subgerente de Normalización don Juan Mödinger Merino, al correo jmodinger@alcsa.cl, o también puede concurrir a nuestra oficina ubicada en Huérfanos 1117 oficina 415 Santiago Centro, teléfono 22699 3161 – 22633 3115
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Sin otro particular, le saluda atentamente.
            </p>
            <br />
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>José Santander Robles.</strong><br />
				           <strong>Abogado.</strong>
            </p>
        </div>
    </form>
</body>
</html>
