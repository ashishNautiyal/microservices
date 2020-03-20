<%-- <%@include file="../includes/header.jsp"%> --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#addMastFileUpload{padding: 8px 12px;}
.mastFileUploadBox{margin-bottom: 0px;}
.uploadProgressBar,#fileUploadFormUid{display: none;margin-bottom: 0px; margin-top: 5px;}
.progress-bar { -webkit-transition: width 2.5s ease; transition: width 2.5s ease;}
.errorMsg { color: #dd4b39; margin-top: 5px;  display: inline-block;}
.error{border: 1px solid #dd4b39!important;}
.fileStatusUpload{display: none; border: 1px solid green; color:green;  padding: 8px 5px; font-size: 13px;  margin-bottom: -35px;  position: relative;  z-index: 999; background: #d7f5d7; text-align: left;  overflow: hidden;  zoom: 1;}
.fileStatusUpload span{float: right;color: red;cursor: pointer;}
.sheetNumber{display:none;}
#scadaTabBox .tab-pane{display: none!important;visibility: hidden!important;}

.borderTable{margin: 10px 10px;border-right: 1px solid #e4dede;border-top: 1px solid #999;width:98%!important;}
.borderTable tr td{border-bottom: 1px solid #e4dede;border-left: 1px solid #e4dede;padding: 2px 5px;}
.borderTable tr th{border-bottom: 1px solid #fff;border-left: 1px solid #fff;padding: 2px 5px;background: #3c8dbc; color: #fff; }

.tableScada{margin: 10px 10px;border-right: 1px solid #3c8dbc;border-top: 1px solid #3c8dbc;width:98%;}
.tableScada tr td,.tableScada tr th{border-bottom: 1px solid #3c8dbc;border-left: 1px solid #3c8dbc;padding: 2px 5px;}
#scadaTabBox .tab-pane.active{display:block!important; visibility: visible!important;}
#scadaTabBox .tab-pane{box-shadow: none!important;}
.tableScada tbody tr:first-child td{background: #3c8dbc; color: #fff;border-bottom-color:#fff;border-left-color:#fff;text-align: center;}
#dynamicSCADATab h2{font-size: 15px;font-weight: bold; border-bottom: 1px solid #3c8dbc; margin-top: 0px;}
.tableData{max-height: 200px;overflow: auto;}

.tableSelection{margin: 10px 10px;width: 100%;}
.tableSelection select{width: 90%;padding: 2px 10px;}
#dynamicSCADATab{padding-bottom: 15px;}
.deleteConfig{margin-right: 5px;}
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
<section class="content activePrivilage33">
	<div class="row">
		<div class="col-md-12">
			<!-- Custom Tabs -->
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs userTabs">
					<li class="active"><a href="#scadaAutomation" data-toggle="tab" title="SCADA Automation" pagename="">SCADA Automation</a></li>
				</ul>
				<div class="tab-content">
						<!--scadaAutomation -->
					<div class="tab-pane active" id="scadaAutomation">
						<div class="row">
							<div class="col-xs-12">

								<div class="box">

									<div class="box-body scadaFileUploadFields" style="overflow:hidden;zoom:1">
				
 <form:form name="detailsadd" action="fileUploadScadaAutomation" id="scadaAutomationForm">
	<div class="form-horizontal ">
	<div class="addUpdate">
	<div class ="box-body">
	
					 <div class="form-group ">
                        <label for="sdlcname" class="col-sm-3 control-label">Source: <span class="required" title="Mandatory">*</span></label>
                         <div class="col-sm-6">
                         	<select class="form-control sourceName">
								<option value="">-Select Source-</option>
								<option value="SOLAR">SOLAR</option>
								<option value="WIND">WIND</option>
							</select>
                         </div>
                        <div class="col-sm-3"></div>
                   </div>
                   
                    <div class="form-group ">
                        <label for="sdlcname" class="col-sm-3 control-label">Rule Name: <span class="required" title="Mandatory">*</span></label>
                         <div class="col-sm-6">
                         	<input type="text" class="form-control ruleName" placeholder="Rule Name.." />
                         </div>
                        <div class="col-sm-3"></div>
                   </div>
         
                    <div class="form-group mastFileUploadBox">
                        <label for="sdlcname" class="col-sm-3 control-label">Choose SCADA File: <span class="required" title="Mandatory">*</span></label>
                         <div class="col-sm-6">
                         	<p class="fileStatusUpload">File Uploaded Successfully.<span title="Delete Uploaded File">X</span></p>
                            <input type="file" name="file" class="form-control fileDetail" />
                            <span class="errorMsg"></span>
                            <!-- Progress Bar -->
                             <div id="alertMsg" style="color: red;font-size: 18px;"></div>
	                            <div class="progress uploadProgressBar">   <div id="progressBar" class="progress-bar progress-bar-success progress-bar-striped progress-bar-animated"  role="progressbar"   aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">0%</div>   </div>
							<!-- Progress Bar -->
                         </div>
                        <div class="col-sm-3">
                        <div class="box-footer1 frombtn">
					<button type="submit" class="btn btn-info pull-right" id="addMastFileUpload">Upload</button>
				</div>
                        </div>
                   </div>
					
</div>
</div>

</div>

	</form:form> 
	<br/>
	<!-- SCADA Dynamic Tab -->
			<div id="dynamicSCADATab" style="margin-top: -25px;"></div>
			<!-- SCADA Dynamic Tab -->
									</div>
								</div>
							</div>
						</div>
					</div>
						<!--scadaAutomation -->
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
var scadaTabHtml='<h2>File Preview</h2><div class="nav-tabs-custom" >';
scadaTabHtml+='<ul class="nav nav-tabs" id="scadaTab"></ul>';
scadaTabHtml+='<div class="tab-content" id="scadaTabBox"></div></div>';

var tableSelection='<div class="tableConfig"><table class="tableSelection"><thead><tr><th>Table Selection</th><th>SCADA File Type</th><th>SCADA Interval</th></tr></thead>';
tableSelection+='<tbody><tr>';
tableSelection+='<td><select><option value="">-Select Table Name-</option><option value="1">Actual-Gen</option></select></td>';
tableSelection+='<td><select><option value="">-Select SCADA File-</option><option value="1">10 Mint</option><option value="2">15 Mint</option></select></td>';
tableSelection+='<td><select><option value="">-Select SCADA File-</option><option value="1">10 Mint</option><option value="2">15 Mint</option></select></td>';
tableSelection+='</tr></tbody></table></div>';

var fileHeaders='<select class="colHeader"><option value="">-Select Header-</option></select>';
var fileHeadersOption='';
var sampleValues='<input type="text" placeholder="0.00" class="colSampleVal" />';
var databaseColumn='<select calss="colDBColumn"><option value="">-Select DB Column-</option><option value="tm">timestamp</option><option value="mp">meter_power</option></select>';
var databaseUnit='<select class="colUnit"><option value="">-Select Unit-</option><option value="formate">mm/dd/yyyy hh:mm:ss AM/PM</option><option value="kw">KW</option></select>';
var addButton='<a class="btn btn-success btn-xs addConfig" data-toggle="tooltip" title="Add New"><i class="fa fa-fw fa-plus"></i></a>';
var removeButton='<a class="btn btn-danger btn-xs deleteConfig" data-toggle="tooltip" title="Remove" ><i class="fa fa-fw fa-remove"></i></a>';

var tableSelectionConfig='<table class="tableSelection tableSelectionConfig borderTable"><thead><tr><th>Header Name</th><th>Sample Value</th><th>DB Column Name</th><th>Unit</th><th>Action</th></tr></thead>';
tableSelectionConfig+='<tbody><tr>';
tableSelectionConfig+='<td>'+fileHeaders+'</td>';
tableSelectionConfig+='<td>'+sampleValues+'</td>';
tableSelectionConfig+='<td>'+databaseColumn+'</td>';
tableSelectionConfig+='<td>'+databaseUnit+'</td>';
tableSelectionConfig+='<td></td>';
tableSelectionConfig+='</tr></tbody></table>';


$(function() {
	
	$(document).on("change",".tableScada input[type='checkbox']",function(){
		var allSelectedName=[];
		$(document).find(".tableScada tr:first-child td input[type='checkbox']:checked").each(function(){
			allSelectedName.push($(this).closest("td").attr("name"));
		});
		allSelectedName=uniqueJSONList(allSelectedName);
		
		$(".tableSelectionConfig").remove();
		$(".tableConfig").append(tableSelectionConfig);
		fileHeadersOption=jsonToSelectOptionHtml(allSelectedName);
		$(".tableConfig .tableSelectionConfig tbody tr:last-child").find(".colHeader").html(fileHeadersOption);
		addConfigButton();
	});
	
	/* Add New Config */
	$(document).on("click",".addConfig",function(event){
		 event.stopImmediatePropagation();
		 if(fileHeadersOption!=""){
			var configAdd='<tr><td>'+fileHeaders+'</td><td>'+sampleValues+'</td><td>'+databaseColumn+'</td><td>'+databaseUnit+'</td><td></td></tr>';
			$(".tableConfig .tableSelectionConfig tbody").append(configAdd);
			$(".tableConfig .tableSelectionConfig tbody tr:last-child").find(".colHeader").html(fileHeadersOption);
			addConfigButton();
		 }
	});
	/* Delete  Config */
	$(document).on("click",".deleteConfig",function(event){
		event.stopImmediatePropagation() 
		var r = confirm("Are you sure want to delete?");
		if (r == true) {
		    $(this).closest("tr").remove();
		    addConfigButton();
		} 
	});
	
		 
	// File Type Validation respect to File Type	
	$('#scadaAutomationForm input[type=file]').change(function(e) {
		$(".uploadProgressBar").hide();
		$(document).find(".fileDetail").closest(".col-sm-6").find(".errorMsg").html("")
    	$(document).find(".fileDetail").removeClass("error");
		var allowedFiles = ["csv","xlsx","xls"];
	    if ($.inArray($(this).val().split('.').pop().toLowerCase(), allowedFiles) == -1) {
	    	$(document).find(".fileDetail").closest(".col-sm-6").find(".errorMsg").html("Please upload file having extensions "+ allowedFiles.join(', ') +" only.")
	    	$(document).find(".fileDetail").addClass("error");
	    	$('#scadaAutomationForm #addMastFileUpload').attr("disabled",true);
	    	$(this).val('');
	    } else{
    		$(document).find(".fileDetail").closest(".col-sm-6").find(".errorMsg").html("")
        	$(document).find(".fileDetail").removeClass("error");
    		$('#alertMsg').text('');
    		$('#scadaAutomationForm #addMastFileUpload').attr("disabled",false);
	    }
	}); 
	
	
	$('#scadaAutomationForm #addMastFileUpload').click(function(e) {
		e.preventDefault();
		//Disable submit button
		$('#alertMsg').text('');
		$("#dynamicSCADATab").html("");
		if($('#scadaAutomationForm input[type=file]').val()!=""){
			$(this).prop('disabled',true);
			$('#scadaAutomationForm #addMastFileUpload').attr("disabled",true);
			$(".uploadProgressBar").show();
			var form = document.forms[0];
			var formData = new FormData(form);
				var fileExt = $("#scadaAutomationForm input[type=file]").val().split('.').pop().toLowerCase();
				var filePath = "home/anurag/Desktop/scada_auto_upload"
			// Ajax call for file uploaling
			var ajaxReq = $.ajax({
				url : 'fileUploadScadaAutomation/'+fileExt,
				type : 'POST',
				 crossDomain: true,
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				xhr: function(){
					//Get XmlHttpRequest object
					 var xhr = $.ajaxSettings.xhr() ;
					//Set onprogress event handler 
					 xhr.upload.onprogress = function(event){
						var perc = Math.round((event.loaded / event.total) * 100);
						$('#progressBar').text(perc + '%');
						$('#progressBar').css('width',perc + '%');
					 };
					 return xhr ;
				},
				beforeSend: function( xhr ) {
					//Reset alert message and progress bar
					$('#alertMsg').text('');
					$('#progressBar').text('');
					$('#progressBar').css('width','0%');
	            }
			});
	
			// Called on success of file upload
			ajaxReq.done(function(msg) {
				//$('#alertMsg').text(msg);
				$('input[type=file]').val('');
				$('button[type=submit]').prop('disabled',false);
				$('#scadaAutomationForm #addMastFileUpload').attr("disabled",false);
				$(".uploadProgressBar").hide();
				//Bind Table with Tab
				bindSCADAFiletoTable(msg);
			});
			
			// Called on failure of file upload
			ajaxReq.fail(function(jqXHR) {
				//Bind Table with Tab
				bindSCADAFiletoTable('');
				$('button[type=submit]').prop('disabled',false);
				$('#scadaAutomationForm #addMastFileUpload').attr("disabled",false);
				$(".uploadProgressBar").hide();
			});
		}else{
			$(document).find(".fileDetail").closest(".col-sm-6").find(".errorMsg").html("Please choose a file .")
	    	$(document).find(".fileDetail").addClass("error");
		}
	});
});

function addConfigButton(){
	var countSchedule=$(".tableConfig .tableSelectionConfig tbody tr").length;
	if(countSchedule==1){
		$(".tableConfig .tableSelectionConfig tbody tr td:last-child").html('').append(addButton);
		}else if(countSchedule>1){
			$(".tableConfig .tableSelectionConfig tbody tr td:last-child").html(removeButton);
			$(".tableConfig .tableSelectionConfig tbody tr:last-child td:last-child").html('').append(removeButton+addButton);
		}
}

function uniqueJSONList(list) {
    var result = [];
    $.each(list, function(i, e) {
        if ($.inArray(e, result) == -1) result.push(e);
    });
    return result;
}

function jsonToSelectOptionHtml(jsonData){
	var result ='<option value="">-Select Header-</option>';
    $.each(jsonData, function(i) {
    	result +='<option value="'+jsonData[i]+'">'+jsonData[i]+'</option>';
    });
    return result;
}
function bindSCADAFiletoTable(jsonData){
	try{
		if(typeof(jsonData)=="string" && jsonData!="null"){
			jsonData=JSON.parse(jsonData);
		}
	}catch(e){ console.log("SCADA Automation Response JSON Parse Error: "+e) }
	
	console.log(jsonData,"REP")
	$("#dynamicSCADATab").html(scadaTabHtml);
	if(jsonData)
	 $.each(jsonData.Scada_file,function(i,elem){
			if(elem.tab_name!=undefined){
				//Tab Html
				var tabName=elem.tab_name;
				var tabID="tab"+i;
				if(i==0){
					$(document).find("#dynamicSCADATab #scadaTab").append('<li class="active"><a href="#'+tabID+'" data-toggle="tab" title="'+tabName+'" >'+tabName+'</a></li>');
					$(document).find("#dynamicSCADATab #scadaTabBox").append('<div class="tab-pane active" id="'+tabID+'"></div>');
				}else{
					$(document).find("#dynamicSCADATab #scadaTab").append('<li><a href="#'+tabID+'" data-toggle="tab" title="'+tabName+'" >'+tabName+'</a></li>');
					$(document).find("#dynamicSCADATab #scadaTabBox").append('<div class="tab-pane" id="'+tabID+'"></div>')
				}
				//Bind Table
				if(elem.Sheet_Data!=undefined){
					var tableHtml='<div class="tableData"><table  class="tableScada"><tbody>';
					$.each(elem.Sheet_Data,function(d,elm){
						if(elm){
							 tableHtml+='<tr>';
							 if(d==0){
								$.each(elm,function(ind){
									//if(elm[ind]!=null && elm[ind]!=""){
										tableHtml+='<td name="'+elm[ind]+'"><label><input type="checkbox" /></label><br/>'+elm[ind]+'</td>';
									//}
								});
							 }else{
								 $.each(elm,function(ind){
									//if(elm[ind]!=null && elm[ind]!=""){
										tableHtml+='<td>'+elm[ind]+'</td>';
									//}
								}); 
							 }
							tableHtml+='</tr>';
						}
					})
					tableHtml+='</tbody></table></div>';
					$(document).find("#dynamicSCADATab #scadaTabBox  #"+tabID).html(tableHtml);
				}
				//Bind Table
			}else{

				var tableHtml='';
				if(i==0){
					var tabName="CSV File";
					var tabID="tab"+i;
					$(document).find("#dynamicSCADATab #scadaTab").append('<li class="active"><a href="#'+tabID+'" data-toggle="tab" title="'+tabName+'" >'+tabName+'</a></li>');
					$(document).find("#dynamicSCADATab #scadaTabBox").append('<div class="tab-pane active" id="'+tabID+'"><div class="tableData"><table id="scadaCSV" class="tableScada"><tbody></tbody></table></div></div>');
					
				}
				//Bind Table
				 tableHtml='';
					if(elem){
						 tableHtml+='<tr>';
						 if(i==0){
								$.each(elem,function(ind){
									//if(elem[ind]!=null && elem[ind]!=""){
										tableHtml+='<td name="'+elem[ind]+'"><label><input type="checkbox" /></label><br/>'+elem[ind]+'</td>';
									//}
								});
							 }else{
								$.each(elem,function(ind){
									//if(elem[ind]!=null && elem[ind]!=""){
										tableHtml+='<td>'+elem[ind]+'</td>';
									//}
								});
							 }
						tableHtml+='</tr>';
					}
					$(document).find("#dynamicSCADATab").find("#scadaCSV tbody").append(tableHtml);
			//Bind Table
			}
	});
	 
	 $(document).find("#dynamicSCADATab").append(tableSelection);
}
</script>

</section>