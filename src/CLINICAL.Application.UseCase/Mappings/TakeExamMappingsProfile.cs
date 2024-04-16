using AutoMapper;
using CLINICAL.Application.Dtos.TakeExam.Response;
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
            //CreateMap<CreatePatientCommand, Patient>();
            //CreateMap<UpdatePatientCommand, Patient>();
            //CreateMap<ChangeStatePatientCommand, Patient>();
        }
    }
}
