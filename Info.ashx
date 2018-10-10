<%@ WebHandler Language="C#" Class="Info" %>

using System;
using System.Web;
using System.IO;
using System.Xml;
public class Info : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
       string name= "";
       string email= "";
       string message= "";
       if (context.Request.Form["name"] != null)
       {
           name = context.Request.Form["name"];
        }
       if (context.Request.Form["email"] != null)
        {
            email = context.Request.Form["email"];
        }
       if (context.Request.Form["message"] != null)
        {
            message = context.Request.Form["message"];
        }

        //将值写入txt
       if (name!=""&&email!=""&&message!=""&&message.Length>=5&&message.Length<=150)
        makeSuggesttion(name, email, message, context);
    //    context.Response.Write("Hello World");

    }

    /// <summary>
    /// 生成新的xml文件
    /// </summary>
    /// <param name="name"></param>
    /// <param name="email"></param>
    /// <param name="message"></param>
    /// <param name="context"></param>
    void makeSuggesttion(string name, string email, string message, HttpContext context)
    {
        
        string filePath = System.Web.HttpContext.Current.Server.MapPath("~") ;

        try
        {
            
            if (!Directory.Exists(filePath))//文件夹不存在
            {
                Directory.CreateDirectory(filePath);//创建文件夹
            }

          //  string fileName = "Suggestion_" + DateTime.Now.Year.ToString() + "_" + DateTime.Now.Month.ToString()  + ".txt";
            string fileName = "Suggestion.txt";
            filePath = filePath + "\\private\\" + fileName;
            if (File.Exists(filePath))
            {
                using (StreamWriter sw = File.AppendText(filePath))
                {
                    sw.WriteLine(DateTime.Now.ToString());
                    sw.WriteLine("姓名："+name);
                    sw.WriteLine("email：" + email);
                    sw.WriteLine("message：" + message);
                    sw.WriteLine("");
                    sw.Flush();
                    sw.Close();
                }
            }
            else
            {
                FileStream NewText = File.Create(filePath);
                NewText.Close();

                using (StreamWriter sw = File.AppendText(filePath))
                {
                    sw.WriteLine(DateTime.Now.ToString());
                    sw.WriteLine("姓名：" + name);
                    sw.WriteLine("email：" + email);
                    sw.WriteLine("message：" + message);
                    sw.WriteLine("");
                    sw.Flush();
                    sw.Close();
                }
            }
        }
        catch (Exception ex)
        {
            context.Response.Write("fail");
            return;
        }
        context.Response.Write("sucess");
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}