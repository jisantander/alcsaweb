<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransaccionPutBbva.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosSeis.TransaccionPutBbva" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: center; font-family: Verdana;">
                <strong>TRANSACCIÓN</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                En 
                Santiago, a 
                <asp:Label ID="lblFecha" runat="server" ClientIDMode="Static" EnableViewState="False"></asp:Label>
                &nbsp;entre don(ña) 
                <asp:Label ID="lblDeudor" runat="server" ClientIDMode="Static" EnableViewState="False"></asp:Label>
                &nbsp;Nacionalidad _______________,profesión u oficio _______________ estado civil _______________, cédula nacional de identidad  
                <asp:Label ID="lblRut" runat="server" ClientIDMode="Static" EnableViewState="False"></asp:Label>
                &nbsp;domiciliado en   
                <asp:Label ID="lblDomicilio" runat="server" ClientIDMode="Static" EnableViewState="False"></asp:Label>
                &nbsp;comuna de  
                <asp:Label ID="lblComuna" runat="server" ClientIDMode="Static" EnableViewState="False"></asp:Label>
                &nbsp;ciudad de _______________ en adelante el deudor; y don Alberto Javier Oviedo Obrador, chileno, casado, ingeniero comercial, cédula nacional de identidad número 10.382.134-7 y doña Paulina Musalem Said,  chilena, casada, ingeniero comercial, cédula nacional de identidad número  7.811.774-5, ambos en nombre y representación del BANCO BILBAO VIZCAYA ARGENTARIA, CHILE, sociedad anónima bancaria, rol único tributario N° 97.032.000-8, todos con domicilio en Santiago, calle Alfredo Barros Errázuriz N° 1953, piso 8, comuna de Providencia, Santiago, los comparecientes mayores de edad, quienes han convenido la siguiente transacción.  
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                PRIMERO: El Banco Bilbao Vizcaya Argentaría, Chile pretende tener en contra del deudor el derecho a cobro del (los) crédito (s) registrados en el Banco bajo el (los) número (s) de operación [te   ], y el derecho de cobrar asimismo gastos operacionales y/o judiciales registrados bajo la cuenta individual número ________________ todo lo cual, según liquidación practicada por el Banco a la fecha de la presente transacción asciende a un total de $ _______________.- nominales, que a la fecha se mantienen impagos.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                SEGUNDO: Por su parte el deudor pretende tener derecho a excepcionarse del pago, derecho que es incompatible con el de su contraparte.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                TERCERO: Considerando las actuales circunstancias de las operaciones adeudadas, la capacidad de pago del deudor, los eventuales bienes susceptibles de responder al pago y el eventual éxito de las acciones judiciales, con el fin de de precaver un eventual litigio futuro y/o de poner término a cualquier acción judicial pendiente entre las partes respecto las sumas de dinero referidas en la cláusula primera, el Banco y el deudor han acordado transigir tales obligaciones y gastos, dándolos por íntegramente extinguidos con el pago de la suma única y total de $ _______________ que el deudor paga íntegramente al Banco en este acto y que éste último declara aceptar y recibir como pago único y total de las mismas obligaciones y gastos, que por consiguiente declara íntegramente extinguidos. 
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                CUARTO: Ambas partes renuncian a toda clase de acciones que recíprocamente pudieren competerles, emanadas de los derechos mencionados en las cláusulas anteriores, otorgándose amplio y completo finiquito en relación a los mismos.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                La personería de don Alberto Javier Oviedo Obrador y de doña Paulina Musalem Said, para actuar en representación del Banco Bilbao Vizcaya Argentaría, Chile consta de las escrituras públicas de fecha 10 de Marzo 2008 otorgada en la notaría de Santiago de don Eduardo Avello Concha y de fecha 5 de Octubre de 1999 extendida en la notaría de Santiago de don José Musalem Saffie, respectivamente, que no se insertan por ser conocidas de las partes y del notario que autoriza.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                En comprobante firman:
            </p>

            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center" width="50%">&nbsp;</td>
                    <td align="center" width="50%">
                        <br />
                        <br />
                        __________________________________<br />
                        <asp:Label ID="lblDeudor1" runat="server" ClientIDMode="Static" EnableViewState="False"></asp:Label>
                        &nbsp;<br />
                        RUT: 
                <asp:Label ID="lblRut1" runat="server" ClientIDMode="Static" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%">
                        <br />
                        <br />
                        __________________________________
                        <p style="text-align: center; font-family: Verdana;">
                            Alberto Javier Oviedo Obrador
                        </p>
                    </td>
                    <td align="center" width="50%">
                        <br />
                        <br />
                        __________________________________
                        <p style="text-align: center; font-family: Verdana;">
                            Paulina Musalem Said
                        </p>
                    </td>
                </tr>
            </table>

            <br />
            <p style="text-align: center; font-family: Verdana;">
                Banco Bilbao Vizcaya Argentaria, Chile
            </p>
            <br />
        </div>
    </form>
</body>
</html>
