using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.UpdateCommand
{
    public class UpdateDocumentTypeCommand : IRequest<BaseResponse<bool>>
    {
        public int? DocumentTypeId { get; set; }
        public string? Document { get; set; }
    }
}
