using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.BLL
{
    public class CategoryManager
    {
        CategoryGateway categoryGateway = new CategoryGateway();




        public string UpdateCategoryById(Category category)
        {
            int rowEffect = categoryGateway.UpdateCategoryById(category);
            if (rowEffect > 0)
            {
                return "Update Successful";
            }
            else
            {
                return "Update Faild -_-";
            }
        }


        public Category ShowACategoryById(int id)
        {
            return categoryGateway.ShowACategoryById(id);
        }




        public List<Category> ShowAll()
        {

            return categoryGateway.ShowAll();

        }
        public string Save(Category catagory)
        {

            int rowEffect = categoryGateway.Save(catagory);
            if (rowEffect > 0)
            {
                return "Save Successful";
            }
            else
            {
                return "Dulplicate Category Not Allowed";
            }

        }
    }
}