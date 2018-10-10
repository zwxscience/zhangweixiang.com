using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
 namespace zwx{
/// <summary>
/// Summary description for PublicSet
/// </summary>
     public static class PublicSet
     {
         public static string BasePath = System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase;
         public static string VisitFilePosition = BasePath + "//" + ConfigurationManager.AppSettings["VisitfilePath"];
		 public static string visitXmlPath = BasePath + "//" + ConfigurationManager.AppSettings["visitXmlPath"];
         public static string FilePosition =BasePath + "//" + ConfigurationManager.AppSettings["filePath"];
       
     //    private static string visitFilePosition;
     //    private static string filePosition;
     //    private static string basePath;

     //    /// <summary>
     //    /// 网站根目录
     //    /// </summary>
     //    public static string BasePath
     //    {
     //        get { return basePath ; }
     //        set
     //        {
     //            try
     //            {
     //                basePath = System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase;
     //            }
     //            catch
     //            {
     //                basePath = "";
     //            }  
     //        }
     //    }

     //    /// <summary>
     //    /// 存放文件的位置
     //    /// </summary>
          
     //    public static string FilePosition
     //    {
     //        get { return filePosition; }
     //        set
     //        {
     //            try
     //            {
     //                filePosition = BasePath + "//" + ConfigurationManager.AppSettings["filePath"];
     //            }
     //            catch
     //            {
     //                filePosition = "";
     //            }  
     //        }
     //    }
     ///// <summary>
     //    /// 存放访问记录单位文件位置
     //    /// </summary>
     //    public static string VisitFilePosition
     //    {
     //        get { return visitFilePosition; }
     //        set
     //        {
     //            try
     //            {
     //                visitFilePosition = BasePath + "//" + ConfigurationManager.AppSettings["VisitfilePath"];
     //            }
     //            catch
     //            {
     //                visitFilePosition = "";
     //            }
     //        }
     //    }

       
       
 
     }
}