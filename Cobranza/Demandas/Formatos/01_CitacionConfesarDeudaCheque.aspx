<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01_CitacionConfesarDeudaCheque.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Formatos._01_CitacionConfesarDeudaCheque1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                    <td style="width: 70%">:&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 30%">RUT</td>
                    <td style="width: 70%">:&nbsp;</td>
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
                    <td style="width: 70%">: Citación a confesar deuda</td>
                </tr>
                <tr>
                    <td style="width: 30%">PRIMER OTROSI</td>
                    <td style="width: 70%">: Acompaña documento, con citación.</td>
                </tr>
                <tr>
                    <td style="width: 30%">SEGUNDO OTROSI</td>
                    <td style="width: 70%">: Acompaña personería, con citación.</td>
                </tr>
                <tr>
                    <td style="width: 30%">TERCER OTROSI</td>
                    <td style="width: 70%">: Patrocinio y poder.</td>
                </tr>
            </table>
            <p style="text-align: center; font-family: Verdana;">
                <br />
                <strong>S. J. L. en lo Civil</strong>
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>JOSE SANTANDER ROBLES, </strong>Abogado, en representación convencional y judicial, según acredita en un otrosí de ésta presentación de la <asp:Label ID="lblNombreCliente0" runat="server"></asp:Label>
                    &nbsp;del giro de su denominación, ambos con domicilio en calle Estado Nº 359, Piso 13, comuna y ciudad de Santiago,  a US. Respetuosamente digo:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Vengo en solicitar se cite a la presencia judicial a <asp:Label ID="lblNombreRepresentante" runat="server"></asp:Label>
                    , ignoro profesión u oficio, en representación de <asp:Label ID="lblNombreDeudor0" runat="server"></asp:Label>
                    , ignoro giro, ambos con domicilio en   
                <asp:Label ID="lblDomicilio0" runat="server"></asp:Label>
                , con el  objeto de confesar deuda, siendo la suma  equivalente a $<asp:Label ID="lblMontoTotal" runat="server"></asp:Label>
                    .-pesos, a <asp:Label ID="lblNombreCliente2" runat="server"></asp:Label>
                    , según deuda pendiente por concepto de cheques impagos.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Con el fin de preparar la vía ejecutiva y en conformidad con los artículos 434 y siguientes del Código de Procedimiento Civil, solicito que se cite a la presencia judicial a don(a) <asp:Label ID="lblNombreRepresentante0" runat="server"></asp:Label>
                    , en representación de <asp:Label ID="lblNombreDeudor1" runat="server"></asp:Label>
                    , ambos  ya individualizados, a fin de que concurra a confesar la deuda existente, y que asciende a la suma de $<asp:Label ID="lblMontoTotal0" runat="server"></asp:Label>
                    .- pesos, más los correspondientes reajustes e intereses, con costas.
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO:</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>A US. RUEGO,</strong> acceder a la citación a confesar deuda solicitada, bajo apercibimiento legal.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSI:</strong> Sírvase US. Tener por acompañados, con citación  los siguientes documentos:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                |CHEQUES DE LA COBRANZA</p>
            <ul>
                <li>Cheque del Banco de Chile serie 2012CX Nº8739810, de la cuenta corriente Nº192-00022-05 por la cantidad de $529.731.- de fecha 30 de Mayo de 2012</li>
                <li>Cheque del Banco de Chile serie 2012CX Nº8739809, de  la cuenta corriente Nº192-00022-05 por la cantidad de $529.731.- de fecha 15 de Mayo de 2012.</li>
                <li>Cheque del Banco de chile serie 2012CX Nº8739807, de la cuenta corriente N	º192-00022-05 por la cantidad de $529.731.- de fecha 15 de Abril de 2012.</li>
                <li>Cheque del Banco de Chile serie 2012CX Nº8739808, de la cuenta corriente Nº192-00022-05 por la cantidad de $529.731.- de fecha 30 de Abril de 2012.</li>
            </ul>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SEGUNDO OTROSI:</strong> Sírvase a US: tener presente que mi personería para representar a <asp:Label ID="lblNombreCliente1" runat="server"></asp:Label>
                    , consta en la escritura pública de fecha 19 de Marzo de 2013, otorgada ante don Raúl Iván Perry Perfaur, Notario Público de la Vigésimo Primero notaria de Santiago , copia autorizada de la cual se acompaña en este acto con citación.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>TERCER OTROSI:</strong> Sírvase US. Tener presente que en mi calidad de Abogado habilitado para el ejercicio de la profesión, patente al día Nº 417.900-5 de la I. Municipalidad de Santiago, patrocino esta gestión y actuaré personalmente en ella.
            </p>
        </div>
    </form>
</body>
</html>
