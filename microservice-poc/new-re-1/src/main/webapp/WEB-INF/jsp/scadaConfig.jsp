<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
	
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	


<section class="content" style="padding: 0 50px 0 20px;">

	<div class="scadaconfig">
		<div class="col-md-12">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs userTabs">
					<li class="active"><a href="#scadaConfig" data-toggle="tab"
						title="SCADA Config" pagename="">SCADA Configuration</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="scadaConfiguartion">
						<div class="row">
							<div class="col-sm-12">
								<div class="box">
									<div class="box-body scadaConfig"
										style="overflow: hidden; zoom: 1">
										<div class="form-horizontal row">
											<div class="addUpdate">
												<div class="box-body" style="margin-top: 10px;">
													<div class="col-sm-12">
														<div class="form-group ">
															<label for="sourceType" class="col-sm-4 control-label">Source:
																<span class="required" title="Mandatory">*</span>
															</label>
															<div class="col-sm-8">
																<select class="form-control sourceName">
																	<option value="">-Select Source-</option>
																	<option value="SOLAR">SOLAR</option>
																	<option value="WIND">WIND</option>
																</select>
															</div>
														</div>
													</div>
												</div>




												<div class="col-sm-12">
													<div class="form-group ">
														<label for="poolingStation" class="col-sm-4 control-label">Pooling
															Station: <span class="required" title="Mandatory">*</span>
														</label>
														<div class="col-sm-8">
															<select class="form-control poolingStation">
																<option value="">-Select Pooling Station-</option>
																<c:forEach var="poolingStation" items="${poolingStationList}">
																	<option value="${poolingStation.name}">
																		${poolingStation.name}</option>
																</c:forEach>

															</select>
														</div>
													</div>
												</div>





												<div class="col-sm-12">
													<div class="form-group ">
														<label for="scadaAutomationRule"
															class="col-sm-4 control-label">Scada Automation
															Rule : <span class="required" title="Mandatory">*</span>
														</label>
														<div class="col-sm-8">
															<select class="form-control scadaAutomationRule">
																<option value="">-Scada Automation Rule-</option>
																
																<c:forEach var="scadaConfigurations" items="${scadaConfigurationsList}">
																	<option value="${scadaConfigurations.configName}">
																		${scadaConfigurations.configName}</option>
																</c:forEach>

															</select>
														</div>
													</div>
												</div>


												<div class="col-sm-12">
													<div class="form-group ">
														<label for="filePath" class="col-sm-4 control-label">File
															Path : <span class="required" title="Mandatory">*</span>
														</label>
														<div class="col-sm-8">
															<input type="text" class="form-control filepath"
																placeholder="File Path" />
														</div>
													</div>
												</div>

												<div class="col-sm-12">
													<div class="box-footer1 frombtn">
														<button type="submit" class="btn btn-info pull-right"
															id="submit">Submit</button>
													</div>
												</div>


											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
</section>
<script>

$(document)
.on(
		'click',
		'#submit',
		function() {

			var jsonObject = {
					source : $('select.sourceName option:selected').val(),
					poolingStation : $('select.poolingStation option:selected').val(),
					scadaAutomationRule : $('select.scadaAutomationRule option:selected').val(),
					filePath : $('input.filepath').val() != null ? $(
					'input.headerText').val()
					: null,
			}

			var urldata = '/scadaConfig';
			AjaxCalling(urldata, jsonObject);
		});


function AjaxCalling(methodName, jsondata) {
	try {
		$.ajax({
			type : "POST",
			url : methodName,
			data :JSON.stringify(jsondata),
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				console.log(data)
				//responseData(data)
				// console.log(data.mailSendStatus,'Resp')
				// console.log(data.emailStatus,'Resp')

			}
		});
	} catch (ex) {
		console.log(ex, 'Error')
		responseData(null)
	}

}

</script>