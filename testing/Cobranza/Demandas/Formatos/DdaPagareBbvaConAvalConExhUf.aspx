<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DdaPagareBbvaConAvalConExhUf.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Formatos.DdaPagareBbvaConAvalConExhUf" %>

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

            <p style="text-align: left; font-family: Verdana;">
                <br />
                <strong>EN LO PRINCIPAL:</strong> Demanda ejecutiva y mandamiento de ejecución y embargo; <strong>PRIMER OTROSI:</strong> Bienes para el embargo; <strong>SEGUNDO OTROSI:</strong> Acompaña documentos en la forma legal y custodia; <strong>TERCERO OTROSI: </strong>Cuantía; <strong>CUARTO OTROSI:</strong> Exhorto; <strong>QUINTO OTROSI:</strong> Personería; <strong>SEXTO OTROSI:</strong> Patrocinio y Poder
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <br />
                <strong>S. 		J.		 L.</strong>
                <br />
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>ALVARO CUMSILLE CAPPONI</strong>, abogado, mandatario judicial y en representacion convencional del BANCO BILBAO VIZCAYA ARGENTARIA, CHILE, Sociedad Anónima Bancaria, según consta en escritura pública que se acompaña en un otrosí de esta presentación, representada Iegalmente por su Gerente General don Ignacio Lacasta Casado, economista, todos domiciliados para estos efectos en calle Barros Errázuriz Nº 1953, Piso 8º, comuna de Providencia, Región Metropolitana, a US. respetuosamente digo:
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Mi representado es dueño del siguiente pagaré suscrito por don (ña) <asp:Label ID="lblNombreDeudor1" runat="server" Font-Bold="True"></asp:Label>
                    ,  ignoro profesión u oficio, con domicilio en   
                <asp:Label ID="lblDomicilio" runat="server" Font-Bold="True"></asp:Label>
                , comuna de &lt;&lt;COMUNA&gt;&gt;, en calidad de deudor u obligado principal, y por doña <strong>MARISOL MINELA PASTEN RAMIREZ</strong>, ignoro profesión u oficio, con domicilio Coihueco Nº 550, Condominio Panorama, comuna de Arica, en calidad de  Aval y/o Codeudor Solidaria, y  cuyos términos son los siguientes:
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Pagaré B.B.V.A. número<strong> </strong> <asp:Label ID="lblNumeroPagare" runat="server" Font-Bold="True"></asp:Label>
                ,  suscrito por la cantidad de <asp:Label ID="lblMontoCuotas" runat="server" Font-Bold="True"></asp:Label>
                .- Unidades de Fomento por concepto de capital, y de 70,70 Unidades de Fomento por concepto de intereses, con fecha   29 de Diciembre de 2008.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Sobre el capital adeudado se devengaría un interés del <strong> 
                <asp:Label ID="lblTasaInteres" runat="server" Font-Bold="True"></asp:Label>
                % anual</strong>, el cual se encuentra incorporado al valor final de cada una de las cuotas que a continuación se señalan. El pago, según describe, se efectuaría en   
                <asp:Label ID="lblNumeroTotalCuotas" runat="server" Font-Bold="True"></asp:Label>
                &nbsp;cuotas sucesivas, cuyo valor de cada una se encuentra en calendario de pago que forma parte del pagaré . El vencimiento para la primera cuota se fijo para el día 05 de febrero de 2009 y las restantes los días 05 de los meses siguientes.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                En caso que el suscriptor no pagare integra y oportunamente alguna (s) de las cuotas en la que se dividió la obligación, esta devengará desde el día de la mora y hasta el de su completo y efectivo pago, el interés corriente, que tuviere vigencia durante el tiempo de la mora o simple retardo, en sus diferentes etapas, más un 50% si esta ultima fuese superior a la primera.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Se deja expresamente establecido en el pagaré, que en caso de cobro judicial corresponderá al suscriptor acreditar el pago del documento.     
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Todas las obligaciones que emanen de este pagaré serán solidarias para los suscriptores, avalistas y demás obligados al pago, y serán indivisibles para dichos obligados, sus herederos y/o sucesores, conforme a lo dispuesto en los artículos 1526 N° 4 y 1528 del Código Civil. 
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Para todos los efectos legales las partes constituyeron domicilio en la comuna de Santiago y se somete a la competencia de los tribunales de la misma.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Se estipula la clausula sin obligación de protesto, pero si el tenedor optare por la realización de dicha diligencia, podrá hacerla. En todo caso, se estipuló que en el evento de protesto el suscriptor se obliga a pagar los gastos e impuestos que devenguen.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                La firma del suscriptor como la del codeudor solidario se encuentra autorizadas por notario público, por lo que el pagaré constituye titulo ejecutivo perfecto en su contra, siendo además, la obligación liquida, actualmente exigible y la acción ejecutiva no está prescrita.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Se hace presente, que el deudor se encuentra en mora de la obligación a contar de la cuota con vencimiento de fecha 05 de Junio de 2013 en adelante, incumplimiento que faculta al banco para exigir de inmediato, y como si fuera de plazo vencido, la totalidad de la deuda, por lo que vengo en exigir el pago total y anticipado de la obligación del pagaré, mediante la notificación de la presente demanda.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Dicha deuda, de conformidad a la liquidación acompañada en un otrosí, de fecha 03 de Octubre de 2013, asciende a la cantidad 91,70.- Unidades de Fomento, correspondiente a capital adeudado vencido y no vencido, la que se obtiene de sumar 12,79.- Unidades de Fomento.- que corresponden al <strong>capital adeudado vencido</strong> mas la suma de 78,91.- Unidades de Fomento  que corresponden al capital adeudado no vencido, más los intereses convencionales y penales que se generen a contar desde la mora, hasta la fecha del pago efectivo de la deuda mas las costas del juicio.
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <br />
                <strong>POR TANTO,</strong>
                <br />
            </p>
            <p style="text-align: left; font-family: Verdana;">
                de acuerdo a lo dispuesto y de conformidad a las normas de las leyes números 18.010, Ley 18.092 y Ley 19.951 y a los artículos 434 y siguientes del Código de Procedimiento Civil,
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>RUEGO A US.</strong>, tener por entablada demanda ejecutiva y despachar mandamiento de ejecución y embargo en contra de don(ña)  <asp:Label ID="lblNombreDeudor0" runat="server" Font-Bold="True"></asp:Label>
                    , y en contra de don(ña) <strong>MARISOL MINELA PASTEN RAMIREZ</strong>, ambos ya debidamente individualizados, en su calidad de suscriptor y deudor principal del pagare singularizado, y el segundo en su calidad de aval y codeudor solidario, por la suma de <strong>91,70</strong>.- Unidades de Fomento.- correspondiente a capital adeudado vencido y capital adeudado no vencido, todo ello más los intereses correspondientes, que se generan a contar desde la mora y hasta la fecha del pago efectivo de la deuda, mas las costas del juicio y disponer que se continúe la ejecución, acogiendo la demanda en todas sus partes, hasta que se haga a mi representado entero pago de sus acreencias, con costas.         
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>PRIMER OTROSI:</strong> Ruego a US., tener presente que señalo como bienes para la traba del embargo todos aquellos muebles e inmuebles que actualmente sean o, aparezcan posteriormente como de dominio del ejecutado.                                 
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>SEGUNDO OTROSI:</strong> Ruego a S.S. tener por acompañados en la forma legal y ordenar la <strong>custodia</strong> de los siguientes documentos:
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>1.-</strong> Con citación, Pagaré B.B.V.A. numero <asp:Label ID="lblNumeroPagare0" runat="server" Font-Bold="True"></asp:Label>
                .
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>2.-</strong> Bajo apercibimiento del articulo 346 N° 3 del Código de Procedimiento Civil, liquidación del pagaré numero de Obligación 0504-0470-62-9600007622
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>3.-</strong> Con citación, copia autorizada de la personería de mi personería para representar a Banco Bilbao Vizcaya Argentaria, Chile que consta de la escritura de fecha 24 de Junio de 2010, otorgada en la Notaria de Santiago, de don Eduardo Avello Concha.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>TERCER OTROSI:</strong> Ruego a S.S. tener presente para el solo efecto de determinar la cuantía del juicio, el valor de lo demandado asciende a la suma de $2.117.871.-, correspondiente a capital adeudado vencido y capital adeudado no vencido, de acuerdo a la equivalencia de la Unidad de Fomento al día de la liquidación que en un otrosí se acompaña,  todo ello más los intereses correspondientes que se generan a contar desde la fecha de la mora, hasta la fecha del pago efectivo de la deuda, mas costas.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>CUARTO OTROSI:</strong> Que, en razón que el ejecutado principal y el codeudor solidario  tienen su domicilio en la comuna de Arica, y con el objeto de notificar la demanda y requerirlos de pago,  vengo en solicitar se exhorte al Juzgado de Letras de turno  competente, de la comuna de Arica. 
            </p>
            <p style="text-align: left; font-family: Verdana;">
                El tribunal exhortado estará facultado para ordenar que se practiquen todas las diligencias necesarias para proceder a la notificación personal de los demandados y si fuere necesario, ordenar la notificación prevista por el artículo 44 del Código de Procedimiento Civil.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                Asimismo, ordenar se traben embargos, incluso con el auxilio de la fuerza pública y/o facultad de allanar y descerrajar, en caso necesario; para designar depositarios provisionales y definitivos, en su caso, para ordenar el retiro de los bienes embargados, con el auxilio de la fuerza pública, si fuere necesario; para nombrar martilleros, síndicos u otros funcionarios; para recibir los fondos resultantes de la liquidación de los bienes o para recibir consignación total o parcial de dineros, para el pago de la deuda; para enviar el producto de la realización de los bienes o de los fondos consignados, según el caso, al tribunal de US., y en general, para realizar todas las demás actuaciones necesarias o útiles para cumplir estos fines. 
            </p>
            <p style="text-align: left; font-family: Verdana;">
                El exhorto podrá ser diligenciado por la persona que lo presente o lo requiera al tribunal exhortado, y deberá contener copia íntegra de la demanda de autos, junto con su ampliación y sus respectivos proveídos.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>QUINTO OTROSI:</strong> Ruego a US. tener presente, que mi personería para actuar en representación del BANCO BILBAO VIZCAYA ARGENTARIA, CHILE consta de la escritura de fecha 24 de Junio de 2010, otorgada en la Notaria de Santiago, de don Eduardo Avello Concha, copia autorizada de la cual acompaño en el segundo otrosí de esta demanda.
            </p>
            <p style="text-align: left; font-family: Verdana;">
                <strong>SEXTO OTROSI:</strong> Ruego a SS., tener presente que designo abogado patrocinante a don José Santander Robles y a la vez confiero poder a don Claudio Villarroel Meléndez, ambos con domicilio en calle Estado Nº 359, Piso 13, Santiago.
            </p>
        </div>
    </form>
</body>
</html>
