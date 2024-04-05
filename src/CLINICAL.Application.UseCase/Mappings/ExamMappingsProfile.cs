using AutoMapper;
using CLINICAL.Application.Dtos.Exam.Response;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class ExamMappingsProfile :Profile
    {
        public ExamMappingsProfile()
        {
            CreateMap<Exam, GetExamByIdResponseDto>()
            .ReverseMap();
        }
    }
}
