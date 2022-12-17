	
	function update(id){
	

	var input = document.querySelectorAll("input");
	var but =  document.getElementsByName("action");
	var row = document.querySelectorAll("tr");
	var delet = "";
	var del = "";
	var Srow = "";
	var update = "";

	for(var i = 0 ; i < but.length ; i++){
		if(but[i].value === "update" && but[i].classList[0] == id){
			update = but[i];	
		}
		
	}
		
	for(var i = 0 ; i < row.length ; i++){
		if(row[i].classList[0] == id){	
			Srow = row[i];			
			Srow.style = "background-color: #b5b5b544;"
		}
	}
	
	for(var i = 0 ; i < input.length ; i++){
	if(input[i].classList[0] == id){	
		if(input[i].disabled){
			input[i].disabled = false;
		}
		
		if(input[i].value === "delete"){
			delet = input[i];
			delet.value ="cancel";
			
		}
	
	}
	
	update.onclick = function(){
		
		Srow.style = "background-color: white;"
		this.type="submit";
		delet.value = "delete";
	}	
	

}
}

	
	
	/* --- Start Alert --- */
	
	var alertDiv = document.getElementById("alert");
	
	

	function alert(result){
		
		
		var count = 10;
		
		
		var text = document.createElement("p");
		
		var icon = document.createElement("i");		
		
		icon.classList.add("fa-solid");	
	
	
		if(result === 1){
			 
			 icon.classList.add("fa-circle-check");
			 icon.classList.remove("fa-circle-xmark");
			 alertDiv.classList.add("alertG");
			 alertDiv.classList.remove("alertR");

			 
			 text.innerText = "OPERATION SUCCEEDED";
			 
			
			alertDiv.appendChild(icon); 
			 alertDiv.appendChild(text);
			
			
		}else if(result === -1){
			
			 icon.classList.add("fa-circle-xmark");
			 icon.classList.remove("fa-circle-check");
			 
			 alertDiv.classList.remove("alertG");
			 alertDiv.classList.add("alertR");
			 text.innerText = "OPERATION FAILED";

			alertDiv.appendChild(icon); 
			alertDiv.appendChild(text);
			
			
		}else{
			
			alertDiv.style.opacity  = "0%";
		}
		
	}	

	
	
	var count = 5;	
	
	function countDown(){
			
 	if(count != 0){
		
		count -= 1;
		
	}else{
		
		clearInterval(counter);
		alertDiv.style.opacity  = "0%";
		
	}
	}
			
	var counter = setInterval(countDown,1000);

			/* --- End Alert --- */

