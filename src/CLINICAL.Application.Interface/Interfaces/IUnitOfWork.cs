using CLINICAL.Domain.Entities;
using System.Transactions;

namespace CLINICAL.Application.Interface.Interfaces;

public interface IUnitOfWork : IDisposable
{
    IGenericRepository<Analysis> Analysis { get; }
    IExamRepository  Exam { get; }

    IPatientRepository Patient { get; }

    IMedicRepository Medic { get; }

    ITakeExamRepository TakeExam { get; }

    IDocumentTypeRepository DocumentType { get; }

    IResultRepository Result { get; }

    TransactionScope BeginTransaction();

    IUserRepository User { get; }
   

}