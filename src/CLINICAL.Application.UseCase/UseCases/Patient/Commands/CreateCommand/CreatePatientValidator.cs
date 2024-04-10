using FluentValidation;

namespace CLINICAL.Application.UseCase.UseCases.Patient.Commands.CreateCommand
{
    public class CreatePatientValidator : AbstractValidator<CreatePatientCommand>
    {
        public CreatePatientValidator()
        {
            RuleFor(x => x.DocumentNumber)
           .NotNull().WithMessage("El campo Documento no puede ser nulo.")
           .NotEmpty().WithMessage("El campo Documento no puede ser vacío")
           .Must(BeNumeric!).WithMessage("Campo debe contener solo números");

            RuleFor(x => x.Names)
           .NotNull().WithMessage("El campo Nombre no puede ser nulo.")
           .NotEmpty().WithMessage("El campo Nombre no puede ser vacío");

           RuleFor(x => x.Phone)
          .NotNull().WithMessage("El campo Telefono no puede ser nulo.")
          .NotEmpty().WithMessage("El campo Telefono no puede ser vacío")
          .Must(BeNumeric!).WithMessage("Campo debe contener solo números");
        }

        private bool BeNumeric(string input) {

            return int.TryParse(input, out _);
        }
    }
}
