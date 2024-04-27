using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.CreateCommand
{
    public class CreateDocumentTypeCommand : IRequest<BaseResponse<bool>>
    {
        public string? Document { get; set; }
    }
}
