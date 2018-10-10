using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

 namespace zwx{
/// <summary>
/// Summary description for VisitCount
/// </summary>
public static class VisitCount
{
	 
    /// <summary>
    /// 获取访问量
    /// </summary>
    /// <returns></returns>
    public static int  GetVisitCount()  {
        
        FileStream fs = new FileStream(zwx.PublicSet.VisitFilePosition, FileMode.Open, FileAccess.Read, FileShare.None); 
        StreamReader m_streamReader = new StreamReader(fs);
        string strLine = m_streamReader.ReadLine();
        m_streamReader.Close();
        m_streamReader.Dispose();
        fs.Close();
        fs.Dispose();
        return int.Parse(strLine.Trim( ));
    }
    
    /// <summary>
    /// 设定访问量
    /// </summary>
    /// <param name="count"></param>
    /// <returns></returns>
    public static string  SetVisitCount(int count)
    {
        if (File.Exists(PublicSet.VisitFilePosition))
        {
            return writeFile(ref count);


        }
        else
        {
            if (!Directory.Exists(PublicSet.FilePosition))
            {
                Directory.CreateDirectory(PublicSet.FilePosition);
            }
            return writeFile(ref count);
        }
    }
    //写文件
    private static string writeFile(ref int count)
    {
        try
        {
            FileStream fs = new FileStream(zwx.PublicSet.VisitFilePosition, FileMode.Create, FileAccess.Write, FileShare.ReadWrite);

            StreamWriter sw = new StreamWriter(fs);
            sw.Write(count.ToString());
            sw.Close();
            return "";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
}
    }