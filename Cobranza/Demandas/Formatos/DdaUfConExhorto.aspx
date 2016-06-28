<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DdaUfConExhorto.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Formatos.DdaUfConExhorto" %>

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
            <p style="text-align: justify; font-family: Verdana;">
                <br />
                <strong>EN LO PRINCIPAL:</strong> Demanda ejecutiva y mandamiento de ejecución y embargo. <strong>PRIMER OTROSI:</strong> Bienes para el embargo. <strong>SEGUNDO OTROSI:</strong> Acompaña documentos en la forma legal y custodia. <strong>TERCERO OTROSI: </strong>Cuantía. <strong>CUARTO OTROSI: </strong>Personería. <strong>QUINTO OTROSI:</strong> Patrocinio y Poder
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <br />
                <strong>S. 		J.		 L.</strong>
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>JOSE SANTANDER ROBLES, abogado, domiciliado en calle Estado Nº 359, Piso 13, Santiago</strong>, mandatario judicial y en representacion convencional del BANCO BILBAO VIZCAYA ARGENTARIA, CHILE, Sociedad Anónima Bancaria, según consta en escritura pública que se acompaña en un otrosí de esta presentación, representada Iegalmente por don Manuel Antonio Olivares Rossetti, Ingeniero Comercial, cédula de identidad número 8.496.988-5, todos domiciliados para estos efectos en calle Barros Errázuriz Nº 1953, Piso 8º, comuna de Providencia, Región Metropolitana, a US. respetuosamente digo:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Mi representado es dueño del siguiente pagaré suscrito por don (ña) <asp:Label ID="lblNombreDeudor1" runat="server" Font-Bold="True"></asp:Label>
                    ,  ignoro profesión u oficio, con  domicilio en   
                <asp:Label ID="lblDomicilio" runat="server" Font-Bold="True"></asp:Label>
                , comuna de «COMUNA_DOMICILIO» cuyos términos son los siguientes:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Pagaré B.B.V.A. número <asp:Label ID="lblNumeroPagare" runat="server" Font-Bold="True"></asp:Label>
                ,  suscrito por don (ña) <asp:Label ID="lblNombreDeudor0" runat="server" Font-Bold="True"></asp:Label>
                    &nbsp;en su calidad de suscriptor  y deudor principal, por la cantidad de UF <strong>«MONTO_CAPITAL»</strong>.- por concepto de capital, y UF <strong>«MONTO_INTERESES»</strong>.-, por concepto de intereses, con fecha «FECHA_SUSCRIPCIÓN».
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Sobre el capital adeudado se devengaría un interés del  
                <asp:Label ID="lblTasaInteres" runat="server" Font-Bold="True"></asp:Label>
                &nbsp;% <strong>anual</strong>, el cual se encuentra incorporado al valor final de cada una de las cuotas que a continuación se señalan. El pago, según describe el pagaré acompañado, se efectuaría en   
                <asp:Label ID="lblNumeroTotalCuotas" runat="server" Font-Bold="True"></asp:Label>
                &nbsp;cuotas sucesivas por un monto de <strong>UF <asp:Label ID="lblMontoCuotas" runat="server" Font-Bold="True"></asp:Label>
                .- las   
                <asp:Label ID="lblNumeroPrimerasCuotas" runat="server" Font-Bold="True"></asp:Label>
                &nbsp;primeras, y por UF</strong><asp:Label ID="lblMontoUltimaCuota" runat="server" Font-Bold="True"></asp:Label>
                .- la última. El vencimiento para la primera cuota se fijó para el día   
                <asp:Label ID="lblFechaPrimerVencimiento" runat="server" Font-Bold="True"></asp:Label>
                &nbsp;y las restantes los días «OTROS_VENCIMIENTOS» de los meses siguientes.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                En caso que el suscriptor no pagare integra y oportunamente alguna (s) de las cuotas en la que se dividió la obligación, esta devengará desde el día de la mora y hasta el de su completo y efectivo pago, el interés corriente, que tuviere vigencia durante el tiempo de la mora o simple retardo, en sus diferentes etapas, más un 50% si esta última fuese superior a la primera.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Se deja expresamente establecido en el pagaré, que en caso de cobro judicial corresponderá al suscriptor acreditar el pago del documento.     
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Todas las obligaciones que emanen de este pagaré serán solidarias para los suscriptores, avalistas y demás obligados al pago, y serán indivisibles para dichos obligados, sus herederos y/o sucesores, conforme a lo dispuesto en los artículos 1526 N° 4 y 1528 del Código Civil. 
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Para todos los efectos legales las partes constituyeron domicilio en la comuna de Santiago y se somete a la competencia de los tribunales de la misma.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Se estipula la cláusula sin obligación de protesto, pero si el tenedor optare por la realización de dicha diligencia, podrá hacerla. En todo caso, se estipuló que en el evento de protesto el suscriptor se obliga a pagar los gastos e impuestos que devenguen.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                La firma del suscriptor se encuentra autorizada por notario público, por lo que el pagaré constituye título ejecutivo perfecto en su contra, siendo además, la obligación liquida, actualmente exigible y la acción ejecutiva no está prescrita.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Se hace presente, que el deudor se encuentra en mora de la obligación a contar de la cuota N°<asp:Label ID="lblNumeroCuotaMora" runat="server" Font-Bold="True"></asp:Label>
                &nbsp;mora con vencimiento de fecha «FECHA_MORA»  en adelante, incumplimiento que faculta al banco para exigir de inmediato, y como si fuera de plazo vencido, la totalidad de la deuda, por lo que vengo en exigir el pago total y anticipado de la obligación del pagaré, mediante la notificación de la presente demanda.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Dicha deuda, de conformidad a la liquidación acompañada en un otrosí, de fecha <asp:Label ID="lblFechaLiquidacion" runat="server" Font-Bold="True"></asp:Label>
                , y de conformidad a lo establecido en el artículo 30 de la Ley 18.010 asciende a la cantidad UF <strong>«MONTO_DEUDA_LIQUIDACIÓN»</strong>.-, correspondiente a capital adeudado por concepto de cuotas vencidas y no vencidas. A la suma señalada se le debe adicionar los intereses convencionales y penales que se generen a contar desde la mora, hasta la fecha del pago efectivo de la deuda más las costas del juicio.
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <br />
                <strong>POR TANTO,</strong>
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                de acuerdo a lo dispuesto y de conformidad a las normas de las leyes números 18.010, Ley 18.092 y Ley 19.951 y a los artículos 434 y siguientes del Código de Procedimiento Civil,
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>RUEGO A US.</strong>, tener por entablada demanda ejecutiva y despachar mandamiento de ejecución y embargo en contra de don  <asp:Label ID="lblNombreDeudor2" runat="server" Font-Bold="True"></asp:Label>
                    , ya individualizado, en su calidad de suscriptor y deudor principal del pagare singularizado, por la suma de UF <strong>«MONTO_DEUDA_LIQUIDACIÓN»</strong>.- correspondiente a capital adeudado vencido y capital adeudado no vencido, de conformidad a lo establecido en el artículo 30 de la Ley 18010;  todo ello más los intereses correspondientes, que se generan a contar desde la mora y hasta la fecha del pago efectivo de la deuda, más las costas del juicio, equivalente a $<strong>«EQUIVALENTE_EN_»</strong>.- al día de la liquidación que en un otrosí se acompaña, y disponer que se continúe la ejecución, acogiendo la demanda en todas sus partes, hasta que se haga a mi representado entero pago de sus acreencias, con costas.     
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSI:</strong> Ruego a US., tener presente que señalo como bienes para la traba del embargo todos aquellos muebles e inmuebles que actualmente sean o, aparezcan posteriormente como de dominio del ejecutado.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SEGUNDO OTROSI:</strong> Ruego a S.S. tener por acompañados en la forma legal y ordenar la <strong>custodia</strong> de los siguientes documentos:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>1.-</strong> Con citación, Pagaré B.B.V.A. numero <asp:Label ID="lblNumeroPagare0" runat="server" Font-Bold="True"></asp:Label>
                .-
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>2.-</strong> Bajo apercibimiento del articulo 346 N° 3 del Código de Procedimiento Civil, liquidación del pagaré e informe detallado de la deuda, ya individualizado.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>3.-</strong> Con citación, copia autorizada de mi personería para representar a Banco Bilbao Vizcaya Argentaria, Chile que consta de la escritura de fecha 22 de Enero de 2014, otorgada en la Notaria de Santiago, de don Eduardo Avello Concha.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>TERCER OTROSI:</strong> Ruego a SS. tener presente para el solo efecto de determinar la cuantía del juicio, que el valor de lo demandado asciende a la suma de UF«MONTO_DEUDA_LIQUIDACIÓN».-, correspondiente a capital adeudado vencido y capital adeudado no vencido, todo ello más los intereses correspondientes que se generan a contar desde la fecha de la mora, hasta la fecha del pago efectivo de la deuda, mas costas.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>CUARTO OTROSI:</strong> Ruego a US. tener presente, que mi personería para actuar en representación del BANCO BILBAO VIZCAYA ARGENTARIA, CHILE consta de la escritura de fecha 22 de Enero de 2014, otorgada en la Notaria de Santiago, de don Eduardo Avello Concha, copia autorizada de la cual acompaño en el segundo otrosí de esta demanda.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>QUINTO OTROSI: </strong>Que, en razón que el ejecutado tiene su domicilio en la comuna de «COMUNA_DOMICILIO», y con el objeto de notificar la demanda y requerirlo de pago,  vengo en solicitar se exhorte al Juzgado de Letras de turno  competente, de la comuna de <strong>«COMUNA_EXHORTO»</strong>. 
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                El tribunal exhortado estará facultado para ordenar que se practiquen todas las diligencias necesarias para proceder a la notificación personal de los demandados y si fuere necesario, ordenar la notificación prevista por el artículo 44 del Código de Procedimiento Civil.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Asimismo, ordenar se traben embargos, incluso con el auxilio de la fuerza pública y/o facultad de allanar y descerrajar, en caso necesario; para designar depositarios provisionales y definitivos, en su caso, para ordenar el retiro de los bienes embargados, con el auxilio de la fuerza pública, si fuere necesario; para nombrar martilleros, síndicos u otros funcionarios; para recibir los fondos resultantes de la liquidación de los bienes o para recibir consignación total o parcial de dineros, para el pago de la deuda; para enviar el producto de la realización de los bienes o de los fondos consignados, según el caso, al tribunal de US., y en general, para realizar todas las demás actuaciones necesarias o útiles para cumplir estos fines. 
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                El exhorto podrá ser diligenciado por la persona que lo presente o lo requiera al tribunal exhortado, y deberá contener copia íntegra de la demanda de autos, junto con su ampliación y sus respectivos proveídos.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SEXTO OTROSI:</strong> Ruego a SS., tener presente que en mi calidad de abogado habilitado, asumo personalmente el patrocinio y poder en esta causa, y a la vez confiero poder al abogado don <strong>CLAUDIO VILLARROEL MELENDEZ</strong>, de mi mismo domicilio, pudiendo actuar de manera conjunta o separada indistintamente con el suscrito.
            </p>
        </div>
    </form>
</body>
</html>
