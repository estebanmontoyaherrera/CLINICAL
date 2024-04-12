using CLINICAL.Application.Dtos.Patient.Response;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Domain.Entities;
using CLINICAL.Persistence.Context;
using Dapper;
using System.Data;
using System.Reflection.Metadata;

namespace CLINICAL.Persistence.Repositories
{
    public class PatientRepository : GenericRepository<Patient>, IPatientRepository
    {
        private readonly ApplicationDbContext _context;
        public PatientRepository(ApplicationDbContext context) : base (context) 
        {
            _context = context;
        }
        public async Task<IEnumerable<GetAllPatientResponseDto>> GetAllPatients(string storedProcedure, object parameter)
        {
            using var connection = _context.CreateConnection;
            var objectParam = new DynamicParameters(parameter);
            var patients = await connection.QueryAsync<GetAllPatientResponseDto>(storedProcedure, param: objectParam, commandType: CommandType.StoredProcedure);
            return patients;
        }
    }
}
