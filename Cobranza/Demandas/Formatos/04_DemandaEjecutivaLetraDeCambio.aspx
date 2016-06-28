<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="04_DemandaEjecutivaLetraDeCambio.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Formatos._04_DemandaEjecutivaLetraDeCambio" %>

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
                    <td style="width: 70%">:&nbsp;<asp:Label ID="lblProcedimiento" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%">MATERIA</td>
                    <td style="width: 70%">:&nbsp;<asp:Label ID="lblMateria" runat="server"></asp:Label>
                    </td>
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

            <p style="text-align: justify; font-family: Verdana;">
                <strong>EN LO PRINCIPAL:</strong> Demanda ejecutiva y mandamiento de ejecución y   embargo; <strong>EN EL PRIMER OTROSÍ:</strong> Señala bienes para la traba del embargo y depositario bajo apercibimiento legal; <strong>EN EL SEGUNDO OTROSÍ:</strong> Acompaña documento con citación; EN EL TERCER OTROSI: Acompaña escritura de personería, con citación. <strong>EN EL CUARTO OTROSÍ:</strong> Téngase Presente.-
                <br />
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <br />
                <strong>S. 		J.		 L.</strong>
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>JOSÉ SANTANDER ROBLES</strong>, abogado, en representación convencional y judicial, según se acredita en un otrosí de esta presentación de <asp:Label ID="lblNombreCliente0" runat="server"></asp:Label>
                    , ambos con domicilio en Estado 359, Piso 13º, Santiago, en los autos sobre notificación de protesto de cheque, caratulados “<asp:Label ID="lblNombreCliente1" runat="server"></asp:Label>
                    &nbsp;con <asp:Label ID="lblNombreRepresentante" runat="server"></asp:Label>
                    ”, causa rol C-<asp:Label ID="lblRol" runat="server"></asp:Label>
                , a US. respetuosamente digo:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Que vengo en interponer demanda ejecutiva en contra de don <asp:Label ID="lblNombreDeudor0" runat="server"></asp:Label>
                    , ignoro profesión u oficio, domiciliado en     
                <asp:Label ID="lblDomicilio" runat="server"></asp:Label>
                , por la suma de $<asp:Label ID="lblMontoTotal" runat="server"></asp:Label>
                    .- (<asp:Label ID="lblMontoTotalPalabras" runat="server"></asp:Label>
                ), más reajustes e intereses pactados y penales, y ordenar despachar mandamiento de ejecución y embargo en su contra, por dicha suma.- 
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Del mismo modo ordenar,  se siga adelante esta ejecución hasta el pago de esa cantidad en forma íntegra y total, con  costas, por los fundamentos de hecho y derecho que paso a exponer: 
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Consta de la  letra de cambio  número 00881 aceptada con fecha 26  de Septiembre de 2006, cuya firma se encuentra autorizada ante el Notario público de Santiago don Eduardo Avello Concha y que se acompaña en un otrosí de esta presentación, que don <asp:Label ID="lblNombreDeudor1" runat="server"></asp:Label>
                    , se obligó a pagar a mi representada, al día 28 de Agosto de 2009, la suma de $<asp:Label ID="lblMontoTotal1" runat="server"></asp:Label>
                    .-
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Es del caso que a la fecha del vencimiento de las letras su aceptante don <asp:Label ID="lblNombreDeudor2" runat="server"></asp:Label>
                    , no pagó la letra, en consecuencia, adeuda a mi representado <asp:Label ID="lblNombreCliente2" runat="server"></asp:Label>
                    , la suma total de $<asp:Label ID="lblMontoTotal0" runat="server"></asp:Label>
                    .-, más sus respectivos intereses, reajustes y costas. 
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Ahora bien, dicha deuda consta en letra de cambio, legalmente aceptada y cuya firma se encuentra autorizada ante Notario Público, siendo la obligación líquida, actualmente exigible y las acciones no están prescritas, encontrándose pagado el impuesto en estampillas agregadas a las letras, por lo que además constituyen un título ejecutivo, según lo establece expresamente el artículo 434, nro. 4 del Código de Procedimiento Civil.
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO:
            </strong>
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>A US. RUEGO;</strong>  tener por presentada demanda ejecutiva en contra de la ejecutada don <asp:Label ID="lblNombreDeudor3" runat="server"></asp:Label>
                    , ya individualizado, por la suma de $<asp:Label ID="lblMontoTotal2" runat="server"></asp:Label>
                    .-más reajustes e intereses que se devenguen a partir de la mora y ordenar se despache en su contra mandamiento de ejecución y embargo por dicha suma y que la ejecución siga su curso hasta el pago íntegro y total de esas cantidades, con expresa condenación en costas.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSÍ:</strong> Ruego a S.S. se sirva tener presente que señalo como bienes para la traba del embargo todos aquellos que guarnecen en el  domicilio del deudor,  proponiendo como depositario provisional de los mismos al propio ejecutado, bajo las responsabilidades civiles y penales que correspondan.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SEGUNDO OTROSÍ:</strong> Sírvase SS. Tener por acompañado con citación letra de cambio, ya individualizada en lo principal de esta presentación, con su respectiva copia fotostática.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>TERCER OTROSI:</strong> Sírvase Us. Tener  presente que mi personería  para representar a  <asp:Label ID="lblNombreCliente3" runat="server"></asp:Label>
                    , consta en la escritura pública de fecha 12 de Marzo de 2013, otorgada ante don Raúl Iván Perry Perfaur, Notario Público de la Vigésimo   Primero notaría de Santiago, copia autorizada de la cual se acompaña en este acto con citación.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>CUARTO  OTROSÍ:</strong> Sírvase US. Tener presente que en mi calidad de abogado habilitado para el ejercicio de la profesión, patente 417.900-5, de la I. Municipalidad de Santiago, patrocino esta gestión y actuaré personalmente en esta causa. 

            </p>
        </div>
    </form>
</body>
</html>
