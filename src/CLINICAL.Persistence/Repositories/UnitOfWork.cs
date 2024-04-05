using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Persistence.Repositories;

public class UnitOfWork : IUnitOfWork
{
    public IGenericRepository<Analysis> Analysis { get; }

    public IGenericRepository<Exam> Exam { get; }

    public UnitOfWork(IGenericRepository<Analysis> analysis, IGenericRepository<Exam> exam)
    {
        Analysis = analysis;
        Exam = exam;

    }

    public void Dispose()
    {
        GC.SuppressFinalize(this);
    }

}