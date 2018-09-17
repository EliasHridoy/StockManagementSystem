using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Model
{
    public class ItemSetup
    {

        public int CatagoryId { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }

        public string ItemName { get; set; }
        public int ReorderLevel { get; set; }
        public int AvailableQuantity { get; set; }
        public ItemSetup()
        {
            AvailableQuantity = 0;
            ReorderLevel = 0;
        }
    }
}