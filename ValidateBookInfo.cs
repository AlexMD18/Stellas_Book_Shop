/*
Alex Drogo
09/30/2020
CIS 3342
Prof. Pascucci
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Book_Store;

namespace Book_Store
{
    public class ValidateBookInfo
    {

        //Validate to make sure at least one checkbox is selected in the gridview
        public bool isChecked(GridViewRow row)
        {
            CheckBox select = (CheckBox)row.FindControl("chkSelect");
            return select.Checked;
        }

        //Check Textboxes on form to ensure they contain values
        public bool checkTextBoxes(TextBox id, TextBox name, TextBox address, TextBox phone1, TextBox phone2, TextBox phone3, DropDownList campus)
        {
            if(id.Text != "" && name.Text != "" && address.Text != "" && phone1.Text != "" && phone2.Text != "" && phone3.Text != "" && campus.Text != "None Selected")
            {
                return true;
            }
            return false;
        }
    }
}