using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.UseCases.Medic.Commands.ChangeStateCommand
{
    public class ChangeStateMedicCommand : IRequest<BaseResponse<bool>>
    {
        public int MedicId { get; set; }
        public int State { get; set; }
    }
}
