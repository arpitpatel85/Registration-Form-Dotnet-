<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRegister.aspx.cs" Inherits="UserRegister" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Registration</title>
    <style>
        /* Page Background & Layout */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f3;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        /* Main Container: Wide layout optimized for Desktop */
        .form-Container {
            background: #ffffff;
            max-width: 1250px;
            margin: 20px auto;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        /* Main Heading */
        .form-heading {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 28px;
            border-bottom: 2px solid #eaeaea;
            padding-bottom: 12px;
            letter-spacing: 0.5px;
        }

        /* Fieldset Styling */
        .form-fieldset {
            border: 2px solid #dcdde1;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 25px;
            background-color: #fafbfc;
        }

        /* Legend Styling */
        .form-legend {
            font-weight: 600;
            background-color: #2980b9;
            color: white;
            padding: 6px 16px;
            border-radius: 4px;
            font-size: 14px;
            letter-spacing: 0.5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
        }

        /* Flexbox Row for Multi-column layout */
        .form-row {
            display: flex;
            gap: 15px;
            flex-wrap: nowrap;
            align-items: flex-start;
        }

        /* Individual Column Width Equalizer */
        .form-col {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* Labels */
        .form-label {
            font-weight: 600;
            margin-bottom: 6px;
            color: #34495e;
            font-size: 13px;
        }

        /* Textboxes, Dropdowns, and Inputs */
        .form-input {
            padding: 10px 12px;
            border: 1px solid #bdc3c7;
            border-radius: 6px;
            font-size: 13px;
            background-color: #fff;
            width: 100%;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

            .form-input:focus {
                border-color: #3498db;
                box-shadow: 0 0 6px rgba(52, 152, 219, 0.3);
                outline: none;
            }

        /* Adjust Textareas (Addresses) size */
        .form-textarea {
            resize: vertical;
            height: 75px;
        }

        /* Radio Button List Fixes */
        .form-label-radio {
            display: flex;
            gap: 15px;
            margin-top: 8px;
            font-size: 13px;
        }

            .form-label-radio label {
                margin-left: 4px;
                cursor: pointer;
                font-weight: normal;
            }

        /* Buttons Row */
        .form-buttons-row {
            justify-content: center;
            gap: 20px;
            margin-top: 10px;
        }

        /* Action Buttons Styling */
        .form-btn {
            padding: 12px 35px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 200px;
        }

        .btn-submit {
            background-color: #27ae60;
            color: white;
        }

            .btn-submit:hover {
                background-color: #219653;
            }

        .btn-reset {
            background-color: #e74c3c;
            color: white;
        }

            .btn-reset:hover {
                background-color: #c0392b;
            }

            /* --- Modern GridView Styling for #gdView --- */
#gdView {
    width: 100%;
    margin-top: 30px;
    border-collapse: collapse;
    background-color: #ffffff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
    font-size: 12px;
}

#gdView th {
    background-color: #2980b9; /* Aapke form ke legend color se match karta hua */
    color: #ffffff;
    padding: 12px 10px;
    text-align: left;
    font-weight: 600;
    white-space: nowrap; /* Header text ek line me rahega */
}

#gdView td {
    padding: 10px 10px;
    border-bottom: 1px solid #eaeaea;
    color: #333333;
    max-width: 150px;
    word-break: break-word; /* Lambi addresses ya URLs ko break hone se rokne ke liye */
}

#gdView tr:nth-child(even) {
    background-color: #f8f9fa; /* Zebra striping effect */
}

#gdView tr:hover {
    background-color: #f1f4f6; /* Mouse hover karne par highlight hoga */
    transition: background-color 0.2s ease;
}
/* --- GridView Action Buttons Styling --- */
        .grid-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            color: #ffffff;
            transition: background-color 0.2s ease;
            margin-right: 5px;
            margin-top:4px;
        }

        .btn-edit {
            background-color: #3498db; /* Blue for Edit */
        }

        .btn-edit:hover {
            background-color: #2980b9;
        }

        .btn-delete {
            background-color: #e74c3c; /* Red for Delete */
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }  

  </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-Container">
            <h2 class="form-heading">Register Here</h2>

            <%-- SECTION 1: Personal Details (4 items in a row) --%>
            <fieldset class="form-fieldset">
                <legend class="form-legend">Personal Details</legend>
                <div class="form-row">
                    <div class="form-col">
                        <label class="form-label">Name</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-input" placeholder="Name" ></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Father's Name</label>
                        <asp:TextBox runat="server" ID="txtFatherName" CssClass="form-input" placeholder="Father's Name" ></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Mother's Name</label>
                        <asp:TextBox runat="server" ID="txtMotherName" CssClass="form-input" placeholder="Mother's Name"></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Gender</label>
                        <asp:RadioButtonList runat="server" ID="rblGender" CssClass="form-label-radio" >
                            <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </fieldset>

            <%-- SECTION 2: Contact Details (5 items in a row) --%>
            <fieldset class="form-fieldset">
                <legend class="form-legend">Contact Details</legend>
                <div class="form-row">
                    <div class="form-col">
                        <label class="form-label">Email-Id</label>
                        <asp:TextBox runat="server" ID="txtEmailId" CssClass="form-input" placeholder="Example@gmail.com" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Mobile-No</label>
                        <asp:TextBox runat="server" ID="txtMobileNo" CssClass="form-input" placeholder="0000000000" MaxLength="10" ></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">LinkedIn Url</label>
                        <asp:TextBox runat="server" ID="txtLinkdin" CssClass="form-input" placeholder="LinkedIn URL" TextMode="Url"></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Instagram</label>
                        <asp:TextBox runat="server" ID="txtInstagram" CssClass="form-input" placeholder="Instagram URL"></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Discord</label>
                        <asp:TextBox runat="server" ID="txtDiscort" CssClass="form-input" placeholder="Discord URL"></asp:TextBox>
                    </div>
                </div>
            </fieldset>

            <%-- SECTION 3: Address & Location Details (5 items in a row) --%>
            <fieldset class="form-fieldset">
                <legend class="form-legend">Address Details</legend>
                <div class="form-row">
                    <div class="form-col">
                        <label class="form-label">Permanent Address</label>
                        <asp:TextBox runat="server" ID="txtPerAddress" CssClass="form-input form-textarea" TextMode="MultiLine" placeholder="Permanent Address"></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Current Address</label>
                        <asp:TextBox runat="server" ID="txtCurAddress" CssClass="form-input form-textarea" TextMode="MultiLine" placeholder="Current Address"></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">City</label>
                        <asp:DropDownList runat="server" ID="ddlCity" CssClass="form-input" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <div class="form-col">
                        <label class="form-label">State</label>
                        <asp:DropDownList runat="server" ID="ddlState" CssClass="form-input">
                        </asp:DropDownList>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Country</label>
                        <asp:DropDownList runat="server" ID="ddlCountry" CssClass="form-input">
                        </asp:DropDownList>
                    </div>
                </div>
            </fieldset>

            <%-- SECTION 4: Buttons Row --%>
            <div class="form-row form-buttons-row">
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" CssClass="form-btn btn-submit" />
                <asp:Button runat="server" ID="btnReset" Text="Reset" OnClick="btnReset_Click" CssClass="form-btn btn-reset" />
            </div>

        </div>
        <asp:GridView runat="server" ID="gdView" DataKeyNames="Id" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate><%#Eval("Name") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="FatherName">
                    <ItemTemplate><%#Eval("FatherName") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="MotherName">
                    <ItemTemplate><%#Eval("MotherName") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate><%#Eval("Gender") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EmailId">
                    <ItemTemplate><%#Eval("EmailId") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="MobileNo">
                    <ItemTemplate><%#Eval("MobileNo") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Linkdin">
                    <ItemTemplate><%#Eval("Linkdin") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Instagram">
                    <ItemTemplate><%#Eval("Instgram") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="PermanentAddress">
                    <ItemTemplate><%#Eval("PermanentAddress") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="CurrentAddress">
                    <ItemTemplate><%#Eval("CurrentAddress") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="CityName">
                    <ItemTemplate><%#Eval("CityName") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="StateName">
                    <ItemTemplate><%#Eval("StateName") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="CountryName">
                    <ItemTemplate><%#Eval("CountryName") %></ItemTemplate>
                </asp:TemplateField>

                
           <asp:TemplateField HeaderText="Action">
                   <ItemTemplate>
                     <asp:Button  Text="Edit" runat="server" ID="btnEdit" OnClick="btnEdit_Click" CssClass="grid-btn btn-edit"/>
                      <asp:Button  Text="Delete" runat="server" ID="btnDelete" OnClick="btnDelete_Click" CssClass="grid-btn btn-delete"  OnClientClick="return confirm('Are you sure you want to delete data?');"/>
                           </ItemTemplate>
                       </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
