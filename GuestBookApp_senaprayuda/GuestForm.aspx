<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestForm.aspx.cs" Inherits="GuestBookApp_senaprayuda.GuestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Guset Book</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>

<body>

     <form id="formLihat" runat="server">
        <div id="container">
            <div id="header">
                <h1>Guest Book</h1>
            </div>
            <div id="content" runat="server">
                <div id="lihat" runat="server">
            <asp:Button ID="btnTambah" runat="server" Text="Add Guest" OnClick="btnTambah_Click" />
            <br /><br />
             
            <asp:SqlDataSource ID="srcGuest" SelectCommand="selectGuest"
                    SelectCommandType="StoredProcedure"
                    ConnectionString="<%$ ConnectionStrings:GuestBook %>"  
                    runat="server" />

                    <asp:GridView 
                        ID="grdGuest" 
                        DataSourceID="srcGuest" 
                        AutoGenerateColumns="false"
                        DataKeyNames="id"
                        AllowPaging="true"
                        CssClass="grid" runat="server">
                        <Columns>
                            <asp:BoundField DataField="nama" HeaderText="Name" />
                            <asp:BoundField DataField="alamat" HeaderText="Address" />
                            <asp:BoundField DataField="provinsi" HeaderText="Province" />
                            <asp:BoundField DataField="gender" HeaderText="Gender" /> 
                            <asp:BoundField DataField="lahir" HeaderText="Birthdate" />
                            <asp:BoundField DataField="pesan" HeaderText="Message" />
                            
                            </Columns>
                           </asp:GridView>
                        </div>
    

     <div id="tambah" runat="server">

            <h1>Guest Book</h1>
            <asp:Label ID="lblNama" Text="Name:" runat="server"/>&nbsp; 
            <asp:TextBox ID="txtNama" runat="server" Width="425px" /><br /><br />
            <asp:Label ID="lblAlamat" Text="Address:" runat="server"/>&nbsp; 
            <asp:TextBox ID="txtAlamat" runat="server" Width="425px" TextMode="MultiLine"/><br /><br />
            <asp:Label ID="lblProvinsi" Text="Province:" runat="server" />&nbsp; 
            <asp:DropDownList ID="ddlProvinsi" runat="server" Width="425px">
                <asp:ListItem>-Choose One-</asp:ListItem>
                <asp:ListItem>Jawa Barat</asp:ListItem>
                <asp:ListItem>Jawa Timur</asp:ListItem>
                <asp:ListItem>Jawa Tengah</asp:ListItem>
                <asp:ListItem>Sumatra Barat</asp:ListItem>
                <asp:ListItem>Sumatra Utara</asp:ListItem>
                <asp:ListItem>Kalimantan Timur</asp:ListItem> 
                <asp:ListItem>Kalimantan Selatan</asp:ListItem>
                <asp:ListItem>Papua Barat</asp:ListItem>
                <asp:ListItem>Sulawesi Utara</asp:ListItem> 
                <asp:ListItem>Sulawesi Tenggara</asp:ListItem>
                <asp:ListItem>Maluku Utara</asp:ListItem>
            </asp:DropDownList>
          
        <br /><br />
            <asp:Label ID="lblJeniskelanin" Text="Gender:" runat="server"/>&nbsp;
            <asp:RadioButton GroupName="jKelamin" ID="jkPerempuan" Text="Female" runat="server" value="0"/>&nbsp;
            <asp:RadioButton GroupName="jKelamin" ID="jkLaki" Text="Male" runat="server" value="1" /><br /><br />
            <asp:Label ID="Label1" Text="Birthdate:" runat="server"/>&nbsp;
            <asp:TextBox ID="txtcalendar" runat="server" Width="425px" TextMode="Date"/><br /><br />
            <asp:Label ID="LblPesan" Text="Message:" runat="server"/>&nbsp;
            <asp:TextBox ID="txtPesan" runat="server" Width="425px" TextMode="Multiline" /><br /><br /> 
            <asp:Button ID="btnSimpan" class="button" runat="server" Text="Save" OnClick="btnSimpan_Click"/>&nbsp; &nbsp;
            <asp:Button ID="btnBatal" class="button1" runat="server" Text="Cancel" OnClick="btnBatal_Click" />
         </div>
   <br /><br />   
   </div>
   <div id="footer">
       Training Global Service Indonesia @2023
   </div>
</div>
   </form>

</body>
</html>