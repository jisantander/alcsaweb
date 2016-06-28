<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocu.aspx.cs" Inherits="MEL_NC.ViewDocu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Untitled Page</title>
    
<script language="javascript" type="text/javascript">
    
    function Mostrar(doc)
    {
        if(doc == null || doc == '')
        {
           alert('No existe documento');
           return false;
        }
    
          url = 'http://www.alcsa.cl/documentos/' + doc;
    
	      pWin = window.open (url, 'newWin', 'width=800,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
	     
	      if (window.pWin) 
		    pWin.focus()
		    
		  return false;
    }
     
 </script>
    
    
</head>
<body>

    <form id="form1" runat="server">
    
    <asp:Button ID="Button1" runat="server" Text="Ver" />
    
    
    <asp:GridView runat="server"    
            ID="gwGrilla"  
            AutoGenerateColumns="false" 
            PageSize="200"
            AllowPaging="True"  
            Width="99%"  
            CellSpacing="1" 
            CellPadding="1" 
            OnRowCommand="Editar"                  
            GridLines="None">
            
            <Columns>
            
                <asp:BoundField DataField="Column1" HeaderText="Column1" SortExpression="Column1" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Column2" HeaderText="Column2" SortExpression="Column2" HeaderStyle-HorizontalAlign="Center" />
                
           
                <asp:TemplateField HeaderText="IdContratista" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblArchivo" runat="server" Text='<%# Bind("Column2") %>' SortExpression = "lblArchivo"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                        
                <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Left">
                 <ItemTemplate>
                     <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="images/icons/ico_modificar.gif" Width="18" Height="18"   ToolTip="Editar" CommandName="Editar" Visible="true" />
                 </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
            
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
       </asp:GridView>
    
    
    </form>
</body>

</html>
