<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CobranzaALC.principal.WebForm1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
 <link href="../css/alc.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <cc1:Accordion ID="Accordion1" runat="server"
                    SelectedIndex="0" 
                    Width="265px"
                    HeaderCssClass="accordionheader" 
                    ContentCssClass="accordioncontent" 
                    FadeTransitions="true"
                    FramesPerSecond="40" 
                    TransitionDuration="250" 
                    AutoSize="None">
                        <Panes>
                            
                            <cc1:AccordionPane ID="Left" runat="server">
                                <Header>
                                    <a href="javascript:;" class="accordionlink" onmouseout="window.status='M@PFRE - Nuestra oficina en su escritorio'; return true;" onmouseover="window.status='Left'; return true;">Veh&iacute;culos</a>
                                </Header>
                                <Content>
                                    <table cellpadding="0" cellspacing="0" style="border:0; width:250px;">
                                      ss
                                    </table>
                                </Content>
                            </cc1:AccordionPane>
                            
                            <cc1:AccordionPane ID="Right" runat="server">
                                <Header>
                                    <a href="javascript:;" class="accordionlink" onmouseout="window.status='M@PFRE - Nuestra oficina en su escritorio'; return true;" onmouseover="window.status='Right'; return true;">Siniestros</a>
                                </Header>
                                <Content>
                                    <table cellpadding="0" cellspacing="0" style="border:0; width:250px;">
                                        sss
                                    </table>
                                </Content>
                            </cc1:AccordionPane>

                        </Panes>
                    </cc1:Accordion>
    </form>
</body>
</html>

