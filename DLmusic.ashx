<%@ WebHandler Language="C#" Class="DLmusic" %>

using System;
using System.Web;
using System.IO;
using zwx;

public class DLmusic : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        if (context.Request.QueryString["filepath"] == null)
        {
            context.Response.Write("<script type='text/javascript'>alert('传输参数错误.');</script>");
            return;
        }
        string filename = context.Request.QueryString["filepath"];


        string filePath = PublicSet.BasePath+"//private//music//PalMusic//" + filename;

        //  string showinfo=context.Session["ShowDetail"].ToString() ;
        //             if (showinfo != null && showinfo == "0")
        //             {
        //                 context.Response.Write("<script type=\"text/javascript\">alert('登录时间失效，请重新登录');windows.location.href=" + element.ImagePath + "/Detail/" + filename + ".html ;return;</script>");
        //                 return;
        //             }
        // FileInfo Fi = new FileInfo(filePath);
        bool IsfileExit = false;
        if (File.Exists(filePath))
            IsfileExit = true;
        

        if (IsfileExit)
        {
            try
            {
                //日志记录
                makeDLMusicLog("PALmusicLog", filename.ToString(), context);
            }
            catch (Exception ex)
            {
            }
            try
            {
                FileStream fs = new FileStream(filePath, System.IO.FileMode.Open, System.IO.FileAccess.Read, FileShare.ReadWrite);//防止文件被占用

                byte[] bytes = new byte[(int)fs.Length];
                fs.Read(bytes, 0, bytes.Length);
                fs.Close();
                context.Response.ContentType = "application/octet-stream;";//download file tag

                context.Response.Charset = "gb2312";
                context.Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(filename.ToString(), System.Text.Encoding.UTF8));
                context.Response.BinaryWrite(bytes);
                context.Response.Flush();
                context.Response.End();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                context.Response.Write("<script type='text/javascript'>alert('mp3文件在导出过程中发生错误,请刷新重试。');</script>");
            }
        }
        else
        {

            context.Response.Write("<script type='text/javascript'>alert('mp3文件在服务器端已被清理,请刷新重试.');</script>");
        }

        
    }
 /// <summary>
 /// 记录音乐下载日志文件
 /// </summary>
 /// <param name="filename"></param>
 /// <param name="context"></param>
    void makeDLMusicLog(string  filename,string musicname, HttpContext context)
    {

        string filePath = System.Web.HttpContext.Current.Server.MapPath("~");

        try
        {

            if (!Directory.Exists(filePath))//文件夹不存在
            {
                Directory.CreateDirectory(filePath);//创建文件夹
            }

            //  string fileName = "Suggestion_" + DateTime.Now.Year.ToString() + "_" + DateTime.Now.Month.ToString()  + ".txt";
            string fileName =filename+ ".txt";
            filePath = filePath + "\\private\\" + fileName;
            System.Web.HttpBrowserCapabilities browser = context.Request.Browser;
            string s = "All Infos:\n"
               + "Type: " + browser.Type + "\n"
               + "Name: " + browser.Browser + "\n"
               + "IP: " + context.Request.UserHostAddress.ToString() + "\n"//获取远程客户端主机IP
               + "URL: " + context.Request.Url.ToString() + "\n"           //获取有关当前请求的URL的信息。   
               + "refURL: " + context.Request.UrlReferrer.ToString() + "\n"   //获取有关客户端上次请求的URL的信息，该请求链接到当前的    URL。   
               + "UserAgent: " + context.Request.UserAgent.ToString() + "\n"       //获取客户端浏览器的原始用户代理信息。   

               + "DNSName: " + context.Request.UserHostName.ToString() + "\n"    //获取远程客户端的DNS名称。   
               + "UserLanguages: " + context.Request.UserLanguages.ToString() + "\n"   //获取客户端语言首选项的排序字符串数组。

               + "browserVersion= " + browser.Version + "\n"//获取客户端浏览器的版本号
               //+ "Major Version = " + browser.MajorVersion + "\n"//获取客户端浏览器的（主）版本号
               //+ "Minor Version = " + browser.MinorVersion + "\n"//获取客户端浏览器的版本号
               + "Platform: " + browser.Platform + "\n"//获取客户端使用平台的名字

               + "IsCrawler: " + browser.Crawler + "\n"//是否爬虫
               //+ "Is AOL = " + browser.AOL + "\n"
               + "IsWin16: " + browser.Win16 + "\n"
               + "IsWin32: " + browser.Win32;
            if (File.Exists(filePath))
            {
                using (StreamWriter sw = File.AppendText(filePath))
                {
                    sw.WriteLine(DateTime.Now.ToString());
                    sw.WriteLine(s);
                    sw.WriteLine("musicName: " + musicname); 
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
                    sw.WriteLine(s);
                    sw.WriteLine("musicName: " + musicname);
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