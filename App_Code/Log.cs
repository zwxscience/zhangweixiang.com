using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
namespace zwx { 
/// <summary>
/// Summary description for Log
/// </summary>
public static class Log
{
    public static void writeLog(string log)
    {

        if (!Directory.Exists(PublicSet.FilePosition + "//runLogs"))
        {
            Directory.CreateDirectory(PublicSet.FilePosition + "//runLogs");
        }
        writeFile(ref log);

    }
    //写文件
    private static bool writeFile(ref string info)
    {
        try
        {
            string fileName = System.DateTime.Now.GetDateTimeFormats('D')[0].ToString() + ".log";
            info = "[ " + DateTime.Now.ToString() + " ]\t" + info;
            StreamWriter sw = File.AppendText(PublicSet.FilePosition + "//runLogs//" + fileName);
            sw.WriteLine(info.ToString());
            sw.Close();
            return true;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            return false;
        }
    }
}
}