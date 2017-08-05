using System;

namespace MFin.DataAccessLayer
{
    public class BaseDAL
    {
        protected string sDBErrorMessage;

        public string DBErrorMessage
        {
            get { return sDBErrorMessage; }
        }
    }
}
