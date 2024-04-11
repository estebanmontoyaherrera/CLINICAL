using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.UseCases.Patient.Commands.DeleteCommand
{
    public class DeletePatientCommand : IRequest<BaseResponse<bool>>
    {
        public int PatientId { get; set; }
    }
}
