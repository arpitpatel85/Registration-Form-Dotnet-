using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRegister : System.Web.UI.Page
    
{
    DbFunctions objfun = new DbFunctions();
    protected void Page_Load(object sender, EventArgs e)

    {
        if (!IsPostBack)
        {
            //objfun.FillDropdownlist(ddlCountry, "CountryName", "CountryId", "Select CountryId,CountryName from Country", "--Select Country--");
            //objfun.FillDropdownlist(ddlState, "StateName", "StateId", "Select stateId,stateName from State", "--Select state--");
            objfun.FillDropdownlist(ddlCity, "CityName", "CityId", "Select CityId,CityName from City", "--Select City--");
            gridView();
        }
      
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(txtName.Text==""){
            objfun.MsgBox("Please Enter Name",this);
            txtName.Focus();
            return;
        }
        if (txtFatherName.Text == "") {
            objfun.MsgBox("Please Enter FatherName", this);
            txtFatherName.Focus();
            return;
        }
        if(txtMotherName.Text==""){
            objfun.MsgBox("Enter Mothername ",this);
            txtMotherName.Focus();
            return;
        }
        if (rblGender.SelectedValue == "")
        {
            objfun.MsgBox("Mark the Gender ", this);
            rblGender.Focus();
            return;
        }
        if(txtEmailId.Text==""){
            objfun.MsgBox("Fill Gender ", this);
            txtEmailId.Focus();
            return;
        }
        if (txtMobileNo.Text == "") {
            objfun.MsgBox("Fill the mobileNo ", this);
            txtMobileNo.Focus();
            return;
        }
        if (txtLinkdin.Text == "")
        {
            objfun.MsgBox("Fill the linkdin ", this);
            txtLinkdin.Focus();
            return;
        }
        if (txtInstagram.Text == "")
        {
            objfun.MsgBox("Fill the Instagram ", this);
            txtInstagram.Focus();
            return;
        }
        if (txtDiscort.Text == "")
        {
            objfun.MsgBox("Fill the Discort ", this);
            txtDiscort.Focus();
            return;
        }
        if (txtCurAddress.Text == "")
        {
            objfun.MsgBox("Fill the Current Address ", this);
            txtCurAddress.Focus();
            return;
        }
        if (txtPerAddress.Text == "")
        {
            objfun.MsgBox("Fill the Address ", this);
            txtPerAddress.Focus();
            return;
        }
        if (ddlCity.SelectedValue == "0")
        {
            objfun.MsgBox("Select City ", this);
            ddlCity.Focus();
            return;
        }
        if (ddlState.SelectedValue == "0")
        {
            objfun.MsgBox("Select State ", this);
            ddlState.Focus();
            return;
        }
        if (ddlCountry.SelectedValue == "0")
        {
            objfun.MsgBox("Select Country ", this);
            ddlCountry.Focus();
            return;
        }
        if (btnSubmit.Text == "Submit") {
            objfun.ExecuteDML("INSERT INTO MktReg(Name,FatherName,MotherName,Gender,EmailId,MobileNo,Linkdin,Instgram,Discord,PermanentAddress,CurrentAddress,CityName,StateName,CountryName)VALUES('" + txtName.Text + "','" + txtFatherName.Text + "','" + txtMotherName.Text + "','" + rblGender.SelectedValue + "','" + txtEmailId.Text + "','" + txtMobileNo.Text + "','" + txtLinkdin.Text + "','" + txtInstagram.Text + "','" + txtDiscort.Text + "','" + txtPerAddress.Text + "','" + txtCurAddress.Text + "','" + ddlCity.SelectedValue + "','" + ddlState.SelectedValue + "','" + ddlCountry.SelectedValue + "')");
            objfun.MsgBox("Data Submitted succesfully",this);
          
        }
        gridView();
      
        Reset();



    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }
    public void Reset() {
        txtName.Text = "";
        txtFatherName.Text = "";
        txtMotherName.Text = "";
        rblGender.ClearSelection();
        txtEmailId.Text = "";
        txtMobileNo.Text = "";
        txtLinkdin.Text = "";
        txtInstagram.Text = "";
        txtDiscort.Text = "";
        txtPerAddress.Text = "";
        txtCurAddress.Text = "";
        ddlCity.SelectedValue = "0";
        ddlState.SelectedValue = "0";
        ddlCountry.SelectedValue = "0";
    }
    public void gridView() {
        DataTable dt = new DataTable();
        dt = objfun.FillDataTable("SELECT MktReg.Id, MktReg.Name, MktReg.FatherName, MktReg.MotherName, MktReg.Gender, MktReg.EmailId, MktReg.MobileNo, MktReg.Linkdin, MktReg.Instgram, MktReg.Discord, MktReg.CurrentAddress, MktReg.PermanentAddress, MktReg.RegisteredDate, City.CityName AS CityName, State.StateName AS StateName, Country.CountryName AS CountryName FROM MktReg INNER JOIN City ON MktReg.CityName = City.CityId INNER JOIN State ON MktReg.StateName = State.StateId INNER JOIN Country ON MktReg.CountryName = Country.CountryId");
        if (dt.Rows.Count > 0)
        gdView.DataSource = dt;
        gdView.DataBind();

    
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        string Id=gdView.DataKeys[row.RowIndex].Value.ToString();
        objfun.ExecuteDML("DELETE FROM MktReg WHERE Id='" + Id + "'");
        objfun.MsgBox("Data Deleted successfully", this);
        gridView();

    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        objfun.FillDropdownlist(ddlState, "StateName", "StateId", "SELECT State.StateName, State.StateId FROM State INNER JOIN City ON State.StateId = City.StateID Where City.CityId='" + ddlCity.SelectedValue + "'", "--Select state--");
        if (ddlState.Items.Count > 1)
        {
            ddlState.SelectedIndex = 1;
        }
        

        objfun.FillDropdownlist(ddlCountry, "CountryName", "CountryId", "SELECT     Country.CountryId,   Country.CountryName FROM Country INNER JOIN State ON Country.CountryId = State.CountryId Where State.StateId='" + ddlState.SelectedValue + "'", "--Select Country--");
        if(ddlCountry.Items.Count>1){
            ddlCountry.SelectedIndex = 1;
            }
      
        
        }

    
}