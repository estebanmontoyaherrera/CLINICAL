using CLINICAL.Application.Dtos.Exam.Response;
using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.UseCases.Exam.Queries.GetAllQuery
{
    public class GetAllExamQuery : IRequest<BaseResponse<IEnumerable<GetAllExamResponseDto>>>
    {

    }
}
