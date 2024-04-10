using AutoMapper;
using CLINICAL.Application.Dtos.Patient.Response;
using CLINICAL.Application.UseCase.UseCases.Patient.Commands.CreateCommand;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class PatientMappingsProfile : Profile
    {
        public PatientMappingsProfile()
        {
            CreateMap<Patient, GetPatientByIdResponseDto>()
            .ReverseMap();

            CreateMap<CreatePatientCommand, Patient>();
            //CreateMap<UpdateExamCommand, Exam>();
            //CreateMap<ChangeStateExamCommand, Exam>();
        }
    }
}
