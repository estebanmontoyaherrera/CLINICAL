using CLINICAL.Application.UseCase.UseCases.Exam.Queries.GetByIdQuery;
using CLINICAL.Application.UseCase.UseCases.Patient.Queries.GetAllQuery;
using CLINICAL.Application.UseCase.UseCases.Patient.Queries.GetByIdQuery;
using CLINICAL.Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace CLINICAL.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PatientController : ControllerBase
    {
        private readonly IMediator _mediator;

        public PatientController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("ListPatients")]
        public async Task<IActionResult> ListPatients()
        {
            var response = await _mediator.Send(new GetAllPatientQuery());
            return Ok(response);
        }

        [HttpGet("{patientId:int}")]
        public async Task<IActionResult> ExamById(int patientId)
        {
            var response = await _mediator.Send(new GetPatientByIdQuery() { PatientId = patientId });
            return Ok(response);
        }
    }
}
