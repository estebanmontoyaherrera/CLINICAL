using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;

namespace CLINICAL.Application.UseCase.UseCases.Exam.Commands.RemoveCommand
{
    public class DeleteExamCommand : IRequest<BaseResponse<bool>>
    {
        public int ExamId { get; set; }
    }
}
