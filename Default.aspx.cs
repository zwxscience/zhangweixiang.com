using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace zwx
{
    public partial class _Default : System.Web.UI.Page
    {
        public static int visitCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                try
                {
                    visitCount = VisitCount.GetVisitCount();
                }
                catch (System.Exception ex)
                {
                    Log.writeLog("读取访问文件错误：" + ex.Message);
                    visitCount = 0;
                }
                string log = VisitCount.SetVisitCount(visitCount + 1);
                if (log != "")
                {
                    Log.writeLog(log);
                }

            }
        }
    }
}