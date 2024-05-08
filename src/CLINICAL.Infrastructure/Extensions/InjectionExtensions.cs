using CLINICAL.Application.Interface.Services;
using CLINICAL.Infrastructure.Services;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Infrastructure.Extensions
{
    public static class InjectionExtensions
    {
        public static IServiceCollection AddInjectionInfrastructure(this IServiceCollection services) 
        {
            services.AddTransient<IFileStorage, FileStorage>();

            return services;
        
        }
    }
}
