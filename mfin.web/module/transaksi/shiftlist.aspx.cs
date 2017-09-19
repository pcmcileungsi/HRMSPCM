using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Globalization;
using System.Collections.Generic;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;
using System.Linq;
using MFin.DataAccessLayer.Master;


public partial class module_transaksi_shiftlist : BasePage
{
        System.Data.DataTable dtx
        {
            get
            {
                return (System.Data.DataTable)ViewState["dt"];
            }
            set
            {
                ViewState["dt"] = value;
            }
        }

        string isRows
        {
            get
            {
               return (string)ViewState["isRows"];
            }
            set
            {
                ViewState["isRows"] = value;
            }
        } 

        bool isEditMode
        {
            get
            {
                if (ViewState["isEditMode"] == null)
                    return false;
                return (bool)ViewState["isEditMode"];
            }
            set
            {
                ViewState["isEditMode"] = value;
            }
        }
		
		bool isAdddMode
        {
            get
            {
                if (ViewState["isAdddMode"] == null)
                    return false;
                return (bool)ViewState["isAdddMode"];
            }
            set
            {
                ViewState["isAdddMode"] = value;
            }
        }

        private static string _RoleCode = "B100139";		

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadInit();

            if (!IsPostBack)
            {
                CheckRole(_RoleCode);				
				
				TahunOption(ddlYear, DateTime.Now.Year.ToString());
                BindUnitKerja();
                BindGridSearch();
               
                isEditMode = false;
				isAdddMode = false;
                btnsimpan.Visible = false;
				btnCancel.Visible = false;               
            }
        }
		
		private bool IsNumeric(string strInput)
        {
            decimal output;
            return decimal.TryParse(strInput, out output);
        }
		
		private void TahunOption(DropDownList oCombo, string cDefault)
        {
            int nNow = DateTime.Now.Year;
            for (int n = nNow; n >= 2010; n--)
            {                
                oCombo.Items.Add(new ListItem(n.ToString(), n.ToString()));
                if (n.ToString() == cDefault)
                {
                    oCombo.SelectedValue = n.ToString();
                }
            }
        }
		
		private void BindUnitKerja()
		   {
			 MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
			 Hashtable _htParameters = null;

			try
			{
				_dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
				_htParameters = new Hashtable();

			   _htParameters["p_keywords"] = "";
			   _htParameters["p_majelis"] = "";

				ddlUnitKerja.DataSource = _dalMST_UNIT_KERJA_DAL.GetRows(_htParameters);
				ddlUnitKerja.DataValueField = "KODE";
				ddlUnitKerja.DataTextField = "NAMA";
				ddlUnitKerja.DataBind();
			}
			catch (Exception ex)
			{
				Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
			}
		  }

        protected void bindGrid2(DataTable dt)
        {
            dtx = dt;
            string[] selectedColumns = new[] { "NIK", "NAMA" };
            dtx = new DataView(dtx).ToTable(false, selectedColumns);

            GridView.Columns.Clear();                    

            int j = 0;
            int year = Convert.ToInt32(ddlYear.SelectedValue.ToString());
            int month = Convert.ToInt32(ddlMonth.SelectedValue.ToString());
            DateTime current = new DateTime(year, month, 1);
            string monthstr = current.ToString("MM", CultureInfo.InvariantCulture);
            DateTime next = current.AddMonths(1);
            int days = (next - current).Days;
            for (int i = 1; i <= days; i++)
            {
                if (i < 10)
                {
                   dtx.Columns.Add("0" + i);
                }
                else
                {
                    dtx.Columns.Add(i.ToString());
                }
            }
          
            foreach (DataColumn col in dtx.Columns)
            {
                BoundField field = new BoundField();
                field.HeaderText = col.ColumnName;
                field.DataField = col.ColumnName;              

                GridView.Columns.Add(field);               
            }

            for (int l = 0; l < dtx.Rows.Count; l++)
            {
                for (int k = 2; k <= dtx.Columns.Count - 1; k++)
                {
                    dtx.Rows[l][k] = "";
                }
            }        
                       
            GridView.DataSource = dtx;
            GridView.DataBind();
        }
        void BindData(DataTable dt)
        {
            dtx = dt;
            GridView.Columns.Clear();
            for (int i = 0; i <= dtx.Columns.Count - 1; i++)
            {
                TemplateField ItemTmpField = new TemplateField();
                ItemTmpField.HeaderText = dtx.Columns[i].ColumnName;
                ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.Item, dtx.Columns[i].ColumnName, "Label");
                GridView.Columns.Add(ItemTmpField);
            }

            GridView.DataSource = dtx;
            GridView.DataBind();
        }     

		protected void bindGrid()
        {					
            GridView.Columns.Clear();

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("NIK", typeof(string)));
            dt.Columns.Add(new DataColumn("NAMA", typeof(string)));

            int j = 0;
            int year = Convert.ToInt32(ddlYear.SelectedValue.ToString());
            int month = Convert.ToInt32(ddlMonth.SelectedValue.ToString());
            DateTime current = new DateTime(year, month, 1);
            string monthstr = current.ToString("MM", CultureInfo.InvariantCulture);
            DateTime next = current.AddMonths(1);
            int days = (next - current).Days;
            for (int i = 1; i <= days; i++)
            {
                if (i < 10)
                {
                     //dt.Columns.Add("0" + i + "/" + monthstr + "/" + year);
                    dt.Columns.Add("0" + i);
                }
                else
                {
                     //dt.Columns.Add(i + "/" + monthstr + "/" + year);
                    dt.Columns.Add(i.ToString());
                }
            }

            DataRow dr = null;
            dr = dt.NewRow();
            foreach (DataColumn col in dt.Columns)
            {
                BoundField field = new BoundField();
                field.HeaderText = col.ColumnName;
				
                field.DataField = col.ColumnName;
                //if (col.ColumnName == "Kode" || col.ColumnName == "Desc")
                //    field.DataField = "Kode";
                //else
                //    field.HeaderText = "Tgl " + col.ColumnName.Substring(0, 2);

                GridView.Columns.Add(field);
                dr[col.ColumnName] = "";
            }
            dt.Rows.Add(dr);           

            dtx = dt;
            GridView.DataSource = dt;
            GridView.DataBind();
        }            	

        void BindData()
        {
			GridView.Columns.Clear();
            for (int i = 0; i <= dtx.Columns.Count - 1; i++)
            {
                TemplateField ItemTmpField = new TemplateField();
                ItemTmpField.HeaderText = dtx.Columns[i].ColumnName;
                ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.Item, dtx.Columns[i].ColumnName, "Label");
                GridView.Columns.Add(ItemTmpField);
            }
			
            GridView.DataSource = dtx;
            GridView.DataBind();
        }     
       
         //void SaveData()
        //{
        //    for (int i = 0; i < dtx.Rows.Count; i++)
        //    {
        //        for (int j = 0; j < dtx.Columns.Count; j++)
        //        {
        //            dtx.Rows[i][j] = ((TextBox)GridView.Rows[i].Cells[j].Controls[0]).Text;
        //        }
        //    }
        //    bindGrid();
        //}			
        

        private void BindGridSearch()
        {
            DataTable dt = new DataTable();
            MST_SHIFT_DAL _dalMST_SHIFT = null;
            Hashtable _htParameters = null;

            try
            {
                _dalMST_SHIFT = new MST_SHIFT_DAL();
                _htParameters = new Hashtable();

                _htParameters["p_Year"] = ddlYear.SelectedValue.ToString();
                _htParameters["p_Month"] = ddlMonth.SelectedValue.ToString();
                _htParameters["p_KODE_UNIT_KERJA"] = ddlUnitKerja.SelectedValue.ToString();
                _htParameters["p_STATUS_SHIFT"] = ddlStatus.SelectedValue.ToString();

                dt = _dalMST_SHIFT.GetRows_HR_SHIFT(_htParameters);
				
				if (dt.Columns.Count < 10)
				{
					//bindGrid();
                    bindGrid2(dt);
                    isRows = "0"; //insert                    
				}
				else
				{
					//BindData();
                    BindData(dt);
                    isRows = "1"; //update                    
				}              
            }
            catch (Exception ex)
            {
                Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
            }
        } 

        private void BindGridAdd()
        {
			isRows = "2"; //update-insert   
			GridView.Columns.Clear();
			
			        //template insert --> NIK
                    for (int i = 0; i < dtx.Columns.Count - (dtx.Columns.Count - 1); i++)
                    {
                        TemplateField ItemTmpField = new TemplateField();
                        ItemTmpField.HeaderText = dtx.Columns[i].ColumnName;
                        ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.EditItem, dtx.Columns[i].ColumnName, "Textbox");
                        GridView.Columns.Add(ItemTmpField);
                    }
                    //template insert --> NAMA
                    for (int i = 1; i <= dtx.Columns.Count - (dtx.Columns.Count - 1); i++)
                    {
                        TemplateField ItemTmpField = new TemplateField();
                        ItemTmpField.HeaderText = dtx.Columns[i].ColumnName;
                        ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.EditItem, dtx.Columns[i].ColumnName, "Textbox"); //DropDownPeg
                        GridView.Columns.Add(ItemTmpField);
                    }
					//template insert --> tgl
                    for (int j = 2; j <= dtx.Columns.Count - 1; j++)
                    {
                        TemplateField ItemTmpField = new TemplateField(); //dt.Columns[4].DataType.Name ;dtx.Columns[j].ColumnName.Substring(0, 2)
                        ItemTmpField.HeaderText = dtx.Columns[j].ColumnName;
                        ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.EditItem, dtx.Columns[j].ColumnName, "DropDown");
                        GridView.Columns.Add(ItemTmpField);
                    }
					
			GridView.DataSource = dtx;
            GridView.DataBind();
		}			
		
		protected void btnAdd_Click(object sender, EventArgs e)
        {      
           isEditMode = true;		
		   isAdddMode = true;		   
		   
		   bindGrid();
		   BindGridAdd();
		   
		   //btnAdd.Visible = false; 
           btnCancel.Visible = true;
           btnsimpan.Visible = true;
		   btnsimpan.Text = "Save";		   
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridSearch();

            isEditMode = false;
            isAdddMode = false;

            if (dtx.Rows.Count > 0)
            {
                //btnAdd.Visible = true;
                btnCancel.Visible = false;
                btnsimpan.Visible = true;
                btnsimpan.Text = "Edit";
            }
        } 
		
		protected void btnCancel_Click(object sender, EventArgs e)
        {
            //isEditMode = !isEditMode;
            //BindData();
            //btnCancel.Visible = false;          
			//btnsimpan.Text = "Edit";
			
			if (isAdddMode)
            {
				MST_SHIFT_DAL _dalMST_SHIFT = new MST_SHIFT_DAL();
                Hashtable _htParameters = new Hashtable();
				
                _htParameters["p_Year"] = ddlYear.SelectedValue.ToString();
                _htParameters["p_Month"] = ddlMonth.SelectedValue.ToString();
                _htParameters["p_KODE_UNIT_KERJA"] = ddlUnitKerja.SelectedValue.ToString();
                _htParameters["p_STATUS_SHIFT"] = ddlStatus.SelectedValue.ToString();

                dtx = _dalMST_SHIFT.GetRows_HR_SHIFT(_htParameters);
				
				isAdddMode = false;
				//btnAdd.Visible = true; 
			}
			else
			{
				isEditMode = !isEditMode;                
			}
			//BindData();
            BindData(dtx);
            btnCancel.Visible = false;          
			btnsimpan.Text = "Edit";
        }
		
        protected void btnsimpan_Click(object sender, EventArgs e)
        {
            isEditMode = !isEditMode;
			
            if (isEditMode)
            {
                btnsimpan.Text = "Save";
                btnCancel.Visible = true;

                GridView.Columns.Clear();

                string nik = dtx.Rows[0][0].ToString();
                if (nik == "")
                {
                    //template insert --> NIK
                    for (int i = 0; i < dtx.Columns.Count - (dtx.Columns.Count - 1); i++)
                    {
                        TemplateField ItemTmpField = new TemplateField();
                        ItemTmpField.HeaderText = dtx.Columns[i].ColumnName;
                        ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.EditItem, dtx.Columns[i].ColumnName, "Textbox");
                        GridView.Columns.Add(ItemTmpField);
                    }
                    //template insert --> NAMA
                    for (int i = 1; i <= dtx.Columns.Count - (dtx.Columns.Count - 1); i++)
                    {
                        TemplateField ItemTmpField = new TemplateField();
                        ItemTmpField.HeaderText = dtx.Columns[i].ColumnName;
                        ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.EditItem, dtx.Columns[i].ColumnName, "Textbox"); //DropDownPeg
                        GridView.Columns.Add(ItemTmpField);
                    }
                }
                else
                {
                    //template update --> tgl
                    for (int i = 0; i <= dtx.Columns.Count - (dtx.Columns.Count - 1); i++)
                    {
                        TemplateField ItemTmpField = new TemplateField();
                        ItemTmpField.HeaderText = dtx.Columns[i].ColumnName;
                        ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.EditItem, dtx.Columns[i].ColumnName, "Textbox");
                        GridView.Columns.Add(ItemTmpField);
                    }
                }                
               
                				
                for (int j = 2; j <= dtx.Columns.Count - 1; j++)                
                {
					TemplateField ItemTmpField = new TemplateField(); //dt.Columns[4].DataType.Name ;dtx.Columns[j].ColumnName.Substring(0, 2)
                    ItemTmpField.HeaderText = dtx.Columns[j].ColumnName;
					ItemTmpField.ItemTemplate = new DynamicallyTemplatedGridViewHandler(ListItemType.EditItem, dtx.Columns[j].ColumnName, "DropDown");                    
                    GridView.Columns.Add(ItemTmpField);
                }
                GridView.DataSource = dtx;
                GridView.DataBind();
            }
            else
            {
                btnsimpan.Text = "Edit";  
                btnCancel.Visible = false;	
				
				//awal
                List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("GridView")).ToList();
				if (keys.Count > 0)
				{                
					string[] ctrls = Request.Form.ToString().Split('&');
					string ctrlValue = "";
					string ctrlName = "";
					string tgl = "";
                    string nik = "";
												  
					for (int i = 0; i < ctrls.Length; i++)
					{
                        if (ctrls[i].Contains("GridView"))
						{						 
							ctrlName = ctrls[i].Split('=')[0];
							ctrlValue = ctrls[i].Split('=')[1];

							//Decode the Value
							ctrlValue = Server.UrlDecode(ctrlValue);					
							ctrlName = Server.UrlDecode(ctrlName);                          
							tgl = ctrlName.Substring(ctrlName.Length - 2, 2);

                            if (!IsNumeric(tgl))
                            {
                                if (ctrlName.Substring(ctrlName.Length - 3, 3) == "NIK")
                                {
                                    nik = ctrlValue;                                    
                                }
                                if (ctrlName.Substring(ctrlName.Length - 4, 4) == "NAMA")
                                {
                                    if (nik == "") nik = ctrlValue;
                                }
                                
                                continue;
                            }                           

                            MST_SHIFT_DAL _dalMST_SHIFT = new MST_SHIFT_DAL();
                            Hashtable _htParameters = new Hashtable();
                            _htParameters["p_KODE_REFF_SHIFT"] = ctrlValue;
                            _htParameters["p_NIK"] = nik;
                            _htParameters["p_KODE_UNIT_KERJA"] = ddlUnitKerja.SelectedValue;
                            _htParameters["p_TANGGAL_SHIFT"] = ddlYear.SelectedValue + "-" + ddlMonth.SelectedValue + "-" + tgl;
                            _htParameters["p_STATUS_SHIFT"] = ddlStatus.SelectedValue;
                            Utility.ApplyDefaultProp(_htParameters);

                            //if (isRows == "0")
                            //{
                            //    //insert  
                            //    _dalMST_SHIFT.InsertHR_Shift(_htParameters);
                            //}
                            //else if (isRows == "1")
                            //{
                            //    //update                                
                            //    _dalMST_SHIFT.UpdateHR_Shift(_htParameters);
                            //} 
                            //else
                            //{
                            //    //update-insert                                
                            //    _dalMST_SHIFT.UpdateInsertHR_Shift(_htParameters);
                            //}                                                     
                             _dalMST_SHIFT.UpdateInsertHR_Shift(_htParameters);
							
						}
					}               
				}  
                //akhir	

                BindGridSearch();
                btnsimpan.Visible = false;
				
				//btnAdd.Visible = true;				
				isAdddMode = false;
				
                //List<string> colors = new List<string>(); 
                //colors.Add("Red"); 
                //colors.Add("Blue"); 
                //colors.Add("Green");
                //foreach (string color in colors) //for (int i = 0; i < colors.Count; i++)
                //{ 
                    
                //}
				
			    //foreach (GridViewRow row in GridView.Rows)
                //{
                //    for (int i = 0; i < GridView.Columns.Count; i++)
                //    {
                //        String header = GridView.Columns[i].HeaderText;
                //        String cellText = row.Cells[i].Text;
                //    }
                //}
                //int x = 2;
                //foreach (GridViewRow row in GridView.Rows)
                //{
                //    DropDownList FCCrrr = new DropDownList();
                //    FCCrrr = (DropDownList)row.FindControl("DropDown" + x);
                //    string abc = FCCrrr.SelectedValue;
                //    x++;
                //}                
            }           
        }
		
		 protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView.PageIndex = e.NewPageIndex;
            //BindGridSearch();
        }

         protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
         {
             btnsimpan.Visible = false;
             btnCancel.Visible = false;	
         }
         protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
         {
             btnsimpan.Visible = false;
             btnCancel.Visible = false;	
         }
         protected void ddlUnitKerja_SelectedIndexChanged(object sender, EventArgs e)
         {
             btnsimpan.Visible = false;
             btnCancel.Visible = false;	
         }
         protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
         {
             btnsimpan.Visible = false;
             btnCancel.Visible = false;	
         }
}

public class DynamicallyTemplatedGridViewHandler : ITemplate
{

    ListItemType ItemType;
    string FieldName;
    string InfoType;


    public DynamicallyTemplatedGridViewHandler(ListItemType item_type, string field_name, string control_type)
    {

        ItemType = item_type;
        FieldName = field_name;
        InfoType = control_type;
    }

    public void InstantiateIn(System.Web.UI.Control Container)
    {

        switch (ItemType)
        {
            case ListItemType.EditItem:

                if (InfoType == "Button")
                {

                    ImageButton update_button = new ImageButton();
                    update_button.ID = "update_button";
                    update_button.CommandName = "Update";
                    update_button.ToolTip = "Update";
                    update_button.OnClientClick = "return confirm('Are you sure to update the record?')";
                    Container.Controls.Add(update_button);

                    // Similarly, add a button for Cancel
                }
                else if (InfoType == "Textbox")
                // if other key and non key fields then bind textboxes with texts
                {

                    TextBox field_txtbox = new TextBox();
                    field_txtbox.ID = FieldName;
                    field_txtbox.Text = String.Empty;
                    field_txtbox.ReadOnly = true;
                    // if to update then bind the textboxes with coressponding field texts
                    //otherwise for insert no need to bind it with text 

                    //if ((int)new Page().Session["InsertFlag"] == 0)
                    field_txtbox.DataBinding += new EventHandler(OnDataBinding);

                    Container.Controls.Add(field_txtbox);
                }
                else if (InfoType == "Label")
                {
                    Label field_txtbox = new Label();
                    field_txtbox.ID = FieldName;
                    field_txtbox.Text = String.Empty;
                    field_txtbox.DataBinding += new EventHandler(OnDataBinding);                   

                    Container.Controls.Add(field_txtbox);
                }
                else if (InfoType == "DropDownPeg")
                {
                    HR_PEGAWAI_DAL _dalHR_PEGAWAI_DAL = new HR_PEGAWAI_DAL();
                    Hashtable _htParameters = new Hashtable();
                    DropDownList ddlPeg = new DropDownList();
                    ddlPeg.ID = FieldName;

                    _htParameters["p_keywords"] = "";
                    ddlPeg.DataSource = _dalHR_PEGAWAI_DAL.GetRows(_htParameters);
                    ddlPeg.DataValueField = "NIK";
                    ddlPeg.DataTextField = "NAMA";
                    ddlPeg.DataBind();
                   
                    Container.Controls.Add(ddlPeg);
                }
                else
                {
                    MST_SHIFT_DAL _dalMST_SHIFT = new MST_SHIFT_DAL();
                    Hashtable _htParameters = new Hashtable();
                    DropDownList ddlTgl = new DropDownList();
                    ddlTgl.ID = FieldName;
                   
                    _htParameters["p_keywords"] = "";
                    ddlTgl.DataSource = _dalMST_SHIFT.GetRowsKode(_htParameters);
                    ddlTgl.DataValueField = "KODE";
                    ddlTgl.DataTextField = "KODE";
                    ddlTgl.DataBind(); 
					ddlTgl.DataBinding += new EventHandler(OnDataBindingDDL);   

                    Container.Controls.Add(ddlTgl);
                }
                break;

            case ListItemType.Item:

                if (InfoType == "Label")
                {

                    Label field_txtbox = new Label();
                    field_txtbox.ID = FieldName;
                    field_txtbox.Text = String.Empty;
                    field_txtbox.DataBinding += new EventHandler(OnDataBinding);

                    Container.Controls.Add(field_txtbox);
                }
                break;
        }
    }

    protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //code for  DropDownList2_SelectedIndexChanged  
    }   

    private void OnDataBinding(object sender, EventArgs e)
    {
        object bound_value_obj = null;
        Control ctrl = (Control)sender;
        IDataItemContainer data_item_container =
        (IDataItemContainer)ctrl.NamingContainer;
        bound_value_obj = DataBinder.Eval(data_item_container.DataItem, FieldName);

        switch (ItemType)
        {
            case ListItemType.Item:
                Label field_ltrl = (Label)sender;
                field_ltrl.Text = bound_value_obj.ToString();

                break;

            case ListItemType.EditItem:               
                TextBox field_txtbox = (TextBox)sender;
                field_txtbox.Text = bound_value_obj.ToString();               

                break;
        }
    }  

    private void OnDataBindingDDL(object sender, EventArgs e)
    {
        object bound_value_obj = null;
        Control ctrl = (Control)sender;
        IDataItemContainer data_item_container =
        (IDataItemContainer)ctrl.NamingContainer;
        bound_value_obj = DataBinder.Eval(data_item_container.DataItem, FieldName);

        switch (ItemType)
        {
            case ListItemType.Item:
                Label field_ltrl = (Label)sender;
                field_ltrl.Text = bound_value_obj.ToString();

                break;

            case ListItemType.EditItem:
                DropDownList field_txtbox = (DropDownList)sender;
                if (bound_value_obj != "") field_txtbox.SelectedValue = bound_value_obj.ToString();
                //field_txtbox.Items.FindByValue(bound_value_obj.ToString()).Selected = true;
                break;
        }
    }
}
