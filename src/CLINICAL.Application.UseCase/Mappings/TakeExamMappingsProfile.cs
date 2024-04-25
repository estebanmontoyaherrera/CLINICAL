using AutoMapper;
using CLINICAL.Application.Dtos.TakeExam.Response;
using CLINICAL.Application.UseCase.UseCases.TakeExam.Commands.CreateCommand;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class TakeExamMappingsProfile:Profile
    {
        public TakeExamMappingsProfile()
        {
            CreateMap< GetTakeExamByIdResponseDto , TakeExam>()
            .ReverseMap();
            CreateMap<GetTakeExamDetailByTakeExamIdResponseDto, TakeExamDetail>()
            .ReverseMap();
            CreateMap<CreateTakeExamCommand, TakeExam>();
            CreateMap<CreateTakeExamDetailCommand, TakeExamDetail>();
            //CreateMap<ChangeStatePatientCommand, Patient>();
        }
    }
}
