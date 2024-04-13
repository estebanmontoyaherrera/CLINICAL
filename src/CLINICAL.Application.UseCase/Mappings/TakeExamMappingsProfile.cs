using AutoMapper;
using CLINICAL.Application.Dtos.Patient.Response;
using CLINICAL.Application.Dtos.TakeExam.Response;
using CLINICAL.Application.UseCase.UseCases.Patient.Commands.ChangeStateCommand;
using CLINICAL.Application.UseCase.UseCases.Patient.Commands.CreateCommand;
using CLINICAL.Application.UseCase.UseCases.Patient.Commands.UpdateCommand;
using CLINICAL.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class TakeExamMappingsProfile:Profile
    {
        public TakeExamMappingsProfile()
        {
            CreateMap<TakeExam, GetTakeExamByIdResponseDto>()
            .ReverseMap();

            //CreateMap<CreatePatientCommand, Patient>();
            //CreateMap<UpdatePatientCommand, Patient>();
            //CreateMap<ChangeStatePatientCommand, Patient>();
        }
    }
}
