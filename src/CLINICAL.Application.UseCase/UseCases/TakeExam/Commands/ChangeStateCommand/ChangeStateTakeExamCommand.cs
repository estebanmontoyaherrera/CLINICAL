using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.UseCases.TakeExam.Commands.ChangeStateCommand
{
    public class ChangeStateTakeExamCommand : IRequest<BaseResponse<bool>>
    {
        public int TakeExamId { get; set; }
        public int State { get; set; }
    }
}
