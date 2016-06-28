<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="08_OrdinariaMenorCuantiaCobroPesos.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Formatos._08_OrdinariaMenorCuantiaCobroPesos" %>

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
            <p style="text-align: justify; font-family: Verdana;">
                <strong>EN LO PRINCIPAL:</strong> Demanda de cobro de pesos; <strong>PRIMER  OTROSI:</strong> Medios de prueba; <strong>SEGUNDO OTROSI:</strong> Acredita personería; <strong>TERCER OTROSI:</strong> Se tenga presente.
                <br />
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <strong>S.  J.  L.
                </strong>
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                «ABOGADO» , abogado, con domicilio en calle Estado Nº 359, Piso 13, Santiago, en representación convencional según se acredita en un otrosí de esta  presentación, de Comisiones y Cobranzas S.A, sociedad del giro de su denominación, y esta a su vez en representación de Inversiones y Tarjetas S.A, empresa del giro de su denominación, ambas representadas por Don Ricardo Brenier Zwick, chileno, casado, Ingeniero Comercial, todos domiciliados en Compañía N° 1034, 2° piso, Santiago a US., muy respetuosamente digo:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Que, en la representación que invisto, deduzco demanda ordinaria de cobro de pesos en contra de don(a) «NOMBRE_DEUDOR», ignoro profesión u oficio, domiciliado en «CALLE» «NUMERO» «VILLA», comuna de «COMUNA» a fin de que SS. acoja a  tramitación la presente demanda y en definitiva le condene a pagar a mi representada la suma de $ «MONTO_ADEUDADO».- más intereses, reajustes y costas judiciales en virtud los fundamentos que paso a exponer:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Inversiones y Tarjetas S.A. emite la tarjeta Hites por medio de la cual se concede un sistema de crédito a su titular para adquirir diversos bienes, a través de ésta, el demandado financió compras en establecimientos adheridos con cargo al crédito concedido, no cumpliendo con su obligación de pagar dicho crédito en los plazos convenidos, no obstante los innumerables requerimientos y distintas alternativas de pago ofrecidas, ya sea al pago total de ella o a la regularización de su situación de deuda.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                En virtud del mandato especial que se acompaña, Inversiones y Tarjetas S.A faculta a Comisiones y Cobranzas S.A para recurrir en su nombre y representación ante SS., y demandar el pago de la suma adeudada y que se acreditará con los documentos que dan cuenta de esta y que se acompañarán en la etapa procesal respectiva.

                <br />
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO;
                </strong>
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                En merito de lo expuesto, y lo dispuesto en los artículos 1545, 1546, 1551 y 1559 del Código Civil; 254, 698 y siguientes del Código de Procedimiento Civil, y demás normas legales aplicables, 
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>RUEGO A US:</strong> Tener por deducida demanda en juicio ordinario de menor cuantía  en contra  de don(a) «NOMBRE_DEUDOR», ya individualizado(a), admitirla a tramitación y en definitiva condenarlo, (a)  a pagar a mí representada la suma de $ «MONTO_ADEUDADO».- , más intereses, reajustes y costas judiciales.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSI:</strong> Ruego a US. Se sirva tener presente que me valdré de todos los medios de prueba que franquea la ley en la oportunidad procesal que corresponda, en  especial la prueba documental y testimonial.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SEGUNDO OTROSI:</strong> Ruego a  US. tener  presente que en  mandato  especial  otorgado  en la Notaría de Santiago de Doña María Soledad Santos, de fecha 13 de Agosto de 2013  Inversiones y Tarjetas SA, en su calidad de emisor de tarjetas Hites, otorga facultades a Comisiones y Cobranzas S.A. para demandar  judicialmente los  créditos que se le adeuden  a cualquier título  y por  cualquier persona, constando en el mismo documento, la calidad y facultades de su representante legal; y asimismo, la facultad y poder especial de este abogado para representar a Comisiones y Cobranzas S.A., constan en Acta de Sesión  Extraordinaria  de directorio de Comisiones y Cobranzas S.A., reducida a escritura pública con fecha 02 de septiembre de 2013 en la Notaria de Santiago  de doña  Maria Soledad santos Muñoz, acompañando en este acto las referirías copias autorizadas ante Notario, con citación.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>TERCER OTROSI:</strong> Ruego a US. Se sirva tener presente que en mi  calidad de abogado habilitado para el ejercicio de la profesión, patrocinaré y actuare personalmente en esta gestión

            </p>

        </div>
    </form>
</body>
</html>
