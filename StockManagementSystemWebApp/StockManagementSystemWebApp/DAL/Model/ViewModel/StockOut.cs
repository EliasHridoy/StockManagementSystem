using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Model.ViewModel
{
    [Serializable]
    public class StockOut
    {
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public string CompanyName { get; set; }
        public int Quantity { get; set; }
        public int AvailableQuantity { get; set; }


    }
}