﻿using CLINICAL.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.Interface.Interfaces
{
    public interface IUserRepository:IGenericRepository<User>
    {
    }
}
