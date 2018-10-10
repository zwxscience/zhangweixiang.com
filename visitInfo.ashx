<%@ WebHandler Language="C#" Class="zwx.visitInfo" %>

using System;
using System.Web;
using System.Xml;
using System.IO;
using System.Text;
namespace zwx
{
    public class visitInfo : IHttpHandler
    {

        string xmlFileName = PublicSet.visitXmlPath;
        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            // context.Response.Write("Hello World");
            string url = "";
            if (context.Request.QueryString["url"] != null)
            {
                url = context.Request.QueryString["url"];
            }
            string method = "";
            if (context.Request.QueryString["method"] != null)
            {
                method = context.Request.QueryString["method"];
            }
            string from = "";
            if (context.Request.QueryString["from"] != null)
            {
                from = context.Request.QueryString["from"];
            }
            string title = "";
            if (context.Request.QueryString["title"] != null)
            {
                title = context.Request.QueryString["title"];
            }
			string talkMsg = "";
			if (context.Request.QueryString["talkMsg"] != null)
			{
				talkMsg = context.Request.QueryString["talkMsg"];
			}
			

			if(talkMsg != "")
			{
				getTalkMsg(context);
				return;
			}
            if (url != null || url != "")
            {
                url = url.Trim();
            }
            string returnstr = "";
            if (method == "get")
            {

                if (url == "")
                {
                    returnstr = getPageNodes(from);
                }
                else
                {
                    returnstr = getPageNode(url);
                }
            }
            else
            {
                if (url != "" && updatePageNode(url,title,from))
                {
                    returnstr = "sucess";
                    returnstr = Newtonsoft.Json.JsonConvert.SerializeObject(returnstr);
                }
                else
                {
                    Log.writeLog("节点更新不成功,url:" + url);
                    returnstr = "fail";
                    returnstr = Newtonsoft.Json.JsonConvert.SerializeObject(returnstr);
                }
            }
            if (from == "mysite")
            {
                context.Response.Write(returnstr);
            }
            else
            {
                context.Response.Write("jsonpCallback(" + returnstr + ")");
            }

        }
        string getPageNodes(string from)
        {
            string xpath = "Site/Page";
            if(from != null && from != "")
            {
                xpath = "Site/Page[@from=\"" + from + "\"]";
            }
            XmlNodeList nodeList = XMLHelper.GetXmlNodeListByXpath(xmlFileName, xpath);
            string strAllNode = Newtonsoft.Json.JsonConvert.SerializeObject(nodeList);
            return strAllNode;
        }
        string getPageNode(string url)
        {
            string xpath = "Site/Page[@URL=\"" + url + "\"]";
            XmlNode targetnode = XMLHelper.GetXmlNodeByXpath(xmlFileName, xpath);
            return Newtonsoft.Json.JsonConvert.SerializeObject(targetnode);
        }

        bool updatePageNode(string checkurl,string title,string from)
        {
            string xpath = "Site/Page[@URL=\"" + checkurl + "\"]";
            string attributeName = "visitCount";
            XmlNode targetnode = XMLHelper.GetXmlNodeByXpath(xmlFileName, xpath);
            bool isSuccess = true;
            if (targetnode != null)
            {
                isSuccess = XMLHelper.CreateOrUpdateXmlAttributeByXPath(xmlFileName, xpath, attributeName, (Convert.ToInt32(targetnode.Attributes[attributeName].Value) + 1).ToString());

            }
            else
            {
                Log.writeLog("查找节点不存在:" + xpath);//创建新的节点
                xpath = "/Site";  //这是新节点的父节点路径
                string nodename = "Page"; //这是新节点名称,在父节点下新增
                string nodetext = checkurl;//"这是新节点中的文本值";
                attributeName = "URL"; //新属性名称
                string attributeValue = checkurl; //新属性值
                isSuccess = XMLHelper.CreateXmlNodeByXPath(xmlFileName, xpath, nodename, nodetext, attributeName, attributeValue);

                //向XML文档中的子节点中新增或修改（如果存在则修改）一个子节点属性,比如id,ISDN属性等：
                xpath = "Site/Page[@URL=\"" + checkurl + "\"]";
                attributeName = "visitCount"; //新属性名称
                attributeValue = "1"; //新属性值
                isSuccess = XMLHelper.CreateOrUpdateXmlAttributeByXPath(xmlFileName, xpath, attributeName, attributeValue);
                //向XML文档中的子节点中新增或修改（如果存在则修改）一个子节点属性,比如id,ISDN属性等：
                attributeName = "title"; //新属性名称
                attributeValue = title; //新属性值
                isSuccess = XMLHelper.CreateOrUpdateXmlAttributeByXPath(xmlFileName, xpath, attributeName, attributeValue);
                attributeName = "from"; //新属性名称
                attributeValue = from; //新属性值
                isSuccess = XMLHelper.CreateOrUpdateXmlAttributeByXPath(xmlFileName, xpath, attributeName, attributeValue);

            }
            return isSuccess;
        }
		void getTalkMsg(HttpContext context)
		{		
				string fileName = "D:\\personal\\test\\mobile\\assets\\funnyDialog.json";
				Stream s = new FileStream(fileName, FileMode.Open);
				StreamReader sr = new StreamReader(s,Encoding.UTF8);
				string content = sr.ReadToEnd().ToString();
				sr.Close();
				s.Close();
				content = Newtonsoft.Json.JsonConvert.SerializeObject(content);
				context.Response.Write(content);
		}
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}