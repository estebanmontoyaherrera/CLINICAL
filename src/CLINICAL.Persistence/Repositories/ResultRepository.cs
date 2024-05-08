using CLINICAL.Application.Dtos.DocumentType.Response;
using CLINICAL.Application.Dtos.Result.Response;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Domain.Entities;
using CLINICAL.Persistence.Context;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Persistence.Repositories
{
    public class ResultRepository : GenericRepository<Result>, IResultRepository
    {
        private readonly ApplicationDbContext _context;
        public ResultRepository(ApplicationDbContext context):base(context)
        {
            _context = context;
        }
        public async Task<IEnumerable<GetAllResultResponseDto>> GetAllResults(string storedProcedure, object parameter)
        {
            using var connection = _context.CreateConnection;
            var objectParam = new DynamicParameters(parameter);
            var results = await connection.QueryAsync<GetAllResultResponseDto>(storedProcedure, param: objectParam, commandType: CommandType.StoredProcedure);
            return results;
        }
    }
}
