using System;

namespace MFin.DataAccessLayer.Utility
{
    public class Shared
    {
        public static string ConnectionString
        {
            get { return System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"]; }
        }
    }
}
