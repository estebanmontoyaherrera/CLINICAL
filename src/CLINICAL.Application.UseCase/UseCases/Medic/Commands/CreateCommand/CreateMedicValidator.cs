using CLINICAL.Application.UseCase.UseCases.Exam.Commands.CreateCommand;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.UseCases.Medic.Commands.CreateCommand
{
    public class CreateMedicValidator : AbstractValidator<CreateMedicCommand>
    {
        public CreateMedicValidator()
        {
            RuleFor(x => x.Names)
           .NotNull().WithMessage("El campo Nombre no puede ser nulo.")
           .NotEmpty().WithMessage("El campo Nombre no puede ser vacío");

            RuleFor(x => x.DocumentNumber)
           .NotNull().WithMessage("El campo N° Documento no puede ser nulo.")
           .NotEmpty().WithMessage("El campo N° Documento n no puede ser vacío");


            RuleFor(x => x.Phone)
           .NotNull().WithMessage("El campo Telefono no puede ser nulo.")
           .NotEmpty().WithMessage("El campo Telefono no puede ser vacío")
           .Must(BeNumeric!).WithMessage("Campo debe contener solo números");
        }

        private bool BeNumeric(string input)
        {

            return int.TryParse(input, out _);
        }
    }
  }

