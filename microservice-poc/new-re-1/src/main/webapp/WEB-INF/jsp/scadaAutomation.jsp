<%-- <%@include file="../includes/header.jsp"%> --%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<style>
#addMastFileUpload {
	padding: 8px 12px;
}
/* .mastFileUploadBox{margin-bottom: 0px;} */
.uploadProgressBar, #fileUploadFormUid {
	display: none;
	margin-bottom: 0px;
	margin-top: 5px;
}

.progress-bar {
	-webkit-transition: width 2.5s ease;
	transition: width 2.5s ease;
}

.errorMsg {
	color: #dd4b39;
	margin-top: 5px;
	display: inline-block;
}

.error {
	border: 1px solid #dd4b39 !important;
}

.fileStatusUpload {
	display: none;
	border: 1px solid green;
	color: green;
	padding: 8px 5px;
	font-size: 13px;
	margin-bottom: -35px;
	position: relative;
	z-index: 999;
	background: #d7f5d7;
	text-align: left;
	overflow: hidden;
	zoom: 1;
}

.fileStatusUpload span {
	float: right;
	color: red;
	cursor: pointer;
}

.sheetNumber {
	display: none;
}

#scadaTabBox .tab-pane {
	display: none !important;
	visibility: hidden !important;
}

.borderTable {
	margin: 10px 10px;
	border-right: 1px solid #e4dede;
	border-top: 1px solid #999;
	width: 98% !important;
}

.borderTable tr td {
	border-bottom: 1px solid #e4dede;
	border-left: 1px solid #e4dede;
	padding: 2px 5px;
}

.borderTable tr th {
	border-bottom: 1px solid #fff;
	border-left: 1px solid #fff;
	padding: 2px 5px;
	background: #3c8dbc;
	color: #fff;
}

.tableScada {
	margin: 10px 10px;
	border-right: 1px solid #3c8dbc;
	border-top: 1px solid #3c8dbc;
	width: 98%;
}

.tableScada tr td, .tableScada tr th {
	border-bottom: 1px solid #3c8dbc;
	border-left: 1px solid #3c8dbc;
	padding: 2px 5px;
}

#scadaTabBox .tab-pane.active {
	display: block !important;
	visibility: visible !important;
}

#scadaTabBox .tab-pane {
	box-shadow: none !important;
}

.tableScada tbody tr:first-child th {
	background: #3c8dbc;
	color: #fff;
	border-bottom-color: #fff;
	border-left-color: #fff;
	text-align: center;
}

#dynamicSCADATab h2 {
	font-size: 15px;
	font-weight: bold;
	border-bottom: 1px solid #3c8dbc;
	margin-top: 0px;
}

.tableData {
	max-height: 200px;
	overflow: auto;
}

.tableSelection {
	margin: 10px 10px;
	width: 100%;
}

.tableSelection select {
	width: 90%;
	padding: 2px 10px;
}

#dynamicSCADATab {
	padding-bottom: 15px;
}

.deleteConfig {
	margin-right: 5px;
}

.disp-none {
	display: none !important;
}
</style>

<!--CONTENT CONTAINER-->
<!--===================================================-->
<div id="content-container">
	<!--Breadcrumb-->
	<%-- <ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}${PageName.HOME}">Home</a></li>
		<li class="active">Manual Operations</li>
	</ol> --%>
	<!--End breadcrumb-->
	<!--Page content-->
	<!--===================================================-->
	<ol class="breadcrumb">
		<li><a href="dashboard">Home</a></li>
		<li class="active">Configuration</li>
		<li class="active">SCADA Automation</li>
	</ol>
	<section class="content activePrivilage33"
		style="padding: 0 50px 0 20px;">
		<div class="row">
			<div class="col-md-12">
				<!-- Custom Tabs -->
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs userTabs">
						<li class="active"><a href="#scadaAutomation"
							data-toggle="tab" title="SCADA Automation" pagename="">SCADA
								Automation</a></li>
					</ul>
					<div class="tab-content">
						<!--scadaAutomation -->
						<div class="tab-pane active" id="scadaAutomation">
							<div class="row">
								<div class="col-sm-12">
									<div class="box">
										<div class="box-body scadaFileUploadFields"
											style="overflow: hidden; zoom: 1">

											<form name="detailsadd" action="fileUploadScadaAutomation"
												id="scadaAutomationForm">
												<div class="form-horizontal row">
													<div class="addUpdate">
														<div class="box-body" style="margin-top: 10px;">
															<div class="col-sm-6">
																<div class="form-group ">
																	<label for="sdlcname" class="col-sm-4 control-label">Source:
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

															<div class="col-sm-6">
																<div class="form-group ">
																	<label for="sdlcname" class="col-sm-4 control-label">Rule
																		Name: <span class="required" title="Mandatory">*</span>
																	</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control ruleName"
																			placeholder="Rule Name.." />
																	</div>
																</div>
															</div>

															<div class="col-sm-6">
																<div class="form-group ">
																	<label for="fileType" class="col-sm-4 control-label">File
																		Type: <span class="required" title="Mandatory">*</span>
																	</label>
																	<div class="col-sm-8">
																		<select class="form-control fileType" name="fileType">
																			<option value="">-Select File Type</option>
																			<option value="CSV">CSV</option>
																			<option value="XLX">XLX</option>
																			<option value="XML">XML</option>
																			<option value="TXT">TXT</option>
																			<option value="HTML">HTML</option>
																		</select>
																	</div>
																</div>
															</div>

															<div class="col-sm-6">
																<div class="form-group ">
																	<label for="delimination"
																		class="col-sm-4 control-label">Delimination
																		on: <span class="required" title="Mandatory">*</span>
																	</label>
																	<div class="col-sm-8">
																		<select class="form-control delimination"
																			name="delimination">
																			<option value="">-Select Delimination-</option>
																			<option value="/t">Tab</option>
																			<option value=",">Comma</option>
																			<option value=";">Semicolon</option>
																			<option value=" ">Space</option>
																		</select>
																	</div>
																</div>
															</div>

															<div class="col-sm-6">
																<div class="form-group ">
																	<label for="hasHeader" class="col-sm-4 control-label">Has
																		Header: <span class="required" title="Mandatory">*</span>
																	</label>
																	<div class="col-sm-8">
																		<select class="form-control hasHeader"
																			name="hasHeader">
																			<option value="">-Select Has Header-</option>
																			<option value="true">Yes</option>
																			<option value="false">No</option>
																		</select>
																	</div>
																</div>
															</div>

															<div class="col-sm-6 forHeader disp-none">
																<div class="form-group ">
																	<label for="sdlcname" class="col-sm-4 control-label">Header
																		Index: <span class="required" title="Mandatory">*</span>
																	</label>
																	<div class="col-sm-8">
																		<input type="number" class="form-control headerIndex"
																			placeholder="Header Index" />
																	</div>
																</div>
															</div>

															<div class="col-sm-6 forHeader disp-none">
																<div class="form-group ">
																	<label for="headerText" class="col-sm-4 control-label">Header
																		Text: <span class="required" title="Mandatory">*</span>
																	</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control headerText"
																			placeholder="Header Text" />
																	</div>
																</div>
															</div>

															<div class="col-sm-6 forNoHeader disp-none">
																<div class="form-group ">
																	<label for="dataIndex" class="col-sm-4 control-label">Data
																		Index: <span class="required" title="Mandatory">*</span>
																	</label>
																	<div class="col-sm-8">
																		<input type="number" class="form-control dataIndex"
																			placeholder="Data Index" />
																	</div>
																</div>
															</div>

															<div class="col-sm-6">
																<div class="form-group mastFileUploadBox">
																	<label for="sdlcname" class="col-sm-4 control-label">Choose
																		SCADA File: <span class="required" title="Mandatory">*</span>
																	</label>
																	<div class="col-sm-6">
																		<p class="fileStatusUpload">
																			File Uploaded Successfully.<span
																				title="Delete Uploaded File">X</span>
																		</p>
																		<input type="file" name="file"
																			class="form-control fileDetail" /> <span
																			class="errorMsg"></span>
																		<!-- Progress Bar -->
																		<div id="alertMsg"
																			style="color: red; font-size: 18px;"></div>
																		<div class="progress uploadProgressBar">
																			<div id="progressBar"
																				class="progress-bar progress-bar-success progress-bar-striped progress-bar-animated"
																				role="progressbar" aria-valuenow="0"
																				aria-valuemin="0" aria-valuemax="100"
																				style="width: 0%">0%</div>
																		</div>
																		<!-- Progress Bar -->
																	</div>
																	<div class="col-sm-2">
																		<div class="box-footer1 frombtn">
																			<button type="submit" class="btn btn-info pull-right"
																				id="addMastFileUpload">Upload</button>
																		</div>
																	</div>
																</div>
															</div>


														</div>
													</div>
												</div>
											</form>
											<div class="row" style="margin-left: 10px;">
												<!-- SCADA Dynamic Tab -->
												<div id="dynamicSCADATab" style="margin-top: -25px;"></div>
												<!-- SCADA Dynamic Tab -->
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

		<!--End page content-->
</div>
<!--===================================================-->
<!--END CONTENT CONTAINER-->
<%-- <%@include file="../includes/footer.jsp"%> --%>
<script type="text/javascript">
	var scadaTabHtml = '<h2>File Preview</h2><div class="nav-tabs-custom" >';
	scadaTabHtml += '<ul class="nav nav-tabs" id="scadaTab"></ul>';
	scadaTabHtml += '<div class="tab-content" id="scadaTabBox"></div></div>';

	var tableSelection = '<div class="tableConfig"><table class="tableSelection"><thead><tr><th>Table Selection</th><th>SCADA File Type</th><th>SCADA Interval</th></tr></thead>';
	tableSelection += '<tbody><tr>';
	tableSelection += '<td><select class="form-control"><option value="">-Select Table Name-</option><option value="1">Actual-Gen</option></select></td>';
	tableSelection += '<td><select class="form-control"><option value="">-Select SCADA File-</option><option value="1">10 Mint</option><option value="2">15 Mint</option></select></td>';
	tableSelection += '<td><select class="form-control"><option value="">-Select SCADA File-</option><option value="1">10 Mint</option><option value="2">15 Mint</option></select></td>';
	tableSelection += '</tr></tbody></table></div>';

	var fileHeaders = '<select class="colHeader form-control"><option value="">-Select Header-</option></select>';
	var fileHeadersOption = '';
	var sampleValues = '<input type="text" placeholder="0.00" class="colSampleVal form-control" />';
	var databaseColumn = '<select class="colDBColumn form-control"><option value="">-Select DB Column-</option><option value="timestamp">timestamp</option><option value="scada_power">scada_power</option><option value="wind_speed">wind_speed</option><option value="wind_direction">wind_direction</option></select>';
	var databaseUnit = '<select class="colUnit form-control"><option value="">-Select Unit-</option><option value="formate">mm/dd/yyyy hh:mm:ss</option><option value="kw">KW</option><option value="mw">MW</option></select>';
	var addButton = '<a class="btn btn-success btn-xs addConfig" data-toggle="tooltip" title="Add New"><i class="fa fa-fw fa-plus"></i></a>';
	var removeButton = '<a class="btn btn-danger btn-xs deleteConfig" data-toggle="tooltip" title="Remove" ><i class="fa fa-fw fa-remove"></i></a>';

	var tableSelectionConfig = '<table class="tableSelection tableSelectionConfig borderTable"><thead><tr><th class="header-name">Header Name</th><th>Sample Value</th><th>DB Column Name</th><th>Unit</th><th class="add-rmv-btn">Action</th></tr></thead>';
	tableSelectionConfig += '<tbody><tr>';
	tableSelectionConfig += '<td class="header-name">' + fileHeaders + '</td>';
	tableSelectionConfig += '<td>' + sampleValues + '</td>';
	tableSelectionConfig += '<td>' + databaseColumn + '</td>';
	tableSelectionConfig += '<td>' + databaseUnit + '</td>';
	tableSelectionConfig += '<td class="add-rmv-btn"></td>';
	tableSelectionConfig += '</tr></tbody></table>';
	tableSelectionConfig += '<div class="saveBtnDiv" style="padding-bottom: 30px;"><button type="button" class="btn btn-success saveBtn pull-right" style="margin-right: 25px;">Submit</button></div>';

	$(function() {

		$(document)
				.on(
						"change",
						".tableScada input[type='checkbox']",
						function() {
							var allSelectedName = [];
							$(document)
									.find(
											".tableScada tr:first-child th input[type='checkbox']:checked")
									.each(
											function() {
												allSelectedName.push({
													name : $(this)
															.closest("th")
															.attr("name"),
													index : $(this).closest(
															"th").index()
												});
											});
							allSelectedName = uniqueJSONList(allSelectedName);

							$(".tableSelectionConfig").closest('.tableConfig')
									.find('.saveBtnDiv').remove();
							$(".tableSelectionConfig").remove();
							$(".tableConfig").append(tableSelectionConfig);
							fileHeadersOption = jsonToSelectOptionHtml(allSelectedName);
							$(
									".tableConfig .tableSelectionConfig tbody tr:last-child")
									.find(".colHeader").html(fileHeadersOption);
							addConfigButton();
						});

		/* Add New Config */
		$(document)
				.on(
						"click",
						".addConfig",
						function(event) {
							event.stopImmediatePropagation();
							if (fileHeadersOption != "") {
								var configAdd = '<tr><td class="header-name">'
										+ fileHeaders
										+ '</td><td>'
										+ sampleValues
										+ '</td><td>'
										+ databaseColumn
										+ '</td><td>'
										+ databaseUnit
										+ '</td><td class="add-rmv-btn"></td></tr>';
								$(".tableConfig .tableSelectionConfig tbody")
										.append(configAdd);
								$(
										".tableConfig .tableSelectionConfig tbody tr:last-child")
										.find(".colHeader").html(
												fileHeadersOption);
								addConfigButton();
							}
						});
		/* Delete  Config */
		$(document).on("click", ".deleteConfig", function(event) {
			event.stopImmediatePropagation()
			var r = confirm("Are you sure want to delete?");
			if (r == true) {
				$(this).closest("tr").remove();
				addConfigButton();
			}
		});

		// File Type Validation respect to File Type	
		$('#scadaAutomationForm input[type=file]').change(
				function(e) {
					$(".uploadProgressBar").hide();
					$(document).find(".fileDetail").closest(".col-sm-6").find(
							".errorMsg").html("")
					$(document).find(".fileDetail").removeClass("error");
					var allowedFiles = [ "csv", "xlsx", "xls" ];
					if ($.inArray($(this).val().split('.').pop().toLowerCase(),
							allowedFiles) == -1) {
						$(document).find(".fileDetail").closest(".col-sm-6")
								.find(".errorMsg").html(
										"Please upload file having extensions "
												+ allowedFiles.join(', ')
												+ " only.")
						$(document).find(".fileDetail").addClass("error");
						$('#scadaAutomationForm #addMastFileUpload').attr(
								"disabled", true);
						$(this).val('');
					} else {
						$(document).find(".fileDetail").closest(".col-sm-6")
								.find(".errorMsg").html("")
						$(document).find(".fileDetail").removeClass("error");
						$('#alertMsg').text('');
						$('#scadaAutomationForm #addMastFileUpload').attr(
								"disabled", false);
					}
				});

		$('#scadaAutomationForm #addMastFileUpload')
				.click(
						function(e) {
							e.preventDefault();
							//Disable submit button
							$('#alertMsg').text('');
							$("#dynamicSCADATab").html("");
							if ($('#scadaAutomationForm input[type=file]')
									.val() != "") {
								$(this).prop('disabled', true);
								$('#scadaAutomationForm #addMastFileUpload')
										.attr("disabled", true);
								$(".uploadProgressBar").show();
								var form = document.forms[0];
								var formData = new FormData(form);
								var fileExt = $(
										"#scadaAutomationForm input[type=file]")
										.val().split('.').pop().toLowerCase();
								var urldata = '/fileUploadScadaAutomation/';
								// Ajax call for file uploaling
								var ajaxReq = $
										.ajax({
											url : '/fileUploadScadaAutomation/'
													+ fileExt,
											type : 'POST',
											crossDomain : true,
											data : formData,
											cache : false,
											contentType : false,
											processData : false,
											xhr : function() {
												//Get XmlHttpRequest object
												var xhr = $.ajaxSettings.xhr();
												//Set onprogress event handler 
												xhr.upload.onprogress = function(
														event) {
													var perc = Math
															.round((event.loaded / event.total) * 100);
													$('#progressBar').text(
															perc + '%');
													$('#progressBar')
															.css('width',
																	perc + '%');
												};
												return xhr;
											},
											beforeSend : function(xhr) {
												//Reset alert message and progress bar
												$('#alertMsg').text('');
												$('#progressBar').text('');
												$('#progressBar').css('width',
														'0%');
											}
										});

								// Called on success of file upload
								ajaxReq
										.done(function(msg) {
											//$('#alertMsg').text(msg);
											$('input[type=file]').val('');
											$('button[type=submit]').prop(
													'disabled', false);
											$(
													'#scadaAutomationForm #addMastFileUpload')
													.attr("disabled", false);
											$(".uploadProgressBar").hide();
											//Bind Table with Tab
											bindSCADAFiletoTable(msg);
										});

								// Called on failure of file upload
								ajaxReq
										.fail(function(jqXHR) {
											//Bind Table with Tab
											bindSCADAFiletoTable('');
											$('button[type=submit]').prop(
													'disabled', false);
											$(
													'#scadaAutomationForm #addMastFileUpload')
													.attr("disabled", false);
											$(".uploadProgressBar").hide();
										});
							} else {
								$(document).find(".fileDetail").closest(
										".col-sm-6").find(".errorMsg").html(
										"Please choose a file .")
								$(document).find(".fileDetail").addClass(
										"error");
							}
						});
	});

	function addConfigButton() {
		var countSchedule = $(".tableConfig .tableSelectionConfig tbody tr").length;
		if (countSchedule == 1) {
			$(".tableConfig .tableSelectionConfig tbody tr td:last-child")
					.html('').append(addButton);
		} else if (countSchedule > 1) {
			$(".tableConfig .tableSelectionConfig tbody tr td:last-child")
					.html(removeButton);
			$(
					".tableConfig .tableSelectionConfig tbody tr:last-child td:last-child")
					.html('').append(removeButton + addButton);
		}
	}

	function uniqueJSONList(list) {
		var result = [];
		$.each(list, function(i, e) {
			if ($.inArray(e.name, result.name) == -1)
				result.push(e);
		});
		return result;
	}

	function jsonToSelectOptionHtml(jsonData) {
		var result = '<option value="">-Select Header-</option>';
		$
				.each(
						jsonData,
						function(i) {
							result += '<option value="'+jsonData[i].name+'" columnIndex="'+jsonData[i].index+'">'
									+ jsonData[i].name + '</option>';
						});
		return result;
	}
	function bindSCADAFiletoTable(jsonData) {
		try {
			if (typeof (jsonData) == "string" && jsonData != "null") {
				jsonData = JSON.parse(jsonData);
			}
		} catch (e) {
			console.log("SCADA Automation Response JSON Parse Error: " + e)
		}

		console.log(jsonData, "REP")
		$("#dynamicSCADATab").html(scadaTabHtml);
		if (jsonData)
			$
					.each(
							jsonData.Scada_file,
							function(i, elem) {
								if (elem.tab_name != undefined) {
									//Tab Html
									var tabName = elem.tab_name;
									var tabID = "tab" + i;
									if (i == 0) {
										$(document)
												.find(
														"#dynamicSCADATab #scadaTab")
												.append(
														'<li class="active"><a href="#'+tabID+'" data-toggle="tab" title="'+tabName+'" >'
																+ tabName
																+ '</a></li>');
										$(document)
												.find(
														"#dynamicSCADATab #scadaTabBox")
												.append(
														'<div class="tab-pane active" id="'+tabID+'"></div>');
									} else {
										$(document).find(
												"#dynamicSCADATab #scadaTab")
												.append(
														'<li><a href="#'+tabID+'" data-toggle="tab" title="'+tabName+'" >'
																+ tabName
																+ '</a></li>');
										$(document)
												.find(
														"#dynamicSCADATab #scadaTabBox")
												.append(
														'<div class="tab-pane" id="'+tabID+'"></div>')
									}
									//Bind Table
									if (elem.Sheet_Data != undefined) {
										var tableHtml = '<div class="tableData"><table  class="tableScada"><tbody>';
										$
												.each(
														elem.Sheet_Data,
														function(d, elm) {
															if (elm) {
																tableHtml += '<tr>';
																if ($(
																		'select.hasHeader option:selected')
																		.text() == 'Yes'
																		&& d == 0) {
																	$
																			.each(
																					elm,
																					function(
																							ind) {
																						//if(elm[ind]!=null && elm[ind]!=""){
																						tableHtml += '<th name="'+elm[ind]+'"><label><input class=" " type="checkbox" /></label><br/>'
																								+ elm[ind]
																								+ '</th>';
																						//}
																					});
																} else {
																	$
																			.each(
																					elm,
																					function(
																							ind) {
																						//if(elm[ind]!=null && elm[ind]!=""){
																						tableHtml += '<td>'
																								+ elm[ind]
																								+ '</td>';
																						//}
																					});
																}
																tableHtml += '</tr>';
															}
														})
										tableHtml += '</tbody></table></div>';
										$(document).find(
												"#dynamicSCADATab #scadaTabBox  #"
														+ tabID)
												.html(tableHtml);
									}
									//Bind Table
								} else {

									var tableHtml = '';
									if (i == 0) {
										var tabName = "CSV File";
										var tabID = "tab" + i;
										$(document)
												.find(
														"#dynamicSCADATab #scadaTab")
												.append(
														'<li class="active"><a href="#'+tabID+'" data-toggle="tab" title="'+tabName+'" >'
																+ tabName
																+ '</a></li>');
										$(document)
												.find(
														"#dynamicSCADATab #scadaTabBox")
												.append(
														'<div class="tab-pane active" id="'+tabID+'"><div class="tableData"><table id="scadaCSV" class="tableScada"><tbody></tbody></table></div></div>');

									}
									//Bind Table
									tableHtml = '';
									if (elem) {
										tableHtml += '<tr>';
										if ($(
												'select.hasHeader option:selected')
												.text() == 'Yes'
												&& i == 0) {
											$
													.each(
															elem,
															function(ind) {
																//if(elem[ind]!=null && elem[ind]!=""){
																tableHtml += '<th name="'+elem[ind]+'"><label><input class="" type="checkbox" /></label><br/>'
																		+ elem[ind]
																		+ '</th>';
																//}
															});
										} else {
											$.each(elem, function(ind) {
												//if(elem[ind]!=null && elem[ind]!=""){
												tableHtml += '<td>' + elem[ind]
														+ '</td>';
												//}
											});
										}
										tableHtml += '</tr>';
									}
									$(document).find("#dynamicSCADATab").find(
											"#scadaCSV tbody")
											.append(tableHtml);
									//Bind Table
								}
							});

		$(document).find("#dynamicSCADATab").append(tableSelection);
	}

	$(document).on('change', 'select.hasHeader', function() {
		if ($('select.hasHeader option:selected').text() == 'No') {
			$('.forNoHeader').removeClass('disp-none');
			$('.forHeader').addClass('disp-none');
		}

		if ($('select.hasHeader option:selected').text() == 'Yes') {
			$('.forNoHeader').addClass('disp-none');
			$('.forHeader').removeClass('disp-none');
		}

	});

	$(document).on('change', 'select.colHeader', function() {
		var colIndx = $(this).find('option:selected').attr('columnIndex');
		$(this).closest('tr').find('.colSampleVal').attr('index', colIndx);
	})

	function checkCreatedRow(tableId, value) {
		var count = 0
		$(tableId).find('tbody tr').each(
				function() {
					var indxVal = parseInt($(this).find('.colSampleVal').attr(
							'index'));
					if (indxVal == value) {
						count = 1
					}
				});
		return count
	}

	$(document)
			.on(
					'click',
					'.tableScada td',
					function() {
						var colIndex = $(this).index();
						var colText = $(this).text();
						if ($('select.hasHeader option:selected').text() == 'No') {
							if (!$('.tableSelectionConfig').length) {
								console.log('if')
								$(".tableSelectionConfig").remove();
								$(".tableConfig").append(tableSelectionConfig);
								addConfigButton();
								$('.tableSelectionConfig')
										.find('.colSampleVal').attr('index',
												colIndex);
								$('.tableSelectionConfig').find(
										'tr:last-child .colSampleVal').attr(
										'disabled', true);
								$('.tableSelectionConfig')
										.find('.colSampleVal').val(colText);

							} else {
								console.log('else', availRow)
								var availRow = checkCreatedRow(
										'.tableSelectionConfig', colIndex);
								if (availRow == 0) {
									$('.addConfig').trigger('click');
									$('.tableSelectionConfig').find(
											'tr:last-child .colSampleVal')
											.attr('index', colIndex);
									$('.tableSelectionConfig').find(
											'tr:last-child .colSampleVal')
											.attr('disabled', true);
									$('.tableSelectionConfig').find(
											'tr:last-child .colSampleVal').val(
											colText);
								}
							}

							fileHeadersOption = 1
							$('.tableSelectionConfig').find('.header-name')
									.remove();
							$('.tableSelectionConfig').find('.add-rmv-btn')
									.hide()
						}
					});

	$(document).on('click', '.tableScada th', function() {
		var colIndex = $(this).index();
	})

	$(document)
			.on(
					'click',
					'.saveBtn',
					function() {
						var configObj = {};
						$('.tableSelectionConfig tbody')
								.find('tr')
								.each(
										function() {
											var dbColName = $(this)
													.find(
															'select.colDBColumn option:selected')
													.val();
											configObj[dbColName] = {
												headerName : $(this)
														.find(
																'select.colHeader option:selected')
														.val(),
												columnIndex : $(this).find(
														'input.colSampleVal')
														.attr('index'),
												dbColumnName : $(this)
														.find(
																'select.colDBColumn option:selected')
														.val(),
												columnUnit : $(this)
														.find(
																'select.colUnit option:selected')
														.val(),
											}
										})

						console.log(configObj, "configObjconfigObj", JSON.parse($('select.hasHeader option:selected').val()))
						var jsonObject = {
							source : $('select.sourceName option:selected').val(),
							configName : $('input.ruleName').val(),
							fileType : {
								fileTypeName : $(
										'select.fileType option:selected')
										.val(),
								delimeter : $(
										'select.delimination option:selected')
										.val(),
								hasHeader : JSON.parse($(
										'select.hasHeader option:selected')
										.val()),
								headerIndex : $('input.headerIndex').val()? parseInt($(
										'input.headerIndex').val())
										: null,
								headerText : $('input.headerText').val() != null ? $(
										'input.headerText').val()
										: null,
								dataIndex : $('input.dataIndex').val() ? parseInt($('input.dataIndex').val())
										: null,
							},
							dataMapping : configObj
						}

						console.log(jsonObject, "jsonObject jsonObject")
						var urldata = '/save';
						AjaxCalling(urldata, jsonObject);

					})

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

</section>