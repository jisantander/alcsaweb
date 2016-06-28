<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="07_GestionVoluntariaExtravioDeTitulos.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Formatos._07_GestionVoluntariaExtravioDeTitulos" %>

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
                <strong>EN LO PRINCIPAL,</strong>  SOLICITA SE DECLARE EXTRAVIO DE DOCUMENTO QUE INDICA.

            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSI,</strong>  SE ORDENE PUBLICACIÓN QUE INDICA. <strong>SEGUNDO OTROSI,</strong> ACOMPAÑA DOCUMENTOS. <strong>TERCER OTROSI,</strong> PATROCINIO Y PODER.
                <br />
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <strong>S. J.   L.
                </strong>
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                MARCELO DAVICO RAMIREZ, abogado, domiciliado en Avda. Libertador Bernardo O’Higgins número 1111, Comuna de Santiago, mandatario judicial en representación convencional según se acreditará de Banco del Estado de Chile,  Empresa Autónoma de Créditos del Estado, según consta de escritura pública de fecha treinta de Abril del año dos mil trece, otorgada en la Notaría de Santiago de don Pedro Reveco Hormazabal, a SS, respetuosamente digo:
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                1.- DEL MUTUO HIPOTECARIO ENDOSABLE:
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Mediante instrumento privado que tiene carácter de escritura pública, de fecha «FECHA_ESCRITURA» cuya firma fue autorizada por don (ña) «NOTARIA» Notario Público de «COMUNA_NOTARIA», protocolo Nº «PROTOCOLO»,  el Banco del Estado de Chile dio un Mutuo- mediante la modalidad de Mutuo Hipotecario endosable- a don(ña) «NOMBRE», empleado (a), y con domicilio conocido en  «DIRECCION», Comuna de «COMUNA».   

La parte deudora se obligó a pagar la cantidad de «UF» Unidades de Fomento, en el plazo de «DIVIDENDOSMESES» meses, a contar del día primero del mes subsiguiente al de la fecha de este contrato,  por medio de igual número de dividendos mensuales,  vencidos y sucesivos. Dichos dividendos comprenden la amortización y los intereses. La tasa de intereses real, anual y vencida que devenga dicho préstamo será de «TASA_DE_INTERES_»% anual. El dividendo mensual que corresponda pagar, será el que resulte de multiplicar el monto del préstamo, expresado en Unidades de Fomento, esto es «UF».- por los factores que corresponden a cada uno de los respectivos «DIVIDENDOSMESES» dividendos, a contar del dividendo número uno, que consta en la tabla de desarrollo elaborado por el Banco a vía ejemplar para un préstamo u obligación de una Unidad de Fomento y que se encuentra protocolizada con fecha 25 de abril de 2002 bajo el número 3837/ 2002 en  la Notaria de Santiago de don(ña) Gonzalo de la Cuadra Fabres.

A fin de garantizar el cumplimiento exacto, integro y oportuno de todas las obligaciones contraídas en virtud de la referida escritura pública, la parte deudora constituyó primera hipoteca a favor del Banco sobre el inmueble ubicado en «DIRECCION». Asimismo se estipuló, que el crédito otorgado en dicho acto por el Banco del Estado de Chile, lo es con “cláusula a la orden”, del cual  se otorgará una sola copia autorizada que se entregaría al  acreedor, la que sería transferible por endoso colocado a continuación, al margen o al dorso del documento, con indicación del nombre cesionario.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                2.- EXTRAVIO DE LA COPIA ENDOSABLE.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Es del caso SS. que a la fecha, la única copia endosable de la escritura de Mutuo Hipotecario Endosable antes referido se encuentra extraviada, por lo que mi parte se encuentra en imposibilidad de ejercer los derechos que le asisten a fin de poner en circulación el crédito hipotecario contenido en el documento antes singularizado, mediante endosos de dicha copia e incluso ejercer directamente las acciones de cobro emanadas del mismo.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Por su parte el artículo 1º de la Ley  nº 18.552 de 1986 que regula el Tratamiento de los Títulos de Crédito, señala  que en  los casos de extravió pérdida o deterioro parcial de títulos de crédito  emitidos con la cláusula  a la orden  o  en favor de,  como ocurre en la especie, se procederá en la forma establecida el párrafo 9º del Título I de la Ley Nº 18092 sobre Letras de            Cambio y Pagarés.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                A su vez, en los artículos  88 y siguientes de la Ley  Nº 18.092  sobre de Letras de Cambio y Pagarés,  ya citada, se regula el procedimiento de extravió de las Letras de Cambio y Pagarés, aplicable al documento del que mi representado es dueño y que se encuentra extraviado. Las normas relativas a dicho procedimiento disponen que el interesado podrá solicitar se declare el extravió del documento y que se le autorice para ejercer los derechos que le correspondan.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Pues bien SS., a fin de que mi representado pueda ejercer los derechos que le corresponden como dueño del mutuo hipotecario endosable antes singularizado, solicito a SS. que, previos los trámites de rigor, declare el extravió del citado documento y autorice a mi representado, el BANCO DEL ESTADO DE CHILE, a ejercer tales derechos.
            </p>

            <p style="text-align: justify; font-family: Verdana;">
                <strong>POR TANTO,</strong> en mérito de lo expuesto, y prevenido en el artículo 1º  de la Ley 18.552 y artículos 88 y siguientes de la  Ley 18.092, 
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SOLICITO A SS. :</strong> Previo traslado de esta solicitud a la parte deudora, don (ña) «NOMBRE», ya individualizada, declarar el extravió de la única copia autorizada endosable de la escritura pública de Mutuo Hipotecario endosable ya singularizado, declarando que el único titular y dueño del crédito es el BANCO DEL ESTADO CHILE, quien podrá ejercer todos los derechos que le corresponden como Acreedor y Portador legitimo del documento. Al efecto, la sentencia que se dicte con más copia autorizada de estos autos, reemplazará a la única copia autorizada endosable del Mutuo referido para todos los efectos legales.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSI:</strong> De  conformidad a lo establecido en el artículo 89 de la Ley  18.092 sobre Letras de Cambio y Pagarés, solicito a SS. Disponer se dé noticia del extravió del documento mencionado y de la presente solicitud mediante una publicación de un aviso en el Diario Oficial correspondiente a los días 1º o 15 de cualquier mes, o en el día hábil siguiente, a fin de que, dentro del plazo de 30 días los demás  interesados comparezcan a hacer valer sus derechos, aviso que deberá ser redactado por la señora secretaria del Tribunal.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SEGUNDO OTROSI: </strong>Solicito a SS. Tener por acompañados – con citación- los siguientes documentos, y disponer su custodia:
              
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                1.- Copia autorizada no endosable de la escritura pública de mutuo hipotecario endosable singularizada en lo  principal de esta presentación; y,
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                2.- Copia de la escritura pública donde consta  mi personería para representar al Banco del Estado de Chile.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>TERCER OTROSI:</strong> Solicito a SS. Tener presente que designo como abogado patrocinante y confiero poder, al abogado habilitado don JOSE GONZALO SANTANDER ROBLES, Chileno, casado, abogado, cédula nacional de identidad número diez millones cincuenta mil ochocientos trece guión tres, con domicilio en calle Estado número trescientos cincuenta y nueve,  piso  trece, Santiago, Teléfono número 6333115 / email: jsantander@alcsa.cl, y quien firma en señal de aceptación.

            </p>


        </div>
    </form>
</body>
</html>
