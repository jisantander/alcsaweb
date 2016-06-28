<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="06_DemandaEjecutivaPagareCreditoUniversitario.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Formatos._06_DemandaEjecutivaPagareCreditoUniversitario" %>

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
                <strong>EN LO PRINCIPAL:</strong> Demanda ejecutiva y mandamiento de ejecución y embargo. <strong>PRIMER OTROSI:</strong> Acompaña documentos en la forma legal y custodia.   <strong>SEGUNDO OTROSI:</strong> Bienes para el embargo. <strong>TERCERO OTROSI:</strong> Personería.  <strong>CUARTO OTROSI: </strong>Se tenga presente. <strong>QUINTO OTROSI:</strong>  Patrocinio y Poder.
                <br />
            </p>
            <p style="text-align: center; font-family: Verdana;">
                <strong>S. 		J.		 L.
                </strong>
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                CRISTIÁN ANDRÉS CONTRERAS LOYOLA, abogado, domiciliado en San Diego N° 81, piso 8, Santiago, mandatario judicial y en representación convencional del BANCO DEL ESTADO DE CHILE, empresa autónoma de créditos del estado, según consta en escritura pública de fecha 22 de Noviembre de 2013, otorgada en la Notaria de Santiago de don (ña) María Gloria Acharan Toledo, a US respetuosamente digo:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Mi representado es dueño del siguiente pagaré a la vista y a la orden del Banco del Estado de Chile N° 3236110 que se acompaña en el primer otrosi de esta demanda, por la suma de 162,3919.- Unidades de Fomento, suscrito por don (ña) DENISSE ANDREA FAURE GOMEZ,  ignoro profesión u oficio, con domicilio en Pasaje Rio Valdivia N° 735, Villa San Ignacio, Quilicura, otro Los Papayos N° 12192, El Bosque, según el mandato que consta en contrato de apertura de línea de crédito para estudiantes de educación superior y que se acompaña en un otrosí de esta presentación.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Es del caso señalar que el documento tenía su vencimiento el 25 de marzo de 2014, fecha en la cual el deudor no lo pago, encontrándose en mora desde ese día, por lo que de conformidad a lo prevenido en el pagaré, corresponde la aplicación de intereses moratorios desde dicha fecha, que equivalen al interés máximo convencional, para operaciones no reajustables, los que deben calcularse desde la fecha de vencimiento del documento.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                En consecuencia, el monto total adeudado a mi representado, asciende a la suma de 162,3919 Unidades de Fomento, equivalentes al día 25 de marzo del 2014 a la suma de $2.793.811.-, más los intereses moratorios y costas.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                Como consta del pagaré que se acompaña, la obligación es indivisible, el (los) suscriptor (es) relevó(aron) al portador de los documentos de la obligación de protesto y, la(s) firma (s) de est(os) se encuentra(n) autorizada(s) por notario. La obligación es liquida, actualmente exigible y la acción ejecutiva no se encuentra prescrita. 

                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                POR TANTO, de acuerdo a lo expuesto, documentos acompañados, y a lo dispuesto en el artículo 98 y siguientes de la ley 18.092, artículos 254, 434 N°4 y siguientes del Código de Procedimiento Civil, y demás normas pertinentes. 
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                A SS. PIDO., tener por interpuesta demanda ejecutiva en contra de don(ña)  DENISSE ANDREA FAURE GOMEZ, ya individualizado(s), en las calidad(es) ya indicada(s), admitirla a tramitación y ordenar se despache mandamiento de ejecución y embargo en su contra por la suma de 162,3919.- Unidades de Fomento, equivalentes al día 25 de marzo del 2014 a la suma de $2.793.811.-, más intereses pactados y costas, requerir de pago al deudor y disponer se siga adelante esta ejecución hasta que a mi representada se le haga entero y cumplido pago de todo lo adeudado, con expresa condena en costas.      
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSI:</strong> Solicito a S.S. tener por acompañados, bajo apercibimiento del artículo 346 N°3 del Código de Procedimiento Civil,  el pagare individualizado en lo principal de esta presentación, respecto del cual solicito su custodia.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SEGUNDO OTROSI:</strong> Solicito a S.S., tener presente que señalo para la traba del embargo todos los bienes del ejecutado, corporales e incorporales, muebles e inmuebles, y todos los que puedan aparecer en el futuro, los que permanecerán en su poder en calidad de depositario provisional, bajo su responsabilidad civil y penal. 
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>TERCER OTROSI:</strong> Ruego a SS. tener presente que mi personería para actuar en representación del Banco del Estado de Chile, consta en escritura pública de fecha 22 de Noviembre de 2013, otorgada en la Notaria de Santiago de don (ña) Maria Gloria Acharan Toledo, que en copia acompaño con citación, y solicito se tenga por exhibida para los efectos del artículo 6 del mismo cuerpo legal.. 
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>CUARTO OTROSI:</strong> Ruego a US. tener presente, que el representante legal del BANCO DEL ESTADO DE CHILE es, conforme a su Ley Orgánica, su Gerente General Ejecutivo, actualmente don Pablo Bernardino Piñera Echenique, ingeniero comercial, domiciliado en Avenida Libertador Bernardo O`Higgins N° 1111, cuarto piso, Santiago, según consta del Decreto Supremo de Hacienda N° 91 publicado en el Diario Oficial de fecha 21 de Abril de 2008.
                <br />
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>QUINTO OTROSI:</strong> Solicito a S.S. tener presente que designo abogado patrocinante y que confiero poder en esta causa, al abogado habilitado para el ejercicio de la profesión JOSE SANTANDER ROBLES, domiciliado para estos efectos en Estado N° 359 – piso 13, Santiago, quien firma en señal de aceptación. 
            </p>
        </div>
    </form>
</body>
</html>
