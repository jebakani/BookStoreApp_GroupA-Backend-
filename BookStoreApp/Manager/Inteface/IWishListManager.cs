﻿using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Manager.Inteface
{
   public interface IWishListManager
    {
        bool AddToWishList(WishListModel wishListModel);
    }
}
