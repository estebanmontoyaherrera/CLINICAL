﻿using CLINICAL.Application.Dtos.Patient.Response;
using CLINICAL.Application.Dtos.TakeExam.Response;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Domain.Entities;
using CLINICAL.Persistence.Context;
using Dapper;
using System.Data;

namespace CLINICAL.Persistence.Repositories
{
    public class TakeExamRepository : GenericRepository<TakeExam>, ITakeExamRepository
    {
        private readonly ApplicationDbContext _context;
        public TakeExamRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<GetAllTakeExamResponseDto>> GetAllTakeExams(string storedProcedure, object parameter)
        {
            using var connection = _context.CreateConnection;
            var objectParam = new DynamicParameters(parameter);
            var takeExams = await connection.QueryAsync<GetAllTakeExamResponseDto>(storedProcedure, param: objectParam, commandType: CommandType.StoredProcedure);
            return takeExams;
        }
    }
}
