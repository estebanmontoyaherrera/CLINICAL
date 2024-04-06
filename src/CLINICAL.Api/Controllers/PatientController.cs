using CLINICAL.Application.UseCase.UseCases.Patient.Queries.GetAllQuery;
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
    }
}
