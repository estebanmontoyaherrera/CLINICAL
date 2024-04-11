using CLINICAL.Application.UseCase.UseCases.Exam.Commands.CreateCommand;
using CLINICAL.Application.UseCase.UseCases.Medic.Commands.CreateCommand;
using CLINICAL.Application.UseCase.UseCases.Medic.Queries.GetAllQuery;
using CLINICAL.Application.UseCase.UseCases.Medic.Queries.GetByIdQuery;
using CLINICAL.Application.UseCase.UseCases.Patient.Queries.GetByIdQuery;
using CLINICAL.Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace CLINICAL.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicController : ControllerBase
    {
        private readonly IMediator _mediator;

        public MedicController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("ListMedic")]
        public async Task<IActionResult> ListPatients()
        {
            var response = await _mediator.Send(new GetAllMedicQuery());
            return Ok(response);
        }

        [HttpGet("{medicId:int}")]
        public async Task<IActionResult> MedicById(int medicId)
        {
            var response = await _mediator.Send(new GetMedicByIdQuery() { MedicId = medicId });
            return Ok(response);
        }

        [HttpPost("Register")]
        public async Task<IActionResult> RegisterMedic([FromBody] CreateMedicCommand command)
        {
            var response = await _mediator.Send(command);
            return Ok(response);
        }
    }
}
